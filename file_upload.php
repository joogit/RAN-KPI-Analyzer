<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>RAN KPI Analyzer</title>	
    <link rel='stylesheet' type='text/css' href='style.css'/>
</head>
<body>

    <?php
    ini_set("memory_limit", "1000M");
    set_time_limit(0);
    date_default_timezone_set('Asia/Dhaka');

    if (isset($_POST['Upload_File'])) {
        $file_name = ($_FILES['file']['name']);
        $file_size = intval($_FILES['file']['size']);
        if ($file_size > 0) {
            move_uploaded_file($_FILES["file"]["tmp_name"], "input/" . $file_name);

            echo "Successfully Uploaded: " . "<b>" . $file_name . "</b><br/><br/>";
            echo "File Size: " . $file_size;
        } else {
            echo "File is Empty";
        }
    }
    if (isset($_POST['Update_CS_KPI'])) {

        $host = 'localhost';
        $username = 'root';
        $password = '';
        $db = 'ran_kpi';
        $res = mysql_connect($host, $username, $password);
        if (!$res)
            die('Could not connect to the server, mysql error: ' . mysql_error($res));
        $res = mysql_select_db($db);
        if (!$res)
            die('Could not connect to the database, mysql error: ' . mysql_error($res));

        $cs_date = date("m/d/y G.i:s<br>", time());
        $update_date = mysql_query("UPDATE update_date SET cs_update='$cs_date' ");


        $del_table = mysql_query("TRUNCATE TABLE flexi_cs");

        $input = "input/Flexi_CS.csv";
        $lines = file("$input");

        foreach ($lines as $line_num => $line) {
            if ($line_num > 1) {
                $arr = explode(";", $line);
                $hour = trim((string) $arr[0]);
                $bsc_name = trim((string) $arr[1]);
                $site_name = trim((string) $arr[2]);
                $cell_name = trim((string) $arr[3]);
                $bh_traffic = trim((string) $arr[4]);

                $radio_drop = trim((string) $arr[7]);
                $bss_drop = trim((string) $arr[8]);
                $ho_drop = trim((string) $arr[9]);

                $cdr_n = trim((string) $arr[10]);
                $cdr_d = trim((string) $arr[11]);
                $cdr = trim((string) $arr[12]);
                $tch_ass_fail_bss = trim((string) $arr[16]);
                $avil_tch_mean = trim((string) $arr[23]);
                $sddr = trim((string) $arr[28]);
                $cssr = trim((string) $arr[32]);

                $sql1 = sprintf("INSERT INTO flexi_cs VALUES ('$hour', '$bsc_name', '$site_name', '$cell_name', '$bh_traffic', '$radio_drop', '$bss_drop', '$ho_drop', '$cdr_n', '$cdr_d','$cdr', '$tch_ass_fail_bss', '$avil_tch_mean', '$sddr', '$cssr')");

                $result1 = mysql_query($sql1);
            }
        }
        if ($result1) {
            echo "<b><font color=GREEN>SUCCESSFULLY UPDATED CS KPI DATABASE</font></b>" . "<br/>";
            echo "on  ";
            echo date("m/d/y G.i:s<br>", time());
        } else {
            echo "<b><font color=red>SORRY !!! DATABASE UPDATE FAILED</font></b>";
        }
    }

    if (isset($_POST['Update_Alarm'])) {

        $host = '';
        $username = '';
        $password = '';
        $db = '';
        $res = mysql_connect($host, $username, $password);
        if (!$res)
            die('Could not connect to the server, mysql error: ' . mysql_error($res));
        $res = mysql_select_db($db);
        if (!$res)
            die('Could not connect to the database, mysql error: ' . mysql_error($res));

        $del_table = mysql_query("TRUNCATE TABLE alarm_info");

        $input = "input/alarm_all.csv";
        $lines = file("$input");

        foreach ($lines as $line_num => $line) {
            if ($line_num > 0) {
                $arr = explode(",", $line);
                $dn = trim((string) $arr[2]);
                $original_severity = trim((string) $arr[5]);
                $alarm_time = trim((string) $arr[6]);
                $cancel_time = trim((string) $arr[7]);
                $ack_status = trim((string) $arr[8]);
                $ack_time = trim((string) $arr[9]);
                $acked_by = trim((string) $arr[10]);
                $alarm_number = trim((string) $arr[11]);
                $text = trim((string) $arr[13]);
                $object_name = trim((string) $arr[19]);
                $address = trim((string) $arr[20]);

                $sql2 = sprintf("INSERT INTO alarm_info  VALUES ('$dn', '$original_severity', '$alarm_time', '$cancel_time', '$ack_status', '$ack_time', '$acked_by', '$alarm_number', '$text', '$object_name', '$address')");

                $result2 = mysql_query($sql2);
            }
        }
        if ($result2) {
            echo "<b><font color=GREEN>SUCCESSFULLY UPDATED ALARM DATABASE</font></b>";
        } else {
            echo "<b><font color=red>SORRY !!! ALARM DATABASE UPDATE FAILED</font></b>";
        }
    }
    ?>


    <form method="post" enctype="multipart/form-data" action="file_upload.php">
        <p> Select File: <input name="file" type="file">
            <input type="submit" name="Upload_File" value="Upload File"> 
        </p>	
    </form>	

    <form method="post" enctype="multipart/form-data" action="file_upload.php">
        <p> After Successfully Uploaded <b>Flexi_CS.csv & alarm_all.csv </b> Files Click Below buttons one by one: <br/>
            <input type="submit" name="Update_CS_KPI" value="Update CS KPI"> <br/>	
        </p>
    </form>	

    <form method="post" enctype="multipart/form-data" action="file_upload.php">
        <p>
            <input type="submit" name="Update_Alarm" value="Update Alarm">
        </p>
    </form>		

</body>
</html>		