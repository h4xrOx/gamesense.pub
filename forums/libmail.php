<?php

class Mail {
    var $sendto = array();
    var $acc = array();
    var $abcc = array();
    var $aattach = array();
    var $xheaders = array();
    var $priorities = array('1 (Highest)', '2 (High)', '3 (Normal)', '4 (Low)', '5 (Lowest)');
    var $charset = "windows-1251";
    var $ctencoding = "8bit";
    var $receipt = 0;
    var $text_html = "text/plain"; // ôîðìàò ïèñüìà. ïî óìîë÷àíèþ òåêñòîâûé
    var $smtp_on = false;    // îòïðàâêà ÷åðåç smtp. ïî óìîë÷àíèþ âûêëþ÷åíà
    var $names_email = array(); // èìåíà äëÿ email àäðåñîâ, ÷òîáû äåëàòü âèä ("Àíòîí" <te@gg.ru>)
    function Mail($charset="") {
        $this->autoCheck(true);
        $this->boundary = "--" . md5(uniqid("myboundary"));
        if ($charset != "") {
            $this->charset = strtolower($charset);
            if ($this->charset == "us-ascii")
                $this->ctencoding = "7bit";
        }
    }
    function autoCheck($bool) {
        if ($bool)
            $this->checkAddress = true;
        else
            $this->checkAddress = false;
    }
    function Subject($subject) {

        $this->xheaders['Subject'] = "=?" . $this->charset . "?Q?" . str_replace("+", "_", str_replace("%", "=", urlencode(strtr($subject, "\r\n", "  ")))) . "?=";
    }
    function From($from) {

        if (!is_string($from)) {
            echo "îøèáêà, From äîëæåí áûòü ñòðîêîé";
            exit;
        }
        $temp_mass = explode(';', $from);
        if (count($temp_mass) == 2) { 
            $this->names_email['from'] = $temp_mass[0]; 
            $this->xheaders['From'] = $temp_mass[1];
        } else {
            $this->names_email['from'] = '';
            $this->xheaders['From'] = $from;
        }
    }

    function ReplyTo($address) {

        if (!is_string($address))
            return false;

        $temp_mass = explode(';', $address); 

        if (count($temp_mass) == 2) { 
            $this->names_email['Reply-To'] = $temp_mass[0];
            $this->xheaders['Reply-To'] = $temp_mass[1];
        } else {
            $this->names_email['Reply-To'] = '';
            $this->xheaders['Reply-To'] = $address;
        }
    }

    function Receipt() {
        $this->receipt = 1;
    }

    function To($to) {
        if (is_array($to)) {
            foreach ($to as $key => $value) { 
                $temp_mass = explode(';', $value);
                if (count($temp_mass) == 2) { 
                    $this->smtpsendto[$temp_mass[1]] = $temp_mass[1]; 
                    $this->names_email['To'][$temp_mass[1]] = $temp_mass[0]; 
                    $this->sendto[] = $temp_mass[1];
                } else { 
                    $this->smtpsendto[$value] = $value;
                    $this->names_email['To'][$value] = '';
                    $this->sendto[] = $value;
                }
            }
        } else {
            $temp_mass = explode(';', $to);
            if (count($temp_mass) == 2) {
                $this->sendto[] = $temp_mass[1];
                $this->smtpsendto[$temp_mass[1]] = $temp_mass[1];
                $this->names_email['To'][$temp_mass[1]] = $temp_mass[0];
            } else {
                $this->sendto[] = $to;
                $this->smtpsendto[$to] = $to;

                $this->names_email['To'][$to] = '';
            }
        }
        if ($this->checkAddress == true)
            $this->CheckAdresses($this->sendto);
    }

    function Cc($cc) {
        if (is_array($cc)) {
            $this->acc = $cc;

            foreach ($cc as $key => $value) {
                $this->smtpsendto[$value] = $value;
            }
        } else {
            $this->acc[] = $cc;
            $this->smtpsendto[$cc] = $cc;
        }

        if ($this->checkAddress == true)
            $this->CheckAdresses($this->acc);
    }

    function Bcc($bcc) {
        if (is_array($bcc)) {
            $this->abcc = $bcc;
            foreach ($bcc as $key => $value) {
                $this->smtpsendto[$value] = $value;
            }
        } else {
            $this->abcc[] = $bcc;
            $this->smtpsendto[$bcc] = $bcc;
        }

        if ($this->checkAddress == true)
            $this->CheckAdresses($this->abcc);
    }

    function Body($body, $text_html="") {
        $this->body = $body;

        if ($text_html == "html")
            $this->text_html = "text/html";
    }

    function Organization($org) {
        if (trim($org != ""))
            $this->xheaders['Organization'] = $org;
    }

    function Priority($priority) {
        if (!intval($priority))
            return false;

        if (!isset($this->priorities[$priority - 1]))
            return false;

        $this->xheaders["X-Priority"] = $this->priorities[$priority - 1];

        return true;
    }

    function Attach($filename, $webi_filename="", $filetype = "", $disposition = "inline") {
        if ($filetype == "")
            $filetype = "application/x-unknown-content-type";

        $this->aattach[] = $filename;
        $this->webi_filename[] = $webi_filename;
        $this->actype[] = $filetype;
        $this->adispo[] = $disposition;
    }

    function BuildMail() {

        $this->headers = "";
        foreach ($this->sendto as $key => $value) {
            if (strlen($this->names_email['To'][$value]))
                $temp_mass[] = "=?" . $this->charset . "?Q?" . str_replace("+", "_", str_replace("%", "=", urlencode(strtr($this->names_email['To'][$value], "\r\n", "  ")))) . "?= <" . $value . ">";
            else
                $temp_mass[] = $value;
        }
        $this->xheaders['To'] = implode(", ", $temp_mass);
        if (count($this->acc) > 0)
            $this->xheaders['CC'] = implode(", ", $this->acc);

        if (count($this->abcc) > 0)
            $this->xheaders['BCC'] = implode(", ", $this->abcc);


        if ($this->receipt) {
            if (isset($this->xheaders["Reply-To"]))
                $this->xheaders["Disposition-Notification-To"] = $this->xheaders["Reply-To"];
            else
                $this->xheaders["Disposition-Notification-To"] = $this->xheaders['From'];
        }

        if ($this->charset != "") {
            $this->xheaders["Mime-Version"] = "1.0";
            $this->xheaders["Content-Type"] = $this->text_html . "; charset=$this->charset";
            $this->xheaders["Content-Transfer-Encoding"] = $this->ctencoding;
        }

        $this->xheaders["X-Mailer"] = "WWW.admin-vestnik.ru.ru php-mail-V 1.8";
        if (count($this->aattach) > 0) {
            $this->_build_attachement();
        } else {
            $this->fullBody = $this->body;
        }
        if ($this->smtp_on) {
            $user_domen = explode('@', $this->xheaders['From']);
            $this->headers = "Date: " . date("D, j M Y G:i:s") . " +0700\r\n";
            $this->headers .= "Message-ID: <" . rand() . "." . date("YmjHis") . "@" . $user_domen[1] . ">\r\n";
            reset($this->xheaders);
            while (list( $hdr, $value ) = each($this->xheaders)) {
                if ($hdr == "From" and strlen($this->names_email['from']))
                    $this->headers .= $hdr . ": =?" . $this->charset . "?Q?" . str_replace("+", "_", str_replace("%", "=", urlencode(strtr($this->names_email['from'], "\r\n", "  ")))) . "?= <" . $value . ">\r\n";
                elseif ($hdr == "Reply-To" and strlen($this->names_email['Reply-To']))
                    $this->headers .= $hdr . ": =?" . $this->charset . "?Q?" . str_replace("+", "_", str_replace("%", "=", urlencode(strtr($this->names_email['Reply-To'], "\r\n", "  ")))) . "?= <" . $value . ">\r\n";
                elseif ($hdr != "BCC")
                    $this->headers .= $hdr . ": " . $value . "\r\n";
            }
        }
        else {
            reset($this->xheaders);
            while (list( $hdr, $value ) = each($this->xheaders)) {
                if ($hdr == "From" and strlen($this->names_email['from']))
                    $this->headers .= $hdr . ": =?" . $this->charset . "?Q?" . str_replace("+", "_", str_replace("%", "=", urlencode(strtr($this->names_email['from'], "\r\n", "  ")))) . "?= <" . $value . ">\r\n";
                elseif ($hdr == "Reply-To" and strlen($this->names_email['Reply-To']))
                    $this->headers .= $hdr . ": =?" . $this->charset . "?Q?" . str_replace("+", "_", str_replace("%", "=", urlencode(strtr($this->names_email['Reply-To'], "\r\n", "  ")))) . "?= <" . $value . ">\r\n";
                elseif ($hdr != "Subject" and $hdr != "To")
                    $this->headers .= "$hdr: $value\n"; 
            }
        }
    }
    function smtp_on($smtp_serv, $login, $pass, $port=25, $timeout=5) {
        $this->smtp_on = true;
        $this->smtp_serv = $smtp_serv;
        $this->smtp_login = $login;
        $this->smtp_pass = $pass;
        $this->smtp_port = $port;
        $this->smtp_timeout = $timeout;
    }

    function get_data($smtp_conn) {
        $data = "";
        while ($str = fgets($smtp_conn, 515)) {
            $data .= $str;
            if (substr($str, 3, 1) == " ") {
                break;
            }
        }
        return $data;
    }

    function Send() {
        $this->BuildMail();
        $this->strTo = implode(", ", $this->sendto);
        if (!$this->smtp_on) {
            $res = @mail($this->strTo, $this->xheaders['Subject'], $this->fullBody, $this->headers);
        } else {

            if (!$this->smtp_serv OR !$this->smtp_login OR !$this->smtp_pass OR !$this->smtp_port)
                return false; 
            $user_domen = explode('@', $this->xheaders['From']);


            $this->smtp_log = '';
            $smtp_conn = fsockopen($this->smtp_serv, $this->smtp_port, $errno, $errstr, $this->smtp_timeout);
            if (!$smtp_conn) {
                $this->smtp_log .= "ñîåäèíåíèå ñ ñåðâåðîì íå ïðîøëî\n\n";
                fclose($smtp_conn);
                return;
            }

            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";

            fputs($smtp_conn, "EHLO " . $user_domen[0] . "\r\n");
            $this->smtp_log .= "ß: EHLO " . $user_domen[0] . "\n";
            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";
            $code = substr($data, 0, 3);

            if ($code != 250) {
                $this->smtp_log .= " EHLO \n";
                fclose($smtp_conn);
                return;
            }

            fputs($smtp_conn, "AUTH LOGIN\r\n");
            $this->smtp_log .= "ß: AUTH LOGIN\n";
            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";
            $code = substr($data, 0, 3);

            if ($code != 334) {
                $this->smtp_log .= "\n";
                fclose($smtp_conn);
                return;
            }

            fputs($smtp_conn, base64_encode($this->smtp_login) . "\r\n");
            $this->smtp_log .= "ß: " . base64_encode($this->smtp_login) . "\n";
            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";

            $code = substr($data, 0, 3);
            if ($code != 334) {
                $this->smtp_log .= "\n";
                fclose($smtp_conn);
                return;
            }


            fputs($smtp_conn, base64_encode($this->smtp_pass) . "\r\n");
            $this->smtp_log .="ß: " . base64_encode($this->smtp_pass) . "\n";
            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";

            $code = substr($data, 0, 3);
            if ($code != 235) {
                $this->smtp_log .= "\n";
                fclose($smtp_conn);
                return;
            }

            fputs($smtp_conn, "MAIL FROM:<" . $this->xheaders['From'] . "> SIZE=" . strlen($this->headers . "\r\n" . $this->fullBody) . "\r\n");
            $this->smtp_log .= "ß: MAIL FROM:<" . $this->xheaders['From'] . "> SIZE=" . strlen($this->headers . "\r\n" . $this->fullBody) . "\n";
            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";

            $code = substr($data, 0, 3);
            if ($code != 250) {
                $this->smtp_log .= " MAIL FROM\n";
                fclose($smtp_conn);
                return;
            }



            foreach ($this->smtpsendto as $keywebi => $valuewebi) {
                fputs($smtp_conn, "RCPT TO:<" . $valuewebi . ">\r\n");
                $this->smtp_log .= "ß: RCPT TO:<" . $valuewebi . ">\n";
                $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";
                $code = substr($data, 0, 3);
                if ($code != 250 AND $code != 251) {
                    $this->smtp_log .= " RCPT TO\n";
                    fclose($smtp_conn);
                    return;
                }
            }




            fputs($smtp_conn, "DATA\r\n");
            $this->smtp_log .="ß: DATA\n";
            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";

            $code = substr($data, 0, 3);
            if ($code != 354) {
                $this->smtp_log .= " DATA\n";
                fclose($smtp_conn);
                return;
            }

            fputs($smtp_conn, $this->headers . "\r\n" . $this->fullBody . "\r\n.\r\n");
            $this->smtp_log .= "ß: " . $this->headers . "\r\n" . $this->fullBody . "\r\n.\r\n";

            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";

            $code = substr($data, 0, 3);
            if ($code != 250) {
                $this->smtp_log .= "\n";
                fclose($smtp_conn);
                return;
            }

            fputs($smtp_conn, "QUIT\r\n");
            $this->smtp_log .="QUIT\r\n";
            $this->smtp_log .= $data = $this->get_data($smtp_conn) . "\n";
            fclose($smtp_conn);
        }
    }

    function Get() {
        if (isset($this->smtp_log)) {
            if ($this->smtp_log) {
                return $this->smtp_log; 
            }
        }

        $this->BuildMail();
        $mail = $this->headers . "\n\n";
        $mail .= $this->fullBody;
        return $mail;
    }

    function ValidEmail($address) {

        if (function_exists('filter_list')) {
            $valid_email = filter_var($address, FILTER_VALIDATE_EMAIL);
            if ($valid_email !== false)
                return true;
            else
                return false;
        }
        else { 
            if (ereg(".*<(.+)>", $address, $regs)) {
                $address = $regs[1];
            }
            if (ereg("^[^@  ]+@([a-zA-Z0-9\-]+\.)+([a-zA-Z0-9\-]{2}|net|com|gov|mil|org|edu|int)\$", $address))
                return true;
            else
                return false;
        }
    }

    function CheckAdresses($aad) {
        for ($i = 0; $i < count($aad); $i++) {
            if (!$this->ValidEmail($aad[$i])) {
                echo "îøèáêà : íå âåðíûé email " . $aad[$i];
                exit;
            }
        }
    }

    function _build_attachement() {

        $this->xheaders["Content-Type"] = "multipart/mixed;\n boundary=\"$this->boundary\"";

        $this->fullBody = "This is a multi-part message in MIME format.\n--$this->boundary\n";
        $this->fullBody .= "Content-Type: " . $this->text_html . "; charset=$this->charset\nContent-Transfer-Encoding: $this->ctencoding\n\n" . $this->body . "\n";

        $sep = chr(13) . chr(10);

        $ata = array();
        $k = 0;
        for ($i = 0; $i < count($this->aattach); $i++) {

            $filename = $this->aattach[$i];

            $webi_filename = $this->webi_filename[$i]; 
            if (strlen($webi_filename))
                $basename = basename($webi_filename); 
            else
                $basename = basename($filename); 

            $ctype = $this->actype[$i]; // content-type
            $disposition = $this->adispo[$i];

            if (!file_exists($filename)) {
                echo "îøèáêà ïðèêðåïëåíèÿ ôàéëà : ôàéë $filename íå ñóùåñòâóåò";
                exit;
            }
            $subhdr = "--$this->boundary\nContent-type: $ctype;\n name=\"$basename\"\nContent-Transfer-Encoding: base64\nContent-Disposition: $disposition;\n  filename=\"$basename\"\n";
            $ata[$k++] = $subhdr;
            // non encoded line length
            $linesz = filesize($filename) + 1;
            $fp = fopen($filename, 'r');
            $ata[$k++] = chunk_split(base64_encode(fread($fp, $linesz)));
            fclose($fp);
        }
        $this->fullBody .= implode($sep, $ata);
    }

}

// class Mail
?>
