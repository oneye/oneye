<?php
/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * Add a directory to the public name of all the files of a reader
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
 * @category  File_Formats
 * @package   File_Archive
 * @author    Vincent Lascaux <vincentlascaux@php.net>
 * @copyright 1997-2005 The PHP Group
 * @license   http://www.gnu.org/copyleft/lesser.html  LGPL
 * @version   CVS: $Id$
 * @link      http://pear.php.net/package/File_Archive
 */

require_once "File/Archive/Reader/Relay.php";

/**
 * Base class for readers that need to modify the name of files
 *
 * @category  File_Formats
 * @package   File_Archive
 * @author    Vincent Lascaux <vincentlascaux@php.net>
 * @copyright 1997-2005 The PHP Group
 * @license   http://www.gnu.org/copyleft/lesser.html  LGPL
 * @link      http://pear.php.net/package/File_Archive
 */
class File_Archive_Reader_ChangeName extends File_Archive_Reader_Relay
{
    /**
     * Constructor
     *
     * @param File_Archive_Reader &$source The archive reader to relay
     */
    function File_Archive_Reader_ChangeName(&$source)
    {
        parent::File_Archive_Reader_Relay($source);
    }

    /**
     * Modify the name
     *
     * @param string $name Name as in the inner reader
     *
     * @return string New name as shown by this reader or false is the
     *         file or directory has to be skipped
     */
    function modifyName($name)
    {
    }

    /**
     * Modify the name back to the inner reader naming style
     * If implemented, unmodifyName(modifyName($name)) should be true
     *
     * unmodifyName can be left unimplemented, this may only impact the
     * efficiency of the select function (a full look up will be done when
     * something more efficient with an index for example could be used on
     * the inner reader of the original name is known).
     *
     * unmodifyName may be provided some names that where not in the inner
     * reader and that cannot possibly be the result of modifyName. In this case
     * unmodifyName must return false.
     *
     * @param string $name Name as shown by this reader
     *
     * @return string Name as in the inner reader, or false if there is no
     *         input such that modifyName would return $name or a file in
     *         a directory called $name
     */
    function unmodifyName($name)
    {
        return null;
    }

    /**
     * Returns the name of the file currently read by the reader
     *
     * Warning: undefined behaviour if no call to next have been
     * done or if last call to next has returned false
     *
     * @return string Name of the current file
     * @see File_Archive_Reader::getFilename()
     */
    function getFilename()
    {
        return $this->getStandardURL($this->modifyName(parent::getFilename()));
    }

    /**
     * Returns the list of filenames from the current pos to the end of the
     *  source
     *
     * The source will be closed after having called this function
     * This function goes through the whole archive (which may be slow).
     * If you intend to work on the reader, doing it in one pass would be faster
     *
     * @return array filenames from the current pos to the end of the source
     * @see File_Archive_Reader::getFileList()
     */
    function getFileList()
    {
        $list   = parent::getFileList();
        $result = array();
        foreach ($list as $name) {
            $result[] = $this->modifyName($name);
        }
        return $result;
    }

    /**
     * Returns the list of filenames from the current pos to the end of the
     *  source
     *
     * The source will be closed after having called this function
     * This function goes through the whole archive (which may be slow).
     * If you intend to work on the reader, doing it in one pass would be faster
     *
     * @param string  $filename Filename to choose
     * @param boolaen $close    Do we close the source after?
     *
     * @return array filenames from the current pos to the end of the source
     * @see File_Archive_Reader::select()
     */
    function select($filename, $close = true)
    {
        $name = $this->unmodifyName($filename);
        if ($name === false) {
            return false;
        } else if ($name === null) {
            $std = $this->getStandardURL($filename);
            if (substr($std, -1)=='/') {
                $std = substr($std, 0, -1);
            }

            if ($close) {
                $error = $this->close();
                if (PEAR::isError($error)) {
                    return $error;
                }
            }
            while (($error = $this->next()) === true) {
                $sourceName = $this->getFilename();
                $sourceName = $this->modifyName(
                    $sourceName, $this->isDirectory()
                );
                $sourceName = $this->getStandardURL($sourceName);
                if (empty($std)
                    || $std == $sourceName //$std is a file
                    || (strncmp($std.'/', $sourceName, strlen($std)+1) == 0
                    && strlen($sourceName) > strlen($std)+1) //$std is a directory
                ) {
                    return true;
                }
            }
            return $error;
        } else {
            return $this->source->select($name, $close);
        }
    }
}

?>