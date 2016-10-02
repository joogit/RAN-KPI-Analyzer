<?php
include 'include/header.php';
?>

<div class="panel">
    <h2>RAN KPI Dashboard for BSC KPI </h2>
    <div class="panelcontent">		

        <table class="dash-table" border=1>
            <tr>
            <center>
                <th style="background: #91C910">KPI Item </th>
                <th style="background: #91C910">Value</th>
            </center>
            </tr>		
            <?php
            $item = array('BSS Drop', 'CDR', 'SDDR', 'TAFB');

            $query = "SELECT SUM(bss_drop), SUM(cdr), SUM(sddr), SUM(tch_ass_fail_bss) FROM flexi_cs WHERE bsc_name='$_REQUEST[object_name]'";

            $result = mysql_query($query);
            $rowsql = mysql_fetch_assoc($result);
            $value = array($rowsql['SUM(bss_drop)'], $rowsql['SUM(cdr)'], $rowsql['SUM(sddr)'], $rowsql['SUM(tch_ass_fail_bss)']);
            for ($d = 0; $d <= 3; $d++) {
                ?>
                <tr>  
                    <td align="center"><?php echo $item[$d]; ?></td>						
                    <td align="center"><?php echo round($value[$d], 2); ?></td>		
                </tr>
                <?php
            }
            ?>
        </table>			
        <table class="dash-table" border=1>
            <tr>
            <center>
                <th style="background: #91C910">Site Name </th>
                <th style="background: #91C910">BSS Drop</th>
                <th style="background: #91C910">CDR</th>
                <th style="background: #91C910">CDR_N</th>	
                <th style="background: #91C910">CDR_D</th>					
                <th style="background: #91C910">SDDR</th>
                <th style="background: #91C910">TAFB</th>
                <th style="background: #91C910">BH Traffic</th>
                <th style="background: #91C910">Total Alarms</th>			
            </center>
            </tr>		
            <?php
            //echo $object_name;
            $query = "SELECT cell_name, SUM(bss_drop), SUM(radio_drop), SUM(ho_drop), SUM(cdr), cdr_n, cdr_d, SUM(bh_traffic) FROM flexi_cs WHERE (bsc_name='$_REQUEST[object_name]' OR cell_name='$_REQUEST[object_name]') GROUP BY site_name ORDER BY SUM(bss_drop) DESC ";
            $result = mysql_query($query);
            while ($rowsql = mysql_fetch_assoc($result)) {
                $x = $rowsql['SUM(bss_drop)'];
                if ($x > '50') {
                    ?>
                    <tr>  
                        <td align="center"><a href="alarm_details.php?object_name=<?php echo $rowsql['cell_name']; ?>" target="_blank"><font color=blue><?php echo $rowsql['cell_name']; ?></font></a></td>
                        <td align="center"><?php echo "<font color=red>" . $rowsql['SUM(bss_drop)'] . "</font>"; ?></td>	
                        <td align="center"><?php echo $rowsql['SUM(radio_drop)']; ?></td>						
                        <td align="center"><?php echo $rowsql['SUM(ho_drop)']; ?></td>	
                        <td align="center"><?php echo round($rowsql['SUM(cdr)'], 2); ?></td>	
                        <td align="center"><?php echo $rowsql['cdr_n']; ?></td>
                        <td align="center"><?php echo $rowsql['cdr_d']; ?></td>					
                        <td align="center"><?php echo round($rowsql['SUM(bh_traffic)'], 2); ?></td>	
                        <td align="center"><?php echo $rowsql['SUM(radio_drop)']; ?></td>							
                    </tr>
                    <?php
                }
            }
            ?>
        </table>
        <table class="dash-table" border=1>
            <tr>
                <th style="background: #91C910" colspan="3">BSC Alarm Summary </th>
            </tr>
            <tr>
                <th style="background: #91C910">Alarm ID</th>
                <th style="background: #91C910">Alarm Text</th>
                <th style="background: #91C910">No. of Occurence</th>			
            </tr>		
            <?php
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
<table width='100%' id="table1">
    <tr>
    <center>
        <th>Starting Hour</th>
        <th>BSC Name</th>
        <th>Site Name</th>
        <th>Cell Name</th>		
        <th>BSS Drop</th>
        <th>CDR</th>	
        <th>CDR_N</th>	
        <th>CDR_D</th>				
        <th>SDDR</th>
        <th>TAFB</th>				
    </center>
</tr>
<?php
$object_name = $_REQUEST['object_name'];
if ($object_name == '') {
    $query1 = "SELECT hour, bsc_name, site_name, cell_name, bss_drop, cdr, cdr_n, sddr FROM flexi_cs WHERE (bss_drop > 50) ORDER BY hour";
} else {
    $query1 = "SELECT hour, bsc_name, site_name, cell_name, bss_drop, cdr, cdr_n, cdr_d, sddr, tch_ass_fail_bss FROM flexi_cs WHERE ((bsc_name='$object_name' OR cell_name='$object_name') AND (bss_drop > 10 OR cdr_n >100 OR sddr > 5)) ORDER BY hour";
}
$result1 = mysql_query($query1);
while ($rowsql1 = mysql_fetch_assoc($result1)) {
    ?>
    <tr>
        <td align="center"><?php echo $rowsql1['hour']; ?></td> 
        <td align="center"><?php echo $rowsql1['bsc_name']; ?></td>  
        <td align="center"><?php echo $rowsql1['site_name']; ?></td>						
        <td align="center"><?php echo $rowsql1['cell_name']; ?></td>
        <td align="center"><?php echo $rowsql1['bss_drop']; ?></td>	
        <td align="center"><?php echo round($rowsql1['cdr'], 2); ?></td>	
        <td align="center"><?php echo $rowsql1['cdr_n']; ?></td>	
        <td align="center"><?php echo $rowsql1['cdr_d']; ?></td>				
        <td align="center"><?php echo round($rowsql1['sddr'], 2); ?></td>	
        <td align="center"><?php echo $rowsql1['tch_ass_fail_bss']; ?></td>				
    </tr>
    <?php
}
?>
</table>
<script language="javascript" type="text/javascript">
    var table1_Props = {
        //exact_match: true,
        //btn: true,
        col_0: "select",
        col_2: "select",
        col_3: "select",
        col_4: "select",
        col_operation: true,
        alternate_rows: true,
        rows_counter: true,
        rows_counter_text: "Total No. of Rows: ",
        btn_reset: true,
        bnt_reset_text: "Clear all ",
        sort_num_desc: [4]
    };
    setFilterGrid("table1", table1_Props);
</script>	
</div>		
</body>
</html>