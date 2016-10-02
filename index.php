<?php
include 'include/header.php';
?>
<table class="dash-table" border=1>
    <tr>
    <center>
        <th style="background: #91C910">BSC Name </th>
        <th style="background: #91C910">BSS Drop</th>
    </center>
</tr>		
<?php
//echo $object_name;
$query = "select bsc_name, sum(bss_drop) from flexi_cs group by bsc_name order by sum(bss_drop) desc ";
$result = mysql_query($query);
while ($rowsql = mysql_fetch_assoc($result)) {
    $x = $rowsql['sum(bss_drop)'];
    if ($x > '500') {
        ?>	

        <tr>  
            <td align="center"><a href="kpi_analysis_bsc.php?object_name=<?php echo $rowsql['bsc_name']; ?>" target="_blank"><font color="blue"><?php echo $rowsql['bsc_name']; ?></font></a></td>						
            <td align="center"><?php echo $rowsql['sum(bss_drop)']; ?></td>		
        </tr>
        <?php
    }
}
?>
<tr>
<center>
    <th style="background: #91C910">BSC Name </th>
    <th style="background: #91C910">CDR</th>
</center>
</tr>		
<?php
//echo $object_name;
$query = "select bsc_name, sum(cdr) from flexi_cs group by bsc_name order by sum(cdr) desc limit 10 ";
$result = mysql_query($query);
while ($rowsql = mysql_fetch_assoc($result)) {
    ?>

    <tr>  
        <td align="center"><a href="kpi_analysis_bsc.php?object_name=<?php echo $rowsql['bsc_name']; ?>" target="_blank"><font color="blue"><?php echo $rowsql['bsc_name']; ?></font></a></td>						
        <td align="center"><?php echo round($rowsql['sum(cdr)'], 2); ?></td>		
    </tr>

    <?php
//}
}
?>		
<table class="dash-table" border=1>		
    <tr>
    <center>
        <th style="background: #91C910">Cell Name </th>
        <th style="background: #91C910">BSS Drop</th>
    </center>
    </tr>		
    <?php
//echo $object_name;
    $query = "SELECT cell_name, sum(bss_drop) FROM flexi_cs GROUP BY cell_name ORDER BY sum(bss_drop) DESC ";
    $result = mysql_query($query);
    while ($rowsql = mysql_fetch_assoc($result)) {
        $x = $rowsql['sum(bss_drop)'];
        if ($x > '50') {
            ?>

            <tr>  
                <td align="center"><a href="kpi_analysis_bsc.php?object_name=<?php echo $rowsql['cell_name']; ?>" target="_blank"><font color=blue><?php echo $rowsql['cell_name']; ?></font></a></td>					
                <td align="center"><?php echo $rowsql['sum(bss_drop)']; ?></td>		
            </tr>
            <?php
        }
    }
    ?>

</table>
<table class="dash-table" border=1>		
    <tr>
    <center>
        <th style="background: #91C910">BSC Name </th>
        <th style="background: #91C910">TAFB</th>
    </center>
    </tr>		
    <?php
//echo $object_name;
    $query = "SELECT bsc_name, sum(tch_ass_fail_bss) FROM flexi_cs GROUP BY bsc_name ORDER BY sum(tch_ass_fail_bss) DESC ";
    $result = mysql_query($query);
    while ($rowsql = mysql_fetch_assoc($result)) {
        $x = $rowsql['sum(tch_ass_fail_bss)'];
        if ($x > '100') {
            ?>

            <tr>  
                <td align="center"><a href="kpi_analysis_bsc.php?object_name=<?php echo $rowsql['bsc_name']; ?>" target="_blank"><font color=blue><?php echo $rowsql['bsc_name']; ?></font></a></td>					
                <td align="center"><?php echo $rowsql['sum(tch_ass_fail_bss)']; ?></td>		
            </tr>
            <?php
        }
    }
    ?>

</table>		
</table>	


<table class="dash-table" border=1>
    <tr>
    <center>
        <th style="background: #91C910">Site Name </th>
        <th style="background: #91C910">Cell Name </th>
        <th style="background: #91C910">BSC Name </th>			
        <th style="background: #91C910">Avg. SDDR</th>		
    </center>
</tr>		
<?php
//echo $object_name;
$query = "SELECT site_name, cell_name, bsc_name, bss_drop, AVG(sddr) FROM flexi_cs GROUP BY cell_name ORDER BY AVG(sddr) DESC";
$result = mysql_query($query);
while ($rowsql = mysql_fetch_assoc($result)) {
    $x = $rowsql['AVG(sddr)'];
    if ($x > 5) {
        ?>

        <tr>  
            <td align="center"><a href="alarm_details.php?object_name=<?php echo $rowsql['site_name']; ?>" target="_blank"><font color=blue><?php echo $rowsql['site_name']; ?></font></a></td>
            <td align="center"><?php echo $rowsql['cell_name']; ?></td>	
            <td align="center"><?php echo $rowsql['bsc_name']; ?></td>					
            <td align="center"><?php echo round($rowsql['AVG(sddr)'], 0); ?></td>				
        </tr>

        <?php
    }
}
?>
</table>		

<table class="dash-table" border=1>
    <tr>
        <th colspan=3 style="background: red"> Zero CS Traffic Sites </th>
    </tr>	
    <tr>
    <center>
        <th style="background: #91C910">Site Name </th>	
        <th style="background: #91C910">Cell Name </th>			
        <th style="background: #91C910">BSC Name </th>
    </center>
</tr>		
<?php
//echo $object_name;
$query = "SELECT cell_name, site_name, bsc_name, sum(bh_traffic) FROM flexi_cs GROUP BY cell_name ORDER BY cell_name";
$result = mysql_query($query);
while ($rowsql = mysql_fetch_assoc($result)) {
    $x = $rowsql['sum(bh_traffic)'];
    $site_name = $rowsql['site_name'];
    if ($x == '0' AND strlen($site_name) > 4 AND strlen($site_name) < 12) {
        ?>

        <tr>  
            <td align="center"><a href="alarm_details.php?object_name=<?php echo $rowsql['site_name']; ?>" target="_blank"><font color=blue><?php echo $rowsql['site_name']; ?></font></a></td>			
            <td align="center"><?php echo $rowsql['cell_name']; ?></td>	
            <td align="center"><?php echo $rowsql['bsc_name']; ?></td>							
        </tr>

        <?php
    }
}
?>
</table>

<table class="dash-table" border=1>
    <tr>
        <th colspan=3 style="background: red"> Zero PS Traffic Sites </th>
    </tr>	
    <tr>
    <center>
        <th style="background: #91C910">Site Name </th>	
        <th style="background: #91C910">Cell Name </th>			
        <th style="background: #91C910">BSC Name </th>
    </center>
</tr>		
<?php
//echo $object_name;
$query = "SELECT cell_name, site_name, bsc_name, sum(bh_traffic) FROM flexi_cs GROUP BY site_name ORDER BY site_name";
$result = mysql_query($query);
while ($rowsql = mysql_fetch_assoc($result)) {
    $x = $rowsql['sum(bh_traffic)'];
    $site_name = $rowsql['site_name'];
    if ($x == '0' AND strlen($site_name) > 4 AND strlen($site_name) < 12) {
        ?>

        <tr>  
            <td align="center"><a href="alarm_details.php?object_name=<?php echo $rowsql['site_name']; ?>" target="_blank"><font color=blue><?php //echo $rowsql['site_name'];     ?></font></a></td>			
            <td align="center"><?php //echo $rowsql['cell_name'];     ?></td>	
            <td align="center"><?php //echo $rowsql['bsc_name'];      ?></td>							
        </tr>

        <?php
    }
}
?>
</table>	

</div>

</div>
</div>
</div>
<script type="text/javascript">
    Element.cleanWhitespace('content');
    init();
</script>

<!-- end of tabbed -->
<div class=top-portion>

</div>	

</body>
</html>