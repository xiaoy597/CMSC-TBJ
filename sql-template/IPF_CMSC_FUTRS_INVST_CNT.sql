/*
版本信息:1.0
创建者	:XYU
功能描述:期货投资者数
加载类型:全量加载
源		 表：
	NSPUBMART.KPI_FINVST_UOPACCT_CDE_VOL_IDX -- 期货投资者统一开户编码数量指标表
目	标	表:	nsPubMart.CMSC_INVST_CNT_AGE	-- 期货投资者数
频		 度:M:月
创建日期:	2018-01-24
修改历史:
修改人	修改日期	修改内容
*/

DELETE FROM ${NSPUBMART}.CMSC_FUTRS_INVST_CNT
WHERE TJRQ = SUBSTR(CAST(CAST(ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1) AS DATE FORMAT 'YYYYMMDD') AS CHAR(8)),1,6)
;

.IF ERRORCODE <> 0 THEN .QUIT 12;

INSERT INTO ${NSPUBMART}.CMSC_FUTRS_INVST_CNT
SELECT 
SUBSTR(CAST(CAST(ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1) AS DATE FORMAT 'YYYYMMDD') AS CHAR(8)),1,6) AS TJRQ
,IDX_VAL AS QHTZZS
FROM ${NSPUBVIEW}.KPI_FINVST_UOPACCT_CDE_VOL_IDX
WHERE STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(MONTH FROM CALENDAR_DATE) = EXTRACT(MONTH FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND IF_TRADDAY = 1
	)
AND IDX_CDE = 'FS001'
AND FREQ = 'D'
AND VART_ONE_CLSF = '-1'
AND EXCH_NBR = '-1'
AND FUTRS_INVST_SORT = '-1'; 

.IF ERRORCODE <> 0 THEN .QUIT 12;

.QUIT