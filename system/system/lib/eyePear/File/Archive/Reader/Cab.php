<?php
/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * Read a CAB file without uncompressing the data
 * This is not intented to be used directly by the end user, but by the cab reader
 * which adds the uncompression layer
 *
 * PHP versions 4 and 5
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330,Boston,MA 02111-1307 USA
 *
 * @category   File Formats
 * @package    File_Archive
 * @author     Vincent Lascaux <vincentlascaux@php.net>
 * @copyright  1997-2005 The PHP Group
 * @license    http://www.gnu.org/copyleft/lesser.html  LGPL
 * @version    CVS: $Id$
 * @link       http://pear.php.net/package/File_Archive
 */

require_once "File/Archive/Reader/Archive.php";

/**
 * Read a CAB file without uncompressing the data
 * This is not intented to be used directly by the end user, but by the cab reader
 * which adds the uncompression layer
 */
class File_Archive_Reader_Cab extends File_Archive_Reader_Archive
{
    /**
     * @var array folders as described in the header of the cab file
     * @access private
     */
    var $folders = array();

    /**
     * @var int Index of the folder being read
     */
    var $folderIndex = 0;

    /**
     * @var int Index of the file being read in the current folder
     */
    var $fileIndex = 0;

    /**
     * @var int Current offset inside the folder
     */
    var $offset = 0;

    /**
     * @var int Current offset inside the block
     */
    var $blockOffset = 0;

    /**
     * @var array Header of the cabinet file
     */
    var $header = null;

    /**
     * @var string Data read from last data block
     */
    var $data = '';

    /**
     * @see File_Archive_Reader::next()
     */
    function next()
    {
        $error = parent::next();
        if (PEAR::isError($error)) {
            return $error;
        }

        if ($this->header === null) {
            $error = $this->_readHeader();
            if (PEAR::isError($error)) {
                return $error;
            }

            return !empty($this->folders);;
        } else {
            $error = $this->skip();
            if (PEAR::isError($error)) {
                return $error;
            }

            $this->fileIndex++;
            $this->blockOffset = 0;
            if ($this->fileIndex >= count(
                        $this->folders[$this->folderIndex]['files']
                    )) {
                $this->offset = 0;
                $this->folderIndex++;
                if ($this->folderIndex >= count($this->folders)) {
                    return false;
                }
            }

            return true;
        }
    }

    /**
     * Read the header at the begining of the CAB file
     */
    function _readHeader()
    {
        //This is the first time we read the file
        //Read the header
        /*
            u1  signature[4];   cabinet file signature
            u4  reserved1;      reserved
            u4  cbCabinet;      size of this cabinet file in bytes
            u4  reserved2;      reserved
            u4  coffFiles;      offset of the first CFFILE entry
            u4  reserved3;      reserved
            u1  versionMinor;   cabinet file format version, minor
            u1  versionMajor;   cabinet file format version, major
            u2  cFolders;       number of CFFOLDER entries in this cabinet
            u2  cFiles;         number of CFFILE entries in this cabinet
            u2  flags;          cabinet file option indicators
            u2  setID;          must be the same for all cabinets in a set
            u2  iCabinet;       number of this cabinet file in a set
            u2  cbCFHeader;     (optional) size of per-cabinet reserved area
            u1  cbCFFolder;     (optional) size of per-folder reserved area
            u1  cbCFData;       (optional) size of per-datablock reserved area
            u1  abReserve[];    (optional) per-cabinet reserved area
            u1  szCabinetPrev[];(optional) name of previous cabinet file
            u1  szDiskPrev[];   (optional) name of previous disk
            u1  szCabinetNext[];(optional) name of next cabinet file
            u1  szDiskNext[];   (optional) name of next disk
        */

        $this->header = $this->source->getData(36);
        if (PEAR::isError($this->header)) {
            return $this->header;
        }
        if (strlen($this->header) != 36) {
            return PEAR::raiseError('Unexpected end of CAB file');
        }

        $this->header = unpack(
            'Vsignature/Vr1/Vsize/Vr2/VoffFiles/Vr3/CversionMinor/CversionMajor/SnbFolders/SnbFiles/Sflags/SsetID/SnbCabs',
            $this->header);

        if ($this->header['signature'] != 0x4643534D) {
            return PEAR::raiseError('CAB file signature not found');
        }
        if (($this->header['flags'] & 3) != 0) {
            return PEAR::raiseError('CAB reader doesn\'t handle multiple file archives');
        }
        if (($this->header['flags'] & 4) != 0) {
            $reserved = $this->source->getData(4);
            $reserved = unpack('SresHeader/CresFolder/CresData', $reserved);
            $this->header = array_merge($this->header, $reserved);
            $this->source->skip($this->header['resHeader']);
        } else {
            $this->header['resHeader'] = 0;
            $this->header['resFolder'] = 0;
            $this->header['resData'] = 0;
        }

        //Read the folders
        for ($i=0; $i < $this->header['nbFolders']; $i++) {
            /*
                u4  coffCabStart; offset of the first CFDATA block in this folder
                u2  cCFData;      number of CFDATA blocks in this folder
                u2  typeCompress; compression type indicator
                u1  abReserve[];  (optional) per-folder reserved area
            */

            $folder = $this->source->getData(8 + $this->header['resFolder']);
            if (PEAR::isError($folder)) {
                return $folder;
            }
            if (strlen($folder) != 8 + $this->header['resFolder']) {
                return PEAR::raiseError('Unexpected end of CAB file');
            }
            $folder = unpack('Vstart/SnbData/Scompression', $folder);
            $folder['files'] = array();
            $this->folders[] = $folder;
        }

        //Read the files
        for ($i=0; $i < $this->header['nbFiles']; $i++) {
            /*
                u4  cbFile;             uncompressed size of this file in bytes
                u4  uoffFolderStart;    uncompressed offset of this file in the folder
                u2  iFolder;            index into the CFFOLDER area
                u2  date;               date stamp for this file
                u2  time;               time stamp for this file
                u2  attribs;            attribute flags for this file
                u1  szName[];           name of this file
            */
            $file = $this->source->getData(16);
            if (PEAR::isError($file)) {
                return $file;
            }
            if (strlen($file) != 16) {
                return PEAR::raiseError('Unexpected end of CAB file');
            }

            $file = unpack('Vsize/Voffset/Sfolder/Sdate/Stime/Sflags', $file);

            $name = '';
            while (ord($c = $this->source->getData(1)) != 0) {
                $name .= $c;
            }
            $file['name'] = $this->getStandardURL($name);

            $this->folders[$file['folder']]['files'][] = $file;
        }
        $this->fileIndex = 0;
        $this->folderIndex = 0;
    }

    /**
     * Uncompresses $this->data
     */
    function _uncompressData($data)
    {
        switch($this->folders[$this->folderIndex]['compression'])
        {
        case 0: break;
        case 1:
            $this->data = gzinflate(substr($this->data,2));
            break;
        case 2:
            return PEAR::raiseError('LZX compression format not supported');
        }
        if (strlen($this->data) != $data['uSize']) {
            return PEAR::raiseError('The uncompressed data does not have the good length');
        }
    }

    /**
     * Read a block of data
     */
    function _readDataBlock()
    {
        /*
            u4  csum;           checksum of this CFDATA entry
            u2  cbData;         number of compressed bytes in this block
            u2  cbUncomp;       number of uncompressed bytes in this block
            u1  abReserve[];    (optional) per-datablock reserved area
            u1  ab[cbData];     compressed data bytes
        */
        $data = $this->source->getData(8 + $this->header['resData']);
        if (PEAR::isError($data)) {
            return $data;
        }
        if (strlen($data) != 8 + $this->header['resData']) {
            return PEAR::raiseError('Unexpected end of CAB file');
        }

        $data = unpack('Vsum/Ssize/SuSize', $data);
        $this->data = $this->source->getData($data['size']);
        if (PEAR::isError($this->data)) {
            return $this->data;
        }
        if (strlen($this->data) != $data['size']) {
            return PEAR::raiseError('Unexpected end of CAB file');
        }

        return $this->_uncompressData($data);
    }

    /**
     * @see File_Archive_Reader::getData()
     */
    function getData($length = -1)
    {
        $file = $this->folders[$this->folderIndex]['files'][$this->fileIndex];
        $max = $file['offset'] + $file['size'] - $this->offset;
        if ($max == 0) {
            return null;
        }
        if ($length == 0) {
            return '';
        }
        if ($length < 0 || $length > $max) {
            $length = $max;
        }
        //Take the end of the current block
        $data = substr($this->data, $this->blockOffset);

        //And while it's not enough, read the next block
        while (strlen($data) < $length) {
            $error = $this->_readDataBlock();
            if (PEAR::isError($error)) {
                return $error;
            }

            $data .= $this->data;
        }

        //The new position in the block is end - number of byte we read after $length
        $this->blockOffset = strlen($this->data) - (strlen($data) - $length);
        $data = substr($data, 0, $length);
        $this->offset += $length;

        return $data;
    }

    /**
     * Skip some data in the folder.
     * Data skipped may span several files
     */
    function _folderSkip($length)
    {
        $skipped = strlen($this->data) - $this->blockOffset;
        $data = null;
        while ($skipped < $length) {
            $data = $this->source->getData(8 + $this->header['resData']);
            if (PEAR::isError($data)) {
                return $data;
            }
            if (strlen($data) != 8 + $this->header['resData']) {
                return PEAR::raiseError('Unexpected end of CAB file');
            }

            $data = unpack('Vsum/Ssize/SuSize', $data);
            $skipped += $data['uSize'];
            if ($skipped < $length) {
                $error = $this->source->skip($data['size']);
                if (PEAR::isError($error)) {
                    return $error;
                }
                if ($error != $data['size']) {
                    return PEAR::raiseError('Unexpected end of CAB file');
                }
            }
        }
        if ($data !== null) {
            $this->data = $this->source->getData($data['size']);
            if (PEAR::isError($this->data)) {
                return $this->data;
            }
            if (strlen($this->data) != $data['size']) {
                return PEAR::raiseError('Unexpected end of CAB file');
            }

            $error = $this->_uncompressData($data);
            if (PEAR::isError($error)) {
                return $error;
            }
        }

        $this->blockOffset = strlen($this->data) - ($skipped - $length);
        $this->offset += $length;
    }

    /**
     * @see File_Archive_Reader::skip()
     */
    function skip($length = -1)
    {
        $file = $this->folders[$this->folderIndex]['files'][$this->fileIndex];
        $max = $file['offset'] + $file['size'] - $this->offset;
        if ($length < 0 || $length > $max) {
            $length = $max;
        }

        return $this->_folderSkip($length);
    }

    /**
     * @see File_Archive_Reader::rewind()
     */
    function rewind($length = -1)
    {
        $file = $this->folders[$this->folderIndex]['files'][$this->fileIndex];
        $max = $this->offset - $file['offset'];
        if ($length < 0 || $length > $max) {
            $length = $max;
        }
        if ($length <= $this->blockOffset) {
            //Rewinding, we stay in the same block
            $this->blockOffset -= $length;
            return $length;
        }

        //Move back to the first block of the folder
        $folderOffset = $this->folders[$this->folderIndex]['start'];
        $currentOffset = $this->source->tell();
        $error = $this->source->rewind($currentOffset - $folderOffset);
        if (PEAR::isError($error)) {
            return $error;
        }
        $error = $this->_folderSkip($file['offset'] - $length);
        if (PEAR::isError($error)) {
            return $error;
        }
        return $length;
    }

    /**
     * @see File_Archive_Reader::tell()
     */
    function tell()
    {
        return $this->offset -
                $this->folders[$this->folderIndex]['files'][$this->fileIndex]['offset'];
    }

    /**
     * @see File_Archive_Reader::close()
     */
    function close()
    {
        $this->folders = array();
        $this->folderIndex = 0;
        $this->fileIndex = 0;
        $this->offset = 0;
        $this->blockOffset = 0;
        $this->header = null;
        $this->data = '';
        return parent::close();
    }

    /**
     * @see File_Archive_Reader::getFilename()
     */
    function getFilename()
    {
        return $this->folders[$this->folderIndex]['files'][$this->fileIndex]['name'];
    }
    /**
     * @see File_Archive_Reader::getStat()
     */
    function getStat()
    {
        $file = $this->folders[$this->folderIndex]['files'][$this->fileIndex];
        $stat = array(
            7 => $file['size'],
            9 => mktime(
                ($file['time'] >> 11 ),         //hour
                ($file['time'] >> 5  ) & 0x3F,  //minute
                ($file['time'] & 0x1F) * 2,     //second
                ($file['date'] >> 5  ) & 0xF,   //month
                ($file['date']       ) & 0x1F,  //day
                ($file['date'] >> 9  ) + 1980   //year
                )
            );
        $stat['size'] = $stat[7];
        $stat['mtime'] = $stat[9];
        return $stat;
    }

    /**
     * @see File_Archive_Reader::select()
     */
    function select($filename, $close = true)
    {
        $std = $this->getStandardURL($filename);

        if ($close) {
            $folderIndex = 0;
            $fileIndex = 0;
        } else {
            $folderIndex = $this->folderIndex;
            $fileIndex = $this->fileIndex+1;
        }
        if ($this->header === null) {
            $error = $this->_readHeader();
            if (PEAR::isError($error)) {
                return $error;
            }
        }

        //Iterate in order to find the right folder/file
        for (;$folderIndex < count($this->folders); $folderIndex++) {
            $folder = $this->folders[$folderIndex];
            for(;$fileIndex < count($folder['files']); $fileIndex++) {
                $file = $folder['files'][$fileIndex];
                if (
                      empty($std) ||

                    //$std is a file
                      $std == $file['name'] ||

                    //$std is a directory
                    strncmp($std.'/', $file['name'], strlen($std)+1) == 0
                  ) {
                    //The file has been found

                    //Move to its location
                    if ($folderIndex == $this->folderIndex &&
                        $fileIndex >= $this->fileIndex) {
                        //We are in the right folder and the file is later

                        if ($fileIndex == $this->fileIndex) {
                            $error = $this->rewind();
                            if (PEAR::isError($error)) {
                                return $error;
                            }
                        } else {
                            while($this->fileIndex < $fileIndex) {
                                $error = $this->next();
                                if (PEAR::isError($error)) {
                                    return $error;
                                }
                            }
                        }
                    } else {
                        //The file is not in this folder
                        //Move first to the right folder
                        $offset = $folder['start'];
                        $currentOffset = $this->source->tell();
                        if ($offset < $currentOffset) {
                            $error = $this->source->rewind($currentOffset - $offset);
                        } else {
                            $error = $this->skip($offset - $currentOffset);
                        }
                        if (PEAR::isError($error)) {
                            return $error;
                        }

                        $this->data = '';
                        $this->folderIndex = $folderIndex;
                        $this->fileIndex = 0;
                        $this->offset = 0;
                        $this->blockOffset = 0;

                        //And move to the right file
                        while ($this->fileIndex < $fileIndex) {
                            $error = $this->next();
                            if (PEAR::isError($error)) {
                                return $error;
                            }
                        }
                    }

                    return true;
                }
            }
            $fileIndex = 0;
        }

        return false;
    }
}

?>