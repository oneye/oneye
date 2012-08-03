<?php

if (basename(__FILE__) == basename($_SERVER['PHP_SELF']))
{
    exit(0);
}

echo '<?xml version="1.0" encoding="utf-8"?>';
$eyeNavIcon = '<img
src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABHNCSVQICAgIfAhkiAAAAAlwSFlz%0A%09%09%09%09%09%09AAAFMQAABTEBt+0oUgAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAABBmSURB%0A%09%09%09%09%09%09VGjexZlprCVHdcd/p6q6+9773rtvmTfzxrP5vdlsPB6DxtiBxBAzIGISQCISKFGiJFJEhPIlCUgJ%0A%09%09%09%09%09%09SGGxoiCIhPIpUgQi6wcEVkAoRDg2CjgCWxAM3j27Z94sb9/v1t1VdfKh74zfLDa2Y0hJpa7b3bf7%0A%09%09%09%09%09%09/Ov8z+l/nZJvfvObOjk5yZkzZ4gxYozBGIO1Fmvtld8iclUHMMbc8Lj5nlfbQghXOsDWrVuZn5/n%0A%09%09%09%09%09%096NGjN3ygGxoaYmpqiqWlJUIIOOew1uKcu9I3g9gM5tpz117b3FT1huNrgXrvKcsS7z0AU1NTxBhf%0A%09%09%09%09%09%09ErDb/LDXs6kqlx99/SsEqK6LKEh15qW89ooB/N3Dz7Ft6pbqFUYQuUwHQKT/kssz1x9LZdDlcXVZ%0A%09%09%09%09%09%090VhZrjGiUQHdZHx1VEBM///GXBkjMHPqeT79oaPXeexlAQztPMjE7fdUxgpXdYRN/K5eLH0kFSit%0A%09%09%09%09%09%09jlEhREQDEiLEiBYejVoZLKBS3RYV1BjEGUySgLVYZ8AInSLckHIvC0ARYqzcqv3ZvzKrV8D0DVUQ%0A%09%09%09%09%09%09BCH2b1DERwgl4j02RiwRUUV9JIRAjEroU0qBoIAxYC0hKTGJI6auArOJTi8LYDO/FEOIlYEXT53n%0A%09%09%09%09%09%090vw6AG+953ai6QNgM7DYn/WIhIgUOaYsSQlkIlgLIShFURK9UnglElERtO9WlQgmYKJDQyT6SEgu%0A%09%09%09%09%09%090+4VxMDVgSfVC3uec5dKROoAXLi4zvYdzU000r5XKh5IWeCKHFeW1CXSyAxZ5lCFri+IPpLnntxH%0A%09%09%09%09%09%09VME4h3H9WAFEHBIj6vvBHwLq9dV7ICqEAC5x7NiypSIr0Khl+KAvUqkPQmNEigLb7WJjSU0itcRQ%0A%09%09%09%09%09%09TxKyzBKikhcGVaX0EV9E1AiJVcD2WRLRGAlewWhFOaNUWeBVxkBQg/cVhSb2Na/KNiFUeUMEMIDX%0A%09%09%09%09%09%09ijLdDq7IySTgEoMVcEZwxiCiJE4wYjBX8lPfINEqkCNEAtqnk00sNqH/klcbxFH6MSBI//yLaVSv%0A%09%09%09%09%09%09xICWEfEl0u6Q5B0y8VgjGAupScgSIXECQRAMMUaiRsQKEiGESMwDPighBuLl9GoNiUIqgvIKg/jq%0A%09%09%09%09%09%09GOjPdJ/jIoJeNvxKnlfwHjpd0labTAvSVHAiJNZRqzmy1GGN4H0k+EBeBkofiQhRheiVWHqKEAhV%0A%09%09%09%09%09%092kPEgFGCQkQ2M+hl21UANlPoV3oPsXV0iFa7y3fTd76Y1TRCt8BstLF5F+MUiQZrHYMNx1AjoZZY%0A%09%09%09%09%09%09vAiq/RRrBOscVoQyKN4HijJQ+Ei88m1QkHAFQBn01QNQFWJUQDiwd5KdN02wtr7Od07pixmo9Gi3%0A%09%09%09%09%09%09i2t3IBSViMtSGpmjOZgx0EgRK4QA1hisszTqGdYGiqj4IlDmnp6P+KAoghgqsAaiCmojIcqrBxCj%0A%09%09%09%09%09%09EHzF97PnznHp4kXanTZFMoFxScX/ooRWF9PuEqVAXYo10Mgcg/WENDEEBAkKIqSJodFIUGPIuyV5%0A%09%09%09%09%09%09Gej6SO6rINZNbDdqKn0UquB+DRQSylg98D/ivVAqxghGXAVMI7GXo+ttYqtDkkKWCGVI+tlJUAWv%0A%09%09%09%09%09%09ELT6mhvrSByIBMqgdIpArwwUQfsaSiD2aaYgKuR5oF28BgqFKASvfVVYJb6IoP1vgIaI73p8O4eN%0A%09%09%09%09%09%09HE2rbJfUA+u9yGAZkbQyPiBVwEslUXxUyvAix7UvXapsYQgByhAJMWKsRdW8thi4nIWMBqK1mNCB%0A%09%09%09%09%09%09pF59M30glJGy8ITcoxG8MZisZKBTMpxH1IXKkyg+Cj4o3SLQ8xEF0tRSRMFLIETIS+0Hs2LEYC8r%0A%09%09%09%09%09%09Ul4DgBAg+IhQctfQCzw5E3n7los85N/VT59K9IGoSkRoF5GcgG2XDLU9Ix1Pga34DagR8qC08oo+%0A%09%09%09%09%09%09GItNDN3zsyw8fYadIzV2Dab4wpNmKa6e8PyxWS4sblDfM0b4jYlXB6BbQloqzib88ILjbfwDjy29%0A%09%09%09%09%09%09lzDUD7SgBB8qT6mpqBJgI4+sdQLL7ZIsQBG0rzQteYi0i0g7j8wcP0fv+bMcffsB9v7+3Rw/Nsv6%0A%09%09%09%09%09%09ek6rnROjMn12icF6yqHJcYIIH/3k97l16hk+9Ju7XxLAVX5q5cJyK7K4Hhh44es86D/C+7d9mV43%0A%09%09%09%09%09%090CuVooiEaCgCFAF6AdolbOTKctszu5KzsF6y0gksdwJzGznzGyXL6znnvv0Yh2zB7/7WXRy4ZTvH%0A%09%09%09%09%09%09T8xxca7F7FKLZ04ucvLcCmotXisJZi3sP7SHlmT86Sce5aY9H/vAz46BCDFU2ePYnj9DBP5m5u8R%0A%09%09%09%09%09%09AVNGKBXtRkJXyXuBECKSCr4XsRuemOU0gyGrJxhnKIKyOLdKeuwEv/6r+3GpZerANnwE/9wsQ2OD%0A%09%09%09%09%09%09nJ3dgEbG1Bt2kGUJJ56eJnG2im1rSeoJv/SOOzj5bPPfJm7+i/vnzn3+/pf0gGKIsYqFGLXqgX7v%0A%09%09%09%09%09%09521xqHVgHFiLGotH6JSR1T6N1rqBVh5Z2yjoPfYkb3vLXlrdgvVOCdbio7L/1puQNKEnBldLeO65%0A%09%09%09%09%09%09GYaHa9x59xS37N/G1okhTpyc48wLS7RbOfsOT8qhI1Ofmdjz8T9/SQ+ImKu8oby4AlNA1AKmAuAc%0A%09%09%09%09%09%09BAPGoFJllm6haC/Qw1PzyurDj/Kh9x1mZSNno11y5M07UIQQhfpQndGxBlN7Rtm1Zws//ek5fITv%0A%09%09%09%09%09%09PXqWPC9wRCRGmo2MIkZ2jw9ydqDGtj3jn9u662M/Wbjwhe9c5wFuUBXQvuQNEaIqAUs0CbgUsRYx%0A%09%09%09%09%09%09FsQRsXgViiB0CmX2sSe5+46deFWW13qoNezYNYqzQlazrK13+NJXf0InCj988iLdUpmZWyH3Hh8j%0A%09%09%09%09%09%09Nk1YaXuWupHz821emGmR1euMbxuW0S3Nr9+QQsjL596KQhZ1GWpTsAlYh9jKExEhYCmLwGivhUss%0A%09%09%09%09%09%09qxs5QYT73v0G6vWUbhFZ7XiSRoM73riLffsnuPfeN2AG66y1CoI1NEcHSBop3hlWW11W1trMzq3y%0A%09%09%09%09%09%097POzHD+xwIHb9wxNHvjLz14HQG4EQCP4vN9L0GpVJa4qS6gqMUSiD/gyEIqS1R8+zuTN42x0Sto9%0A%09%09%09%09%09%09z1137mZ0bJBuEcAYhgYygir3vHUvI2MDzC62GNkyyInZNmk9ZS0PXFrpEo0lyarJcQMZtcE6wxMj%0A%09%09%09%09%09%095CZly8Ton1wXAzekUNEiTD+2qUJVlU3UF6gvIUaiEaIVgjGUzuCW24gZp52XTG7dihhD0VefAWh1%0A%09%09%09%09%09%09SxJnGR8dYGGtx8J6l+PnVlBn6GgkGkNSd2AMvrQUZcHSYpcde7fhjCXmXdLhRmP/7Z96m7m+YnYN%0A%09%09%09%09%09%09ALFEW6+6axBdg5A0iMlA/3edaGsEyfCSETSh1wk88ugLDDXrnDi3zNJaXpVRYqWTjDU06gnNwZTV%0A%09%09%09%09%09%091TbTcxsEK0jiEJcQE0cwKS51mMxhEkunWzLQrJFlYJKU4a3DtNrlR6+W02UX31m5GkDZw2+mlmqf%0A%09%09%09%09%09%09QpV20lBSyUkBA26jR5I6BgZrfPt7p3nzkd2stfNqWWggc44sqzTSM2cWWO0UvPHgOJdWuhw7v1YV%0A%09%09%09%09%09%09Cnys1slWwRiMQL1mSLKEW6bGePL4IqIlSDzklpeXeeSRR3DO8bfvCTjXvUFx9+B1BdxqmSr0i2/E%0A%09%09%09%09%09%09fnnwK199gu+3Z1le7xKc4/j0CmXi+LV33MKzpxfIS8/gUI0AXFxqY1OHMcLUjpTlnmd+pYsx1SQl%0A%09%09%09%09%09%09EYJEQvTUB+qITRgfrWOtoRcVlyaj7rUWb42pwCTXVKfXVnuAUKunLHY8lxbbHLx1OxHl+09dZM9N%0A%09%09%09%09%09%09TeZaOaPDdZJagtP+OgKlHSGtpxADRQEhF4ieGFJwgk0tPz2zhsYCl2Q46xqu1+uxsbFx1axf3hvY%0A%09%09%09%09%09%09XF6/tqT+UmX1eg2KItAqA4NDdaSe0up5/ulbz3L07pvJMsexi6sUCo9PrzPbKtg+UmOskdKOghpL%0A%09%09%09%09%09%09YkCDYDJTlXSi0smVRgbrKz1UHM0BwTkp3Yc//GHh/9i++MUv3mGMebLRaFCveYJGVJV2t2RkqMYL%0A%09%09%09%09%09%09sxvYRsrMj8/zgbfvJ6sl/Hh6jY4KtUbGbDcw3+shWYLVCNGAeiiVGExVrkmU5dUOIo6Lp2eY2tWk%0A%09%09%09%09%09%092/ErjtehTUxMTE5OTjIyMsK+AwUPffdbpKmj6H/BW+0CNYbphTb/+t+nufXmLcy1PJJYckDSBDHg%0A%09%09%09%09%09%09XMSpQvCoVhImhoBp1HEm8tSzlyD3DISCC+cWicrZ1wVAlmU7nXMkScIbD09giBiERpagwNBAyoXF%0A%09%09%09%09%09%09DhPbhziz0iNkG9x28whvv3WCtSIw3yr4n+lVljsFMSjGCyYaQizBeXZvqXHs5AJihKLIWe0UNMdq%0A%09%09%09%09%09%09RF9++RUBeOCBB+zMzMx4CGHYGDNkjGmKyLCqDolIs9FofGTbtm3UajVijBy6bSs/eGKenoctYwMg%0A%09%09%09%09%09%09gnOwtVljpqfMtUrectsAo4MpNa+MDmXs2jLAicUOT59fZWWjBwHUem7fM8IzJ5ewJuLLAsHRHITV%0A%09%09%09%09%09%09pdUwf+7MV9ymvSoHuL/+3Od++47Dh9+/Y/v2pNFoTFhrdxw5cmRCROxmUJ1uh7L0lGXBqVOneeg7%0A%09%09%09%09%09%09D5MmKbVaxsF9lieft3Ry6HYKfIRYS3nuwhpvOriVk6ueo7eM0/bgEiUEJc2EveMDeFUW11LWNrpM%0A%09%09%09%09%09%092Dqnzy0Sg0f6glE0MpQZThxbeVD1a8FJVUNP+j09c/JkNtAYqM/PzR8YHh4d3rJlvBwdG5tPEzcQ%0A%09%09%09%09%09%09Y6gbK4mzluHhEaytMO3adf2S70ePfwO/qEhiKX2k2ykwjYwnzq1x694tLHZKhhopSRSi9NcdqbB/%0A%09%09%09%09%09%09fID9Y3WaTnjwiRmWOp6IoSxKnCjRRdaXO5726u9c1g5XAdg0ToDkvvveu/vIkTv3jG/belMMYXvp%0A%09%09%09%09%09%098+1lUd7cbm2M1xq1+khzJB0eG3PDzWHbHG6a4aFhMzA0yKWLS/rxT//AlGNj6GCNIJZ0tE7ZqLF7%0A%09%09%09%09%09%099yj79ozynkMTZKkjKBSRqnIRI770PHGxxcM/OkdY36Bc7aCdLhICxdwKnem5v5o59dlPVVsUL1ah%0A%09%09%09%09%09%09TV+dGsBuGl/b5ZrxtZ1du/YlFy6c9ofv/ON3NicOfWl9aER8I6M5WqewDjdSZ2r3Fo4e3sbh7c0r%0A%09%09%09%09%09%09Oz6pQKcInFps859Pz3H89Dyy0abXDthYUswusX7y7MMzz3323detyFQ19kXN69m+fM+7vjA6OTb0%0A%09%09%09%09%09%09+VlnjPaFWqmG80s9Hj23wa/ePIyxhq5XlvPIai/Q7hbsHck44RLsQIM0dolzq7RPXfjx7PPZfVfJ%0A%09%09%09%09%09%09z5/XPvHmNnnHJ+5905tufbAxtSMb3DGGNjKGRhsc3DHEnbuHGUgc7aCcXc9ZWO0Sy4Knp9d5+uQc%0A%09%09%09%09%09%09+VIHM7vA3FNn/3n6qU/+wXU7zr8IAAA7b/9oc1tz27/o2Oj73OQuU981yvvu2smBHcN4EdZzT90K%0A%09%09%09%09%09%09652c+eUePzk+z/r0POvHXrg4N33x984//fn/+plllZ9nu/TB4ZYs3PKHyfTK7emJsx/vXpr75Qem%0A%09%09%09%09%09%0955tbd4wwuXOE04ttlldzYrtLd3HNl0utEx3v/9Hu2/ONuGvvzEs99xfiARGRg3/071vyEHcDO1Ti%0A%09%09%09%09%09%09TopiZ+it7PXdtanY3ditIW9IMrBg683ppD56SgaaFxF3XpBLhdrTM+vtC/q1D4b/NwrJ/febQ9zm%0A%09%09%09%09%09%09upeoF736oNWy6aMOG9MbjtAkBMSZVizNhsncWmLtelZKq2dG22fbC+WNjP+FAti07BY+c7/w7G3C%0A%09%09%09%09%09%09wla58+CQ9FbOCEBtdK8+vmNDeXZBOfSc8plPqyova+D/An26E8AhsXfAAAAAAElFTkSuQmCC"></td>
';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
  <title>eyeNav NG</title>
  
</head>

<?php

switch ($data['category'])
{
    case 'error':
        
        
        switch ($data['group'])
        {
            case 'url':
                
                switch ($data['type'])
                {
                    case 'internal':
					$message = '<body style="background-color: rgb(122, 162, 215); color: rgb(0, 0, 0);"
					alink="#ee0000" link="#0000ee" vlink="#551a8b">
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<center><table style="text-align: left; width: 282px; height: 76px;" border="0"
					cellpadding="0" cellspacing="0">
					<tbody>
					<tr>
					<td style="vertical-align: top; text-align: center;">' . $eyeNavIcon . '<td style="vertical-align: top; white-space: nowrap;">
					<div>The website
					you tried to access, did not respond.<br>
					</div>
					<div>Either your internet connection</div><div>
					is down, or the website you tried to</div><div>
					contact is down, misspelled, or does not exist.<br>
					</div>
					<br>
					<div>- eyeNavigator NextGeneration<br>
					</div>
					</td>
					</tr>
					</tbody>
					</table></center>';

                        break;
                    case 'external':
                        switch ($data['error'])
                        {
                            case 1:
                                $message = 'The URL you\'re attempting to access is blacklisted by this server. Please select another URL.';
                                break;
                            case 2:
                                $message = 'The URL you entered is malformed. Please check whether you entered the correct URL or not.' . $GLOBALS['_url'];
                                
								if($GLOBALS['_url']=="http://about:me") {$message='About:Me<br><br><body style="background-color: rgb(122, 162, 215); color: rgb(0, 0, 0);"
								alink="#ee0000" link="#0000ee" vlink="#551a8b">
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<center>
								<table style="text-align: left; width: 282px; height: 76px;" border="0"
								cellpadding="0" cellspacing="0">
								<tbody>
								<tr>
								<td style="vertical-align: top; text-align: center;">' . $eyeNavIcon . '<td style="vertical-align: top; white-space: nowrap;">eyeNavigator
								NG:<br>
								<div><br>
								Engine: ' . $GLOBALS['_scriptname'] . ' ' . $GLOBALS['_version'] . ' (A fork of PHProxy by Abdullah Arif)<br>
								Author: Fabian Olesen<br>
								Based on the Plugin for eyeNavigator by Lars SH.<br>
								<br>
								Capabilities:<br>
								Basic Proxy operation<br>
								Primitive Javascript Handling<br>
								Supports cookies<br>
								</div>
								</td>
								</tr>
								</tbody>
								</table>
								</center>
								<br>
								<br>'; }
								break;
                        }
                        break;
                }
                break;
            case 'resource':
                echo '<b>Resource Error:</b> ';
                switch ($data['type'])
                {
                    case 'file_size':
                        $message = 'The file your are attempting to download is too large.<br />'
                                 . 'Maxiumum permissible file size is <b>' . number_format($GLOBALS['_config']['max_file_size']/1048576, 2) . ' MB</b><br />'
                                 . 'Requested file size is <b>' . number_format($GLOBALS['_content_length']/1048576, 2) . ' MB</b>';
                        break;
                    case 'hotlinking':
                        $message = 'It appears that you are trying to access a resource through this proxy from a remote Website.<br />'
                                 . 'For security reasons, please use the form below to do so.';
                        break;
                }
                break;
        }
        
        echo  $message;
        break;
}
?>

    </ul>
  </form>
  
</body>
</html>