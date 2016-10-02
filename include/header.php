<?php
    include 'include/db.php';
?>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>RAN KPI Analyzer</title>	
    <link rel='stylesheet' type='text/css' href='css/style.css'/>

    <script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>		
    <script language="JavaScript">
        function loadPage(list) {
            location.href = list.options[list.selectedIndex].value
        }
    </script>

    <style type="text/css" media="screen">
        @import "css/filtergrid.css";

        .textarea-table {
            width:130px;
            padding:4px;
            font: normal .9em Trebuchet MS, Arial, Sans-serif;
            height:30px;
            display:block;
            color:#777;
            background-color : #e7edf2;
        }

    </style>	

    <script type="text/javascript" src="scripts/js/prototype.lite.js"></script>
    <script type="text/javascript" src="scripts/js/moo.fx.js"></script>
    <script type="text/javascript" src="scripts/js/moo.fx.pack.js"></script>
    
    <script type="text/javascript">
        function init() {
            var stretchers = document.getElementsByClassName('box');
            var toggles = document.getElementsByClassName('tab');
            var myAccordion = new fx.Accordion(
                    toggles, stretchers, {opacity: false, height: true, duration: 600}
            );
            var found = false;
            toggles.each(function (h3, i) {
                var div = Element.find(h3, 'nextSibling');
                if (window.location.href.indexOf(h3.title) > 0) {
                    myAccordion.showThisHideOpen(div);
                    found = true;
                }
            });
            if (!found)
                myAccordion.showThisHideOpen(stretchers[0]);
        }
    </script>

</head>
<body onload="CoolClock.findAndCreateClocks()">
    <header>

        <script>
            function open_win()
            {
                window.open("file_upload.php", "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=650, height=410, left=700px, top=200px ");
            }
        </script>

        <nav>
            <input type="button" class="myButton" value="Update Database" onclick="open_win()">
        </nav>

        <div class=logo>
            <img src=images/logo.jpg>		
        </div>
        <div class=banner>
            <table class="bsc-selection">
                <tr>
                    <td>
                        <form>
                            <select name="URL"
                                    onchange="window.open(this.form.URL.options[this.form.URL.selectedIndex].value)"
                                    style="background-color:#91C910"
                                    >
                                <option value="">:: Select BSC for Cellwise KPI:: </option>
                                <?php
                                $query = "select bsc_name, sum(bss_drop) from flexi_cs group by bsc_name order by sum(bss_drop) desc ";
                                $result = mysql_query($query);
                                while ($rowsql = mysql_fetch_assoc($result)) {
                                    $x = $rowsql['sum(bss_drop)'];
                                    if ($x > '500') {
                                        ?>
                                        <option value="kpi_analysis_bsc.php?object_name=<?php echo $rowsql['bsc_name']; ?>"><?php echo $rowsql['bsc_name']; ?></option>
                                        <?php
                                    }
                                }
                                ?>
                            </select>
                        </form>
                    </td>
                    <td>
                        <form>
                            <select name="URL"
                                    onchange="window.open(this.form.URL.options[this.form.URL.selectedIndex].value)"
                                    style="background-color:#91C910"
                                    >
                                <option value="">:: Select BSC to See Alarms :: </option>
                                <?php
                                $query = "select bsc_name, sum(bss_drop) from flexi_cs group by bsc_name order by sum(bss_drop) desc ";
                                $result = mysql_query($query);
                                while ($rowsql = mysql_fetch_assoc($result)) {
                                    $x = $rowsql['sum(bss_drop)'];
                                    if ($x > '500') {
                                        ?>
                                        <option value="alarm_details.php?object_name=<?php echo $rowsql['bsc_name']; ?>"><?php echo $rowsql['bsc_name']; ?></option>
                                        <?php
                                    }
                                }
                                ?>
                            </select>
                        </form>
                    </td>				
                </tr>

            </table>	
        </div>

    </header>
    <!-- start of tabbed -->
    <div id="wrapper">
        <div id="content">
            <div class="boxholder">
                <div class="box">			
                    <p><strong><font color=blue> RAN KPI Dashboard:</font></strong><font color=red>  Find the overall summary for Nokia BSCs of Banglalink Network. Click BLUE links to get more info...</font>   <font color="blue">Last updated on: 
                        <?php
                        $res = mysql_query("SELECT cs_update FROM update_date");
                        while ($row = mysql_fetch_assoc($res)) {
                            echo $row['cs_update'];
                        }
                        ?> </font></p>