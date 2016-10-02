-- --------------------------------------------------------
-- Host:                         10.10.91.23
-- Server version:               5.0.27-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for ran_kpi
CREATE DATABASE IF NOT EXISTS `ran_kpi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ran_kpi`;


-- Dumping structure for table ran_kpi.alarm_info
CREATE TABLE IF NOT EXISTS `alarm_info` (
  `dn` varchar(50) default NULL,
  `original_severity` varchar(50) default NULL,
  `alarm_time` varchar(50) default NULL,
  `cancel_time` varchar(50) default NULL,
  `ack_status` varchar(50) default NULL,
  `ack_time` varchar(50) default NULL,
  `acked_by` varchar(50) default NULL,
  `alarm_number` varchar(50) default NULL,
  `text` varchar(50) default NULL,
  `object_name` varchar(100) default NULL,
  `address` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.bcf
CREATE TABLE IF NOT EXISTS `bcf` (
  `id` mediumint(9) NOT NULL auto_increment,
  `ver` varchar(18) default NULL,
  `dname` varchar(100) default NULL,
  `bsc` decimal(18,0) default NULL,
  `bcf` decimal(18,0) default NULL,
  `sid` decimal(18,0) default NULL,
  `lat` decimal(18,0) default NULL,
  `longg` decimal(18,0) default NULL,
  `name` varchar(18) default NULL,
  `adm` decimal(18,0) default NULL,
  `autocfg` decimal(18,0) default NULL,
  `bbupr` decimal(18,0) default NULL,
  `bcchbbut` decimal(18,0) default NULL,
  `bcftype` decimal(18,0) default NULL,
  `sitesubtype` decimal(18,0) default NULL,
  `lapdname` varchar(18) default NULL,
  `lapdnumber` decimal(18,0) default NULL,
  `ntrxbbuTimer` decimal(18,0) default NULL,
  `port0` decimal(18,0) default NULL,
  `port1` decimal(18,0) default NULL,
  `port2` decimal(18,0) default NULL,
  `port3` decimal(18,0) default NULL,
  `port4` decimal(18,0) default NULL,
  `port5` decimal(18,0) default NULL,
  `port6` decimal(18,0) default NULL,
  `port7` decimal(18,0) default NULL,
  `rxdLimit` decimal(18,0) default NULL,
  `autounl` decimal(18,0) default NULL,
  `clksrc` decimal(18,0) default NULL,
  `ftrsAbisgrm` decimal(18,0) default NULL,
  `mclkBCF` decimal(18,0) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.flexi_cs
CREATE TABLE IF NOT EXISTS `flexi_cs` (
  `hour` varchar(100) NOT NULL,
  `bsc_name` varchar(100) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `cell_name` varchar(100) NOT NULL,
  `bh_traffic` varchar(100) NOT NULL,
  `radio_drop` int(10) unsigned NOT NULL,
  `bss_drop` int(10) unsigned NOT NULL,
  `ho_drop` int(11) unsigned NOT NULL,
  `cdr_n` int(20) default NULL,
  `cdr_d` int(20) default NULL,
  `cdr` varchar(100) NOT NULL,
  `tch_ass_fail_bss` varchar(100) NOT NULL,
  `avail_tch_mean` varchar(100) NOT NULL,
  `sddr` varchar(100) NOT NULL,
  `cssr` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.flexi_cs_seg_d
CREATE TABLE IF NOT EXISTS `flexi_cs_seg_d` (
  `PERIOD_START_TIME` varchar(100) NOT NULL,
  `BSC_Name` varchar(100) NOT NULL,
  `Segment_Name` varchar(100) NOT NULL default '',
  `SEGMENT` varchar(100) NOT NULL,
  `BH_TRAFFIC` double NOT NULL,
  `BH_TRAFFIC_FR` double NOT NULL,
  `BH_TRAFFIC_HR` double NOT NULL,
  `RADIO_DROP` int(11) NOT NULL,
  `BSS_DROP` int(11) NOT NULL,
  `HO_DROP` int(11) NOT NULL,
  `CDR_N` int(11) NOT NULL,
  `CDR_D` int(11) NOT NULL,
  `CALL_DROP_RATE` double NOT NULL,
  `TCH_ASS_FAIL_RADIO` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_CONG` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_DR` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_BSS` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_N` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_D` varchar(100) NOT NULL,
  `TCH_ASS_FAIL` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_F` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_H` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_total` int(11) NOT NULL,
  `AVAIL_TCH_MEAN` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_total_MAX` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_MAX` varchar(100) NOT NULL,
  `SDCCH_DROP_N` int(11) NOT NULL,
  `SDCCH_DROP_D` int(11) NOT NULL,
  `SDCCH_DROP_RATE` double NOT NULL,
  `CALL_SETUP_TCH_BLOCKING_RATE_N` varchar(100) NOT NULL,
  `CALL_SETUP_TCH_BLOCKING_RATE_D` varchar(100) NOT NULL,
  `CALL_SETUP_TCH_BLOCKING_RATE` varchar(100) NOT NULL,
  `CALL_SETUP_SUCCESS_RATE` varchar(100) NOT NULL,
  `HO_SUCCESS_RATE_N` varchar(100) NOT NULL,
  `HO_SUCCESS_RATE_D` varchar(100) NOT NULL,
  `HO_SUCCESS_RATE` double NOT NULL,
  `TCH_BLOCKING_N` int(11) NOT NULL,
  `TCH_BLOCKING_D` int(11) NOT NULL,
  `TCH_BLOCKING_RATE` double NOT NULL,
  `SDCCH_BLOCKING_N` varchar(100) NOT NULL,
  `SDCCH_BLOCKING_D` varchar(100) NOT NULL,
  `SDCCH_BLOCKING_RATE` double NOT NULL,
  `AVAIL_SDCCH_MEAN` varchar(100) NOT NULL,
  `SDCCH_BH_TRAFFIC` varchar(100) NOT NULL,
  `SUCC_OUT_HO_INTRABSC` varchar(100) NOT NULL,
  `SUCC_OUT_HO_INTERBSC` varchar(100) NOT NULL,
  `SUCC_OUT_HO_INTRACELL` varchar(100) NOT NULL,
  `ATT_OUT_HO_INTRABSC` varchar(100) NOT NULL,
  `ATT_OUT_HO_INTERBSC` varchar(100) NOT NULL,
  `ATT_OUT_HO_INTRACELL` varchar(100) NOT NULL,
  `TCH_SUCC` varchar(100) NOT NULL,
  `TCH_ATTEMPTS` varchar(100) NOT NULL,
  `TCH_Success_Rate` double NOT NULL,
  `TCH_Request_F` varchar(100) NOT NULL,
  `TCH_Request_H` varchar(100) NOT NULL,
  `TCH_Requests` varchar(100) NOT NULL,
  `UL_QUALITY_HO` varchar(100) NOT NULL,
  `DL_QUALITY_HO` varchar(100) NOT NULL,
  `UL_LEV_HO` varchar(100) NOT NULL,
  `DL_LEV_HO` varchar(100) NOT NULL,
  `DIST_HO` varchar(100) NOT NULL,
  `BETTER_CELL_HO` varchar(100) NOT NULL,
  `DR_HO` varchar(100) NOT NULL,
  `FORCED_HO_ONM` varchar(100) NOT NULL,
  `TRAFFIC_HO` varchar(100) NOT NULL,
  `FAST_UL_HO` varchar(100) NOT NULL,
  `FORCED_HO_DUE_TO_PREAMTION` varchar(100) NOT NULL,
  `CAUSE_INTFER_UP` varchar(100) NOT NULL,
  `CAUSE_INTFER_DWN` varchar(100) NOT NULL,
  `HO_ATT_DUE_TO_GPRS` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_FR` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_HR` varchar(100) NOT NULL,
  `HO_ATTEMPT_INTERBAND_DUE_LEVEL` varchar(100) NOT NULL,
  `HO_ATT_INTER_BAND_TCH` varchar(100) NOT NULL,
  `HO_ATT_Other_Cause` varchar(100) NOT NULL,
  `TS_IB1_MAX` varchar(100) NOT NULL,
  `TS_IB2_MAX` varchar(100) NOT NULL,
  `TS_IB3_MAX` varchar(100) NOT NULL,
  `TS_IB4_MAX` varchar(100) NOT NULL,
  `TS_IB5_MAX` varchar(100) NOT NULL,
  `UL_QUAL_HO_VOL` varchar(100) NOT NULL,
  `DL_QUAL_HO_VOL` varchar(100) NOT NULL,
  `UL_LEV_HO_VOL` varchar(100) NOT NULL,
  `DL_LEV_HO_VOL` varchar(100) NOT NULL,
  `DIST_HO_VOL` varchar(100) NOT NULL,
  `BETTER_CELL_VOL` varchar(100) NOT NULL,
  `DR_HO_VOL` varchar(100) NOT NULL,
  `FORCED_HO_ONM_VOL` varchar(100) NOT NULL,
  `TRAFFIC_HO_VOL` varchar(100) NOT NULL,
  `FAST_UPLINK_HO_VOL` varchar(100) NOT NULL,
  `FORCED_HO_DUE_TO_PREAMTION_VOL` varchar(100) NOT NULL,
  `CAUSE_INTFER_UP_vol` varchar(100) NOT NULL,
  `CAUSE_INTFER_DWN_vol` varchar(100) NOT NULL,
  `HO_ATT_DUE_TO_GPRS_vol` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_FR_vol` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_HR_vol` varchar(100) NOT NULL,
  `HO_ATTEMPT_INTERBAND_DUE_LEVEL_vol` varchar(100) NOT NULL,
  `HO_ATT_INTER_BAND_TCH_vol` varchar(100) NOT NULL,
  `HO_ATT_Other_Cause_vol` varchar(100) NOT NULL,
  `ATT_OUT_HO` varchar(100) NOT NULL,
  `SUC_SDCCH_SEIZURES` varchar(100) NOT NULL,
  `SDCCH_ATTEMPTS` varchar(100) NOT NULL,
  `SDCCH_ASS_FAIL` varchar(100) NOT NULL,
  `SDCCH_Succ_Rate` varchar(100) NOT NULL,
  `INTRA_BSC_SUCCESS_RATE` varchar(100) NOT NULL,
  `INTER_BSC_SUCCESS_RATE` varchar(100) NOT NULL,
  `INTRA_Cell_SUCCESS_RATE` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_CONG_BH` varchar(100) NOT NULL,
  `TCH_ATTEMPTS_BH` varchar(100) NOT NULL,
  `TOTAL_TRAFFIC` varchar(100) NOT NULL,
  `TOTAL_TRAFFIC_HR` varchar(100) NOT NULL,
  `TOTAL_TRAFFIC_FR` varchar(100) NOT NULL,
  `TRAFFIC_AVG` varchar(100) NOT NULL,
  `RACH_ACCESS_FAIL` varchar(100) NOT NULL,
  `AGCH_LOSS_RATE` varchar(100) NOT NULL,
  `PCH_LOSS_RATE` varchar(100) NOT NULL,
  `LAC_UPDATE_RATIO` varchar(100) NOT NULL,
  `LAC_UPDATE_SUCC_RATE` varchar(100) NOT NULL,
  `TCH_TIME_CONG` varchar(100) NOT NULL,
  `SDCCH_TIME_CONG` varchar(100) NOT NULL,
  `SUCC_HO_INTER_BAND_DUE_LEVEL` varchar(100) NOT NULL,
  `SUCCESSFUL_HO_INTER_BAND_TCH` varchar(100) NOT NULL,
  `Inter_Band_HOSR_UL_to_1800` varchar(100) NOT NULL,
  `Inter_Band_HOSR_1800_to_900` varchar(100) NOT NULL,
  `Inter_Band_HOSR` varchar(100) NOT NULL,
  `UNSRV_QD_CALL_ATT` varchar(100) NOT NULL,
  `UL_qual_in_class_4` varchar(100) NOT NULL,
  `DL_qual_in_class_4` varchar(100) NOT NULL,
  `SAIC_MS_PENETRATION` varchar(100) NOT NULL,
  `OSC_HR_TRAFFIC` varchar(100) NOT NULL,
  `OSC_FR_TRAFFIC` varchar(100) NOT NULL,
  `ATTEMPT_DHR` varchar(100) NOT NULL,
  `FAIL_DHR` varchar(100) NOT NULL,
  `CSDAP_ATTEMPT` varchar(100) NOT NULL,
  `CSDAP_FAIL` varchar(100) NOT NULL,
  `AMR_TRAFFIC_FR` varchar(100) NOT NULL,
  `AMR_TRAFFIC_HR` varchar(100) NOT NULL,
  `AVG_SDCCH_HOLD_TIME` varchar(100) NOT NULL,
  `AVERAGE_TCH_HOLD_TIME` varchar(100) NOT NULL,
  `CALL_ATTEMPTS_IN_QUEUE` varchar(100) NOT NULL,
  `FR_TCH_BLOCKING` varchar(100) NOT NULL,
  `HR_TCH_BLOCKING` varchar(100) NOT NULL,
  `FTCH_BLOCKING_DUE_TO_HR` varchar(100) NOT NULL,
  `HTCH_BLOCKING_DUE_TO_FR` varchar(100) NOT NULL,
  `AVAIL_PS_DEDICATED` varchar(100) NOT NULL,
  `NO_OF_DEFINED_PDCH_PER_CELL` varchar(100) NOT NULL,
  `CDR_N_RE_EST` varchar(100) NOT NULL,
  `CDR_D_RE_EST` varchar(100) NOT NULL,
  `CALL_DROP_RATE_RE_EST` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.flexi_cs_seg_hr
CREATE TABLE IF NOT EXISTS `flexi_cs_seg_hr` (
  `PERIOD_START_TIME` varchar(100) NOT NULL,
  `BSC_Name` varchar(100) NOT NULL,
  `Segment_Name` varchar(100) NOT NULL,
  `SEGMENT` varchar(100) NOT NULL,
  `BH_TRAFFIC` double NOT NULL,
  `BH_TRAFFIC_FR` double NOT NULL,
  `BH_TRAFFIC_HR` double NOT NULL,
  `RADIO_DROP` int(11) NOT NULL,
  `BSS_DROP` int(11) NOT NULL,
  `HO_DROP` int(11) NOT NULL,
  `CDR_N` int(11) NOT NULL,
  `CDR_D` int(11) NOT NULL,
  `CALL_DROP_RATE` double default NULL,
  `TCH_ASS_FAIL_RADIO` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_CONG` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_DR` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_BSS` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_N` int(11) NOT NULL,
  `TCH_ASS_FAIL_D` int(11) NOT NULL,
  `TCH_ASS_FAIL` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_F` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_H` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_total` int(11) NOT NULL,
  `AVAIL_TCH_MEAN` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_total_MAX` varchar(100) NOT NULL,
  `AVAIL_TCH_MEAN_MAX` varchar(100) NOT NULL,
  `SDCCH_DROP_N` int(11) NOT NULL,
  `SDCCH_DROP_D` int(11) NOT NULL,
  `SDCCH_DROP_RATE` double NOT NULL,
  `CALL_SETUP_TCH_BLOCKING_RATE_N` double NOT NULL,
  `CALL_SETUP_TCH_BLOCKING_RATE_D` double NOT NULL,
  `CALL_SETUP_TCH_BLOCKING_RATE` double NOT NULL,
  `CALL_SETUP_SUCCESS_RATE` double NOT NULL,
  `HO_SUCCESS_RATE_N` int(11) NOT NULL,
  `HO_SUCCESS_RATE_D` int(11) NOT NULL,
  `HO_SUCCESS_RATE` double NOT NULL,
  `TCH_BLOCKING_N` int(11) NOT NULL,
  `TCH_BLOCKING_D` int(11) NOT NULL,
  `TCH_BLOCKING_RATE` double NOT NULL,
  `SDCCH_BLOCKING_N` int(11) NOT NULL,
  `SDCCH_BLOCKING_D` int(11) NOT NULL,
  `SDCCH_BLOCKING_RATE` double NOT NULL,
  `AVAIL_SDCCH_MEAN` varchar(100) NOT NULL,
  `SDCCH_BH_TRAFFIC` varchar(100) NOT NULL,
  `SUCC_OUT_HO_INTRABSC` varchar(100) NOT NULL,
  `SUCC_OUT_HO_INTERBSC` varchar(100) NOT NULL,
  `SUCC_OUT_HO_INTRACELL` varchar(100) NOT NULL,
  `ATT_OUT_HO_INTRABSC` varchar(100) NOT NULL,
  `ATT_OUT_HO_INTERBSC` varchar(100) NOT NULL,
  `ATT_OUT_HO_INTRACELL` varchar(100) NOT NULL,
  `TCH_SUCC` varchar(100) NOT NULL,
  `TCH_ATTEMPTS` varchar(100) NOT NULL,
  `TCH_Success_Rate` double NOT NULL,
  `TCH_Request_F` varchar(100) NOT NULL,
  `TCH_Request_H` varchar(100) NOT NULL,
  `TCH_Requests` varchar(100) NOT NULL,
  `UL_QUALITY_HO` varchar(100) NOT NULL,
  `DL_QUALITY_HO` varchar(100) NOT NULL,
  `UL_LEV_HO` varchar(100) NOT NULL,
  `DL_LEV_HO` varchar(100) NOT NULL,
  `DIST_HO` varchar(100) NOT NULL,
  `BETTER_CELL_HO` varchar(100) NOT NULL,
  `DR_HO` varchar(100) NOT NULL,
  `FORCED_HO_ONM` varchar(100) NOT NULL,
  `TRAFFIC_HO` varchar(100) NOT NULL,
  `FAST_UL_HO` varchar(100) NOT NULL,
  `FORCED_HO_DUE_TO_PREAMTION` varchar(100) NOT NULL,
  `CAUSE_INTFER_UP` varchar(100) NOT NULL,
  `CAUSE_INTFER_DWN` varchar(100) NOT NULL,
  `HO_ATT_DUE_TO_GPRS` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_FR` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_HR` varchar(100) NOT NULL,
  `HO_ATTEMPT_INTERBAND_DUE_LEVEL` varchar(100) NOT NULL,
  `HO_ATT_INTER_BAND_TCH` varchar(100) NOT NULL,
  `HO_ATT_Other_Cause` varchar(100) NOT NULL,
  `TS_IB1_MAX` varchar(100) NOT NULL,
  `TS_IB2_MAX` varchar(100) NOT NULL,
  `TS_IB3_MAX` varchar(100) NOT NULL,
  `TS_IB4_MAX` varchar(100) NOT NULL,
  `TS_IB5_MAX` varchar(100) NOT NULL,
  `UL_QUAL_HO_VOL` varchar(100) NOT NULL,
  `DL_QUAL_HO_VOL` varchar(100) NOT NULL,
  `UL_LEV_HO_VOL` varchar(100) NOT NULL,
  `DL_LEV_HO_VOL` varchar(100) NOT NULL,
  `DIST_HO_VOL` varchar(100) NOT NULL,
  `BETTER_CELL_VOL` varchar(100) NOT NULL,
  `DR_HO_VOL` varchar(100) NOT NULL,
  `FORCED_HO_ONM_VOL` varchar(100) NOT NULL,
  `TRAFFIC_HO_VOL` varchar(100) NOT NULL,
  `FAST_UPLINK_HO_VOL` varchar(100) NOT NULL,
  `FORCED_HO_DUE_TO_PREAMTION_VOL` varchar(100) NOT NULL,
  `CAUSE_INTFER_UP_vol` varchar(100) NOT NULL,
  `CAUSE_INTFER_DWN_vol` varchar(100) NOT NULL,
  `HO_ATT_DUE_TO_GPRS_vol` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_FR_vol` varchar(100) NOT NULL,
  `HO_ATT_FOR_AMR_TO_HR_vol` varchar(100) NOT NULL,
  `HO_ATTEMPT_INTERBAND_DUE_LEVEL_vol` varchar(100) NOT NULL,
  `HO_ATT_INTER_BAND_TCH_vol` varchar(100) NOT NULL,
  `HO_ATT_Other_Cause_vol` varchar(100) NOT NULL,
  `ATT_OUT_HO` varchar(100) NOT NULL,
  `SUC_SDCCH_SEIZURES` varchar(100) NOT NULL,
  `SDCCH_ATTEMPTS` varchar(100) NOT NULL,
  `SDCCH_ASS_FAIL` varchar(100) NOT NULL,
  `SDCCH_Succ_Rate` double NOT NULL,
  `INTRA_BSC_SUCCESS_RATE` double NOT NULL,
  `INTER_BSC_SUCCESS_RATE` double NOT NULL,
  `INTRA_Cell_SUCCESS_RATE` varchar(100) NOT NULL,
  `TCH_ASS_FAIL_CONG_BH` varchar(100) NOT NULL,
  `TCH_ATTEMPTS_BH` varchar(100) NOT NULL,
  `TOTAL_TRAFFIC` varchar(100) NOT NULL,
  `TOTAL_TRAFFIC_HR` varchar(100) NOT NULL,
  `TOTAL_TRAFFIC_FR` varchar(100) NOT NULL,
  `TRAFFIC_AVG` varchar(100) NOT NULL,
  `RACH_ACCESS_FAIL` varchar(100) NOT NULL,
  `AGCH_LOSS_RATE` varchar(100) NOT NULL,
  `PCH_LOSS_RATE` varchar(100) NOT NULL,
  `LAC_UPDATE_RATIO` varchar(100) NOT NULL,
  `LAC_UPDATE_SUCC_RATE` double NOT NULL,
  `TCH_TIME_CONG` varchar(100) NOT NULL,
  `SDCCH_TIME_CONG` varchar(100) NOT NULL,
  `SUCC_HO_INTER_BAND_DUE_LEVEL` varchar(100) NOT NULL,
  `SUCCESSFUL_HO_INTER_BAND_TCH` varchar(100) NOT NULL,
  `Inter_Band_HOSR_UL_to_1800` varchar(100) NOT NULL,
  `Inter_Band_HOSR_1800_to_900` varchar(100) NOT NULL,
  `Inter_Band_HOSR` varchar(100) NOT NULL,
  `UNSRV_QD_CALL_ATT` varchar(100) NOT NULL,
  `UL_qual_in_class_4` varchar(100) NOT NULL,
  `DL_qual_in_class_4` varchar(100) NOT NULL,
  `SAIC_MS_PENETRATION` varchar(100) NOT NULL,
  `OSC_HR_TRAFFIC` varchar(100) NOT NULL,
  `OSC_FR_TRAFFIC` varchar(100) NOT NULL,
  `ATTEMPT_DHR` varchar(100) NOT NULL,
  `FAIL_DHR` varchar(100) NOT NULL,
  `CSDAP_ATTEMPT` varchar(100) NOT NULL,
  `CSDAP_FAIL` varchar(100) NOT NULL,
  `AMR_TRAFFIC_FR` varchar(100) NOT NULL,
  `AMR_TRAFFIC_HR` varchar(100) NOT NULL,
  `AVG_SDCCH_HOLD_TIME` varchar(100) NOT NULL,
  `AVERAGE_TCH_HOLD_TIME` varchar(100) NOT NULL,
  `CALL_ATTEMPTS_IN_QUEUE` varchar(100) NOT NULL,
  `FR_TCH_BLOCKING` varchar(100) NOT NULL,
  `HR_TCH_BLOCKING` varchar(100) NOT NULL,
  `FTCH_BLOCKING_DUE_TO_HR` varchar(100) NOT NULL,
  `HTCH_BLOCKING_DUE_TO_FR` varchar(100) NOT NULL,
  `AVAIL_PS_DEDICATED` varchar(100) NOT NULL,
  `NO_OF_DEFINED_PDCH_PER_CELL` varchar(100) NOT NULL,
  `CDR_N_RE_EST` varchar(100) NOT NULL,
  `CDR_D_RE_EST` varchar(100) NOT NULL,
  `CALL_DROP_RATE_RE_EST` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.flexi_ps
CREATE TABLE IF NOT EXISTS `flexi_ps` (
  `PERIOD_START_TIME` date default NULL,
  `BSC_Name` varchar(50) default NULL,
  `Segment_Name` varchar(50) default NULL,
  `SEGMENT` varchar(50) default NULL,
  `Total_GPRS_RLC_payload_data` double default NULL,
  `Total_EGPRS_RLC_payload_data` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.hdata
CREATE TABLE IF NOT EXISTS `hdata` (
  `Object_Name` varchar(100) NOT NULL default '',
  `NEType` varchar(100) NOT NULL,
  `AlarmSource` varchar(100) NOT NULL,
  `AlarmName` varchar(500) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `Severity` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `OccurrenceTime` varchar(100) NOT NULL,
  `ClearanceTime` varchar(100) NOT NULL,
  `Location_Info` varchar(500) NOT NULL default '',
  `AlarmID` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.nbl_distribution
CREATE TABLE IF NOT EXISTS `nbl_distribution` (
  `PERIOD_START_TIME` date default NULL,
  `BSC Name` varchar(50) default NULL,
  `Segment Name` varchar(50) default NULL,
  `SEGMENT` int(50) default NULL,
  `offset_sample_above_40 (C92042)` int(50) default NULL,
  `offset_sample_of_1 (C92002)` int(50) default NULL,
  `offset_sample_of_10 (C92011)` int(50) default NULL,
  `offset_sample_of_11 (C92012)` int(50) default NULL,
  `offset_sample_of_12 (C92013)` int(50) default NULL,
  `offset_sample_of_13 (C92014)` int(50) default NULL,
  `offset_sample_of_14 (C92015)` int(50) default NULL,
  `offset_sample_of_15 (C92016)` int(50) default NULL,
  `offset_sample_of_16 (C92017)` int(50) default NULL,
  `offset_sample_of_17 (C92018)` int(50) default NULL,
  `offset_sample_of_18 (C92019)` int(50) default NULL,
  `offset_sample_of_19 (C92020)` int(50) default NULL,
  `offset_sample_of_2 (C92003)` int(50) default NULL,
  `offset_sample_of_20 (C92021)` int(50) default NULL,
  `offset_sample_of_21 (C92022)` int(50) default NULL,
  `offset_sample_of_22 (C92023)` int(50) default NULL,
  `offset_sample_of_23 (C92024)` int(50) default NULL,
  `offset_sample_of_24 (C92025)` int(50) default NULL,
  `offset_sample_of_25 (C92026)` int(50) default NULL,
  `offset_sample_of_26 (C92027)` int(50) default NULL,
  `offset_sample_of_27 (C92028)` int(50) default NULL,
  `offset_sample_of_28 (C92029)` int(50) default NULL,
  `offset_sample_of_29 (C92030)` int(50) default NULL,
  `offset_sample_of_3 (C92004)` int(50) default NULL,
  `offset_sample_of_30 (C92031)` int(50) default NULL,
  `offset_sample_of_31 (C92032)` int(50) default NULL,
  `offset_sample_of_32 (C92033)` int(50) default NULL,
  `offset_sample_of_33 (C92034)` int(50) default NULL,
  `offset_sample_of_34 (C92035)` int(50) default NULL,
  `offset_sample_of_35 (C92036)` int(50) default NULL,
  `offset_sample_of_36 (C92037)` int(50) default NULL,
  `offset_sample_of_37 (C92038)` int(50) default NULL,
  `offset_sample_of_38 (C92039)` int(50) default NULL,
  `offset_sample_of_39 (C92040)` int(50) default NULL,
  `offset_sample_of_4 (C92005)` int(50) default NULL,
  `offset_sample_of_40 (C92041)` int(50) default NULL,
  `offset_sample_of_5 (C92006)` int(50) default NULL,
  `offset_sample_of_6 (C92007)` int(50) default NULL,
  `offset_sample_of_7 (C92008)` int(50) default NULL,
  `offset_sample_of_8 (C92009)` int(50) default NULL,
  `offset_sample_of_9 (C92010)` int(50) default NULL,
  `offset_sample_of_m_1 (C92082)` int(50) default NULL,
  `offset_sample_of_m_10 (C92073)` int(50) default NULL,
  `offset_sample_of_m_11 (C92072)` int(50) default NULL,
  `offset_sample_of_m_12 (C92071)` int(50) default NULL,
  `offset_sample_of_m_13 (C92070)` int(50) default NULL,
  `offset_sample_of_m_14 (C92069)` int(50) default NULL,
  `offset_sample_of_m_15 (C92068)` int(50) default NULL,
  `offset_sample_of_m_16 (C92067)` int(50) default NULL,
  `offset_sample_of_m_17 (C92066)` int(50) default NULL,
  `offset_sample_of_m_18 (C92065)` int(50) default NULL,
  `offset_sample_of_m_19 (C92064)` int(50) default NULL,
  `offset_sample_of_m_2 (C92081)` int(50) default NULL,
  `offset_sample_of_m_20 (C92063)` int(50) default NULL,
  `offset_sample_of_m_21 (C92062)` int(50) default NULL,
  `offset_sample_of_m_22 (C92061)` int(50) default NULL,
  `offset_sample_of_m_23 (C92060)` int(50) default NULL,
  `offset_sample_of_m_24 (C92059)` int(50) default NULL,
  `offset_sample_of_m_25 (C92058)` int(50) default NULL,
  `offset_sample_of_m_26 (C92057)` int(50) default NULL,
  `offset_sample_of_m_27 (C92056)` int(50) default NULL,
  `offset_sample_of_m_28 (C92055)` int(50) default NULL,
  `offset_sample_of_m_29 (C92054)` int(50) default NULL,
  `offset_sample_of_m_3 (C92080)` int(50) default NULL,
  `offset_sample_of_m_30 (C92053)` int(50) default NULL,
  `offset_sample_of_m_31 (C92052)` int(50) default NULL,
  `offset_sample_of_m_32 (C92051)` int(50) default NULL,
  `offset_sample_of_m_33 (C92050)` int(50) default NULL,
  `offset_sample_of_m_34 (C92049)` int(50) default NULL,
  `offset_sample_of_m_35 (C92048)` int(50) default NULL,
  `offset_sample_of_m_36 (C92047)` int(50) default NULL,
  `offset_sample_of_m_37 (C92046)` int(50) default NULL,
  `offset_sample_of_m_38 (C92045)` int(50) default NULL,
  `offset_sample_of_m_39 (C92044)` int(50) default NULL,
  `offset_sample_of_m_4 (C92079)` int(50) default NULL,
  `offset_sample_of_m_40 (C92043)` int(50) default NULL,
  `offset_sample_of_m_5 (C92078)` int(50) default NULL,
  `offset_sample_of_m_6 (C92077)` int(50) default NULL,
  `offset_sample_of_m_7 (C92076)` int(50) default NULL,
  `offset_sample_of_m_8 (C92075)` int(50) default NULL,
  `offset_sample_of_zero (C92001)` int(50) default NULL,
  `offset_sample_below_zero (C92000)` int(50) default NULL,
  `c_i_target_ul_offset (C100001)` int(50) default NULL,
  `offset_sample_of_m_9 (C92074)` int(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.net_diag
CREATE TABLE IF NOT EXISTS `net_diag` (
  `dn` varchar(50) default NULL,
  `original_severity` varchar(50) default NULL,
  `alarm_time` varchar(50) default NULL,
  `cancel_time` varchar(50) NOT NULL,
  `ack_status` varchar(50) default NULL,
  `ack_time` varchar(50) default NULL,
  `acked_by` varchar(50) default NULL,
  `alarm_number` varchar(50) default NULL,
  `text` varchar(200) default NULL,
  `sup_info` varchar(100) default NULL,
  `object_name` varchar(100) default NULL,
  `address` varchar(50) default NULL,
  `vip_site` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.net_diag_hr
CREATE TABLE IF NOT EXISTS `net_diag_hr` (
  `dn` varchar(50) default NULL,
  `original_severity` varchar(50) default NULL,
  `alarm_time` varchar(50) default NULL,
  `cancel_time` varchar(50) NOT NULL,
  `ack_status` varchar(50) default NULL,
  `ack_time` varchar(50) default NULL,
  `acked_by` varchar(50) default NULL,
  `alarm_number` varchar(50) default NULL,
  `text` varchar(200) default NULL,
  `sup_info` varchar(100) default NULL,
  `object_name` varchar(100) default NULL,
  `address` varchar(50) default NULL,
  `vip_site` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.rsbss_1016_d
CREATE TABLE IF NOT EXISTS `rsbss_1016_d` (
  `BTS_GID` varchar(150) NOT NULL,
  `BTS_Name` varchar(50) NOT NULL,
  `TRX_ID` int(50) NOT NULL,
  `Rx_level_range_dBm` float NOT NULL,
  `UL_q0` float NOT NULL,
  `UL_q1` float NOT NULL,
  `UL_q2` float default NULL,
  `UL_q3` float NOT NULL,
  `UL_q4` float NOT NULL,
  `UL_q5` float NOT NULL,
  `UL_q6` float NOT NULL,
  `UL_q7` float NOT NULL,
  `Samples` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.rsbss_1016_hr
CREATE TABLE IF NOT EXISTS `rsbss_1016_hr` (
  `BTS_GID` varchar(150) NOT NULL,
  `BTS_Name` varchar(50) NOT NULL,
  `TRX_ID` int(50) NOT NULL,
  `Rx_level_range_(dBm)` float NOT NULL,
  `UL_q0` float NOT NULL,
  `UL_q1` float NOT NULL,
  `UL_q2` float default NULL,
  `UL_q3` float NOT NULL,
  `UL_q4` float NOT NULL,
  `UL_q5` float NOT NULL,
  `UL_q6` float NOT NULL,
  `UL_q7` float NOT NULL,
  `Samples` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.rsbss_196_d
CREATE TABLE IF NOT EXISTS `rsbss_196_d` (
  `PERIOD_START_TIME` varchar(100) NOT NULL,
  `BSC_Name` varchar(100) NOT NULL,
  `BCF_Name` varchar(100) NOT NULL,
  `BTS_Name` varchar(100) NOT NULL,
  `TRX_Name` varchar(100) NOT NULL,
  `TRX_ID` int(11) NOT NULL,
  `UL_cumulative_quality_ratio_in_class_0` float default NULL,
  `UL_cumulative_quality_ratio_in_class_1` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_2` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_3` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_4` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_5` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_6` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_7` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_0` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_1` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_2` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_3` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_4` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_5` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_6` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_7` float NOT NULL,
  `Non-AMR_call_time_(minutes)` float NOT NULL,
  `Call_time_difference_between_TRXs` float NOT NULL,
  `UL_interference_from_power_control` float NOT NULL,
  `Average_TRX_Frequency` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.rsbss_196_hr
CREATE TABLE IF NOT EXISTS `rsbss_196_hr` (
  `PERIOD_START_TIME` varchar(100) NOT NULL,
  `BSC_Name` varchar(100) NOT NULL,
  `BCF_Name` varchar(100) NOT NULL,
  `BTS_Name` varchar(100) NOT NULL,
  `TRX_Name` varchar(100) NOT NULL,
  `TRX_ID` int(11) NOT NULL,
  `UL_cumulative_quality_ratio_in_class_0` float default NULL,
  `UL_cumulative_quality_ratio_in_class_1` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_2` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_3` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_4` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_5` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_6` float NOT NULL,
  `UL_cumulative_quality_ratio_in_class_7` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_0` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_1` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_2` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_3` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_4` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_5` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_6` float NOT NULL,
  `DL_cumulative_quality_ratio_in_class_7` float NOT NULL,
  `Non-AMR_call_time_(minutes)` float NOT NULL,
  `Call_time_difference_between_TRXs` float NOT NULL,
  `UL_interference_from_power_control` float NOT NULL,
  `Average_TRX_Frequency` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.sp_case
CREATE TABLE IF NOT EXISTS `sp_case` (
  `object_name` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.sp_case_copy
CREATE TABLE IF NOT EXISTS `sp_case_copy` (
  `object_name` varchar(100) default NULL,
  `text` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.sw_db
CREATE TABLE IF NOT EXISTS `sw_db` (
  `sysname` varchar(50) default NULL,
  `ip` varchar(50) default NULL,
  `alarm_time` varchar(50) default NULL,
  `cancel_time` varchar(50) NOT NULL,
  `ack_status` varchar(50) default NULL,
  `ack_time` varchar(50) default NULL,
  `acked_by` varchar(50) default NULL,
  `alarm_number` varchar(50) default NULL,
  `text` varchar(200) default NULL,
  `sup_info` varchar(100) default NULL,
  `object_name` varchar(100) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.sw_int_load
CREATE TABLE IF NOT EXISTS `sw_int_load` (
  `resourceName` varchar(50) default NULL,
  `collectionTime` varchar(50) default NULL,
  `granularity` varchar(50) NOT NULL,
  `inboundRate` varchar(50) default NULL,
  `outboundRate` varchar(50) default NULL,
  `inboundBWutilization` double default NULL,
  `outboundBWutilization` double default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ran_kpi.update_date
CREATE TABLE IF NOT EXISTS `update_date` (
  `cs_update` varchar(100) default NULL,
  `alarm_update` varchar(100) default NULL,
  `net_diag_update` varchar(100) default NULL,
  `alarm_update_hr` varchar(100) default NULL,
  `net_diag_update_hr` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
