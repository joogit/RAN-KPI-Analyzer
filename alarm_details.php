<?php
include 'include/header.php';
?>

<div class="panel">
    <h2>RAN KPI Dashboard for Alarms</h2>
    <div class="panelcontent">
        <div class="top-portion">
            <div class="top_table">
                <table border=1>
                    <h3> Alarm Summary of <font color=red><?php echo $_REQUEST['object_name']; ?>:</font></h3>
                    <tr>
                    <center>
                        <th style="background: #91C910">Alarm ID </th>
                        <th style="background: #91C910">Alarm Text </th>
                        <th style="background: #91C910">No. of Occurence</th>
                    </center>
                    </tr>			
                    <?php
                    //$query="SELECT text, count(text) FROM alarm_info WHERE object_name='$_REQUEST[bsc_name]' ORDER BY text";
                    $query = "SELECT alarm_number, text, COUNT(*) FROM alarm_info WHERE object_name='$_REQUEST[object_name]' GROUP BY text HAVING COUNT(*) >= 1 ORDER BY text";
                    $result = mysql_query($query);
                    $row = mysql_num_rows($result);

                    while ($rowsql = mysql_fetch_assoc($result)) {
                        if ($rowsql['COUNT(*)'] > 100) {
                            $color = 'red';
                        } else if ($rowsql['COUNT(*)'] > 50) {
                            $color = 'blue';
                        } else {
                            $color = 'black';
                        }
                        if ($rowsql['text'] == 'BTS AND TC UNSYNCHRONIZATION CLEAR CALLS ON ABIS I') {
                            $color = 'red';
                            $b = '<b><marquee style="height:20;width:200" loop="true">';
                            $b1 = '</marquee></b>';
                        } else {
                            $b = '';
                            $b1 = '';
                        }
                        ?>

                        <tr>  
                            <td class=td1 align="center"><font color=<?php echo $color . ">" . $b; ?><?php echo $rowsql['alarm_number'] . $b1; ?></color></td>						
                            <td class=td1 align="center"><font color=<?php echo $color . ">" . $b; ?><?php echo $rowsql['text'] . $b1; ?></color></td>						
                            <td class=td2 align="center"><font color=<?php echo $color . ">" . $b; ?><?php echo $rowsql['COUNT(*)'] . $b1; ?><color></td>		
                            </tr>

                            <?php
                        }
                        ?>
                </table>
            </div>

        </div>
    </div>
</div>					
<table class="data_table1" width='100%' id="table1">
    <tr>
    <center>
        <th>Alarm Text</th>
        <th>Alarm ID</th>
        <th>Object Name</th>
        <th>DN</th>		
        <th>Alarm Time</th>
        <th>Cancel Time</th>	
        <th>ACK Status</th>				
    </center>
</tr>
<?php
$object_name = $_REQUEST['object_name'];
if ($object_name != '') {
    $query1 = "SELECT text, alarm_number, object_name, dn, alarm_time, cancel_time, ack_status FROM alarm_info WHERE object_name='$object_name' ORDER BY alarm_time";
} else {
    $query1 = "SELECT text, alarm_number, object_name, dn, alarm_time, cancel_time, ack_status FROM alarm_info ORDER BY alarm_time";
}
$result1 = mysql_query($query1);

while ($rowsql1 = mysql_fetch_assoc($result1)) {
    ?>
    <tr>
        <td align="center"><?php echo $rowsql1['text']; ?></td> 
        <td align="center"><?php echo $rowsql1['alarm_number']; ?></td>  
        <td align="center"><?php echo $rowsql1['object_name']; ?></td>						
        <td align="center"><?php echo $rowsql1['dn']; ?></td>
        <td align="center"><?php echo $rowsql1['alarm_time']; ?></td>	
        <td align="center"><?php
            if ($rowsql1['cancel_time'] != '') {
                echo $rowsql1['cancel_time'];
            } else {
                echo "Active";
            }
            ?>
        </td>	
        <td align="center"><?php echo $rowsql1['ack_status']; ?></td>				
    </tr>
    <?php
}
?>
</table>
<script language="javascript" type="text/javascript">
    var table1_Props = {
        //exact_match: true,
        col_0: "select",
        col_1: "select",
        col_2: "select",
        col_3: "select",
        col_5: "select",
        col_operation: "sum",
        alternate_rows: true,
        //col_width: ["150px","100px"],//prevents column width variations
        rows_counter: true,
        rows_counter_text: "Total No. of Rows: ",
        btn_reset: true,
        bnt_reset_text: "Clear all "
    };
    setFilterGrid("table1", table1_Props);
</script>
</div>		
</body>
</html>