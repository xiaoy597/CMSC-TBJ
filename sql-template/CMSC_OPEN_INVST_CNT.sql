
DELETE FROM ${NSPUBMART}.CMSC_OPEN_INVST_CNT
WHERE TJRQ = SUBSTR(CAST(CAST(ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1) AS DATE FORMAT 'YYYYMMDD') AS CHAR(8)),1,6)
;

.IF ERRORCODE <> 0 THEN .QUIT 12;

INSERT INTO ${NSPUBMART}.CMSC_OPEN_INVST_CNT
SELECT 
SUBSTR(CAST(CAST(ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1) AS DATE FORMAT 'YYYYMMDD') AS CHAR(8)),1,6) AS TJRQ
,'M' as PD
,T1.ZZRKHS - T2.ZZRKHS AS ZZRKHS
,T1.JGKHS - T2.JGKHS AS JGKHS
FROM
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(MONTH FROM CALENDAR_DATE) = EXTRACT(MONTH FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T1,
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(MONTH FROM CALENDAR_DATE) = EXTRACT(MONTH FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-2))
		AND EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-2))
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T2
WHERE T1.ZZRKHS IS NOT NULL
AND T2.ZZRKHS IS NOT NULL
;

.IF ERRORCODE <> 0 THEN .QUIT 12;

INSERT INTO ${NSPUBMART}.CMSC_OPEN_INVST_CNT
SELECT 
SUBSTR(CAST(CAST(ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1) AS DATE FORMAT 'YYYYMMDD') AS CHAR(8)),1,6) AS TJRQ
,'Q' as PD
,T1.ZZRKHS - T2.ZZRKHS AS ZZRKHS
,T1.JGKHS - T2.JGKHS AS JGKHS
FROM
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE 
	EXTRACT(MONTH FROM CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD')) IN (1,4,7,10)
	AND STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(MONTH FROM CALENDAR_DATE) = EXTRACT(MONTH FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T1,
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE 
	EXTRACT(MONTH FROM CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD')) IN (1,4,7,10)
	AND STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(MONTH FROM CALENDAR_DATE) = EXTRACT(MONTH FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-4))
		AND EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-4))
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T2
WHERE T1.ZZRKHS IS NOT NULL
AND T2.ZZRKHS IS NOT NULL
;

.IF ERRORCODE <> 0 THEN .QUIT 12;

INSERT INTO ${NSPUBMART}.CMSC_OPEN_INVST_CNT
SELECT 
SUBSTR(CAST(CAST(ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1) AS DATE FORMAT 'YYYYMMDD') AS CHAR(8)),1,6) AS TJRQ
,'H' as PD
,T1.ZZRKHS - T2.ZZRKHS AS ZZRKHS
,T1.JGKHS - T2.JGKHS AS JGKHS
FROM
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE 
	EXTRACT(MONTH FROM CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD')) IN (1,7)
	AND STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(MONTH FROM CALENDAR_DATE) = EXTRACT(MONTH FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T1,
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE 
	EXTRACT(MONTH FROM CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD')) IN (1,7)
	AND STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(MONTH FROM CALENDAR_DATE) = EXTRACT(MONTH FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-7))
		AND EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-7))
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T2
WHERE T1.ZZRKHS IS NOT NULL
AND T2.ZZRKHS IS NOT NULL
;

.IF ERRORCODE <> 0 THEN .QUIT 12;

INSERT INTO ${NSPUBMART}.CMSC_OPEN_INVST_CNT
SELECT 
SUBSTR(CAST(CAST(ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1) AS DATE FORMAT 'YYYYMMDD') AS CHAR(8)),1,6) AS TJRQ
,'Y' as PD
,T1.ZZRKHS - T2.ZZRKHS AS ZZRKHS
,T1.JGKHS - T2.JGKHS AS JGKHS
FROM
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE 
	EXTRACT(MONTH FROM CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD')) IN (1)
	AND STAT_DATE = (
		SELECT MAX(CALENDAR_DATE)
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1))
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T1,
(
	SELECT
	SUM(case when STK_INVST_SORT = '1000' then IDX_VAL else 0 end) as ZZRKHS
	,SUM(case when STK_INVST_SORT in ('2000', '3000', '4000') then IDX_VAL else 0 end) as JGKHS
	FROM ${NSPUBVIEW}.KPI_OAP_ACCT_VOL
	WHERE 
	EXTRACT(MONTH FROM CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD')) IN (1)
	AND STAT_DATE = (
		SELECT MAX(CALENDAR_DATE) 
		FROM ${NSPVIEW}.PTY_TRAD_CLND
		WHERE EXTRACT(YEAR FROM CALENDAR_DATE) = EXTRACT(YEAR FROM ADD_MONTHS(CAST('${TXDATE}' AS DATE FORMAT 'YYYYMMDD'),-1)) - 1
		AND IF_TRADDAY = 1
	)
	AND IDX_CDE = 'SK018'
	AND FREQ = 'D'
	AND STK_INVST_SORT IN ('1000', '2000', '3000', '4000')
	AND ACCT_TYPE = '-1'
	AND INVST_OPN_ACCT_PPDM = '-1'
) T2
WHERE T1.ZZRKHS IS NOT NULL
AND T2.ZZRKHS IS NOT NULL
;

.IF ERRORCODE <> 0 THEN .QUIT 12;

.QUIT
