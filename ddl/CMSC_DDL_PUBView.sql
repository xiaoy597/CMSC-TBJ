--------------------------------CMSC_FUTRS_INVST_CNT--------------------------------

REPLACE VIEW nspubview.CMSC_FUTRS_INVST_CNT(
 TJRQ
,QHTZZS
) AS LOCKING nspubmart.CMSC_FUTRS_INVST_CNT FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,QHTZZS (TITLE '�ڻ�Ͷ������')
FROM nspubmart.CMSC_FUTRS_INVST_CNT;

COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT AS 'CMSC_J0007_�ڻ�Ͷ������';

COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT.QHTZZS AS '�ڻ�Ͷ������';

--------------------------------CMSC_FUTRS_INVST_CNT_EQT--------------------------------

REPLACE VIEW nspubview.CMSC_FUTRS_INVST_CNT_EQT(
 TJRQ
,TZZFL
,QHTZZSL
,QHTZZSLZB
) AS LOCKING nspubmart.CMSC_FUTRS_INVST_CNT_EQT FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,TZZFL (TITLE 'Ͷ���߷���')
,QHTZZSL (TITLE '�ڻ�Ͷ��������')
,QHTZZSLZB (TITLE '�ڻ�Ͷ��������ռ��')
FROM nspubmart.CMSC_FUTRS_INVST_CNT_EQT;

COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_EQT AS 'CMSC_J0008_�ڻ�Ͷ������_��Ȩ��ֲ�����';

COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_EQT.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_EQT.TZZFL AS 'Ͷ���߷���';
COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_EQT.QHTZZSL AS '�ڻ�Ͷ��������';
COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_EQT.QHTZZSLZB AS '�ڻ�Ͷ��������ռ��';

--------------------------------CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL--------------------------------

REPLACE VIEW nspubview.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL(
 TJRQ
,TZZFL
,CJSL
,CJSLZB
) AS LOCKING nspubmart.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,TZZFL (TITLE 'Ͷ���߷���')
,CJSL (TITLE '�ɽ�����')
,CJSLZB (TITLE '�ɽ�����ռ��')
FROM nspubmart.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL;

COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL AS 'CMSC_J0009_Ͷ���߽�����_���ֹ���ֵ����';

COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL.TZZFL AS 'Ͷ���߷���';
COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL.CJSL AS '�ɽ�����';
COMMENT ON nspubview.CMSC_FUTRS_INVST_CNT_HLD_MKT_VAL.CJSLZB AS '�ɽ�����ռ��';

--------------------------------CMSC_INVST_CNT_AGE--------------------------------

REPLACE VIEW nspubview.CMSC_INVST_CNT_AGE(
 TJRQ
,TZZFL
,TZZSL
,TZZSLZB
) AS LOCKING nspubmart.CMSC_INVST_CNT_AGE FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,TZZFL (TITLE 'Ͷ���߷���')
,TZZSL (TITLE 'Ͷ��������')
,TZZSLZB (TITLE 'Ͷ��������ռ��')
FROM nspubmart.CMSC_INVST_CNT_AGE;

COMMENT ON nspubview.CMSC_INVST_CNT_AGE AS 'CMSC_J0005_Ͷ������_���������';

COMMENT ON nspubview.CMSC_INVST_CNT_AGE.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_INVST_CNT_AGE.TZZFL AS 'Ͷ���߷���';
COMMENT ON nspubview.CMSC_INVST_CNT_AGE.TZZSL AS 'Ͷ��������';
COMMENT ON nspubview.CMSC_INVST_CNT_AGE.TZZSLZB AS 'Ͷ��������ռ��';

--------------------------------CMSC_INVST_CNT_EDCT--------------------------------

REPLACE VIEW nspubview.CMSC_INVST_CNT_EDCT(
 TJRQ
,TZZFL
,TZZSL
,TZZSLZB
) AS LOCKING nspubmart.CMSC_INVST_CNT_EDCT FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,TZZFL (TITLE 'Ͷ���߷���')
,TZZSL (TITLE 'Ͷ��������')
,TZZSLZB (TITLE 'Ͷ��������ռ��')
FROM nspubmart.CMSC_INVST_CNT_EDCT;

COMMENT ON nspubview.CMSC_INVST_CNT_EDCT AS 'CMSC_J0004_Ͷ������_��ѧ������';

COMMENT ON nspubview.CMSC_INVST_CNT_EDCT.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_INVST_CNT_EDCT.TZZFL AS 'Ͷ���߷���';
COMMENT ON nspubview.CMSC_INVST_CNT_EDCT.TZZSL AS 'Ͷ��������';
COMMENT ON nspubview.CMSC_INVST_CNT_EDCT.TZZSLZB AS 'Ͷ��������ռ��';

--------------------------------CMSC_INVST_CNT_HLD_MKT_VAL--------------------------------

REPLACE VIEW nspubview.CMSC_INVST_CNT_HLD_MKT_VAL(
 TJRQ
,TZZFL
,TZZSL
,TZZSLZB
) AS LOCKING nspubmart.CMSC_INVST_CNT_HLD_MKT_VAL FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,TZZFL (TITLE 'Ͷ���߷���')
,TZZSL (TITLE 'Ͷ��������')
,TZZSLZB (TITLE 'Ͷ��������ռ��')
FROM nspubmart.CMSC_INVST_CNT_HLD_MKT_VAL;

COMMENT ON nspubview.CMSC_INVST_CNT_HLD_MKT_VAL AS 'CMSC_J0006_Ͷ������_���ֹ���ֵ����';

COMMENT ON nspubview.CMSC_INVST_CNT_HLD_MKT_VAL.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_INVST_CNT_HLD_MKT_VAL.TZZFL AS 'Ͷ���߷���';
COMMENT ON nspubview.CMSC_INVST_CNT_HLD_MKT_VAL.TZZSL AS 'Ͷ��������';
COMMENT ON nspubview.CMSC_INVST_CNT_HLD_MKT_VAL.TZZSLZB AS 'Ͷ��������ռ��';

--------------------------------CMSC_LIST_COMP_DVD_AMT--------------------------------

REPLACE VIEW nspubview.CMSC_LIST_COMP_DVD_AMT(
 TJRQ
,SSGSFHJE
) AS LOCKING nspubmart.CMSC_LIST_COMP_DVD_AMT FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,SSGSFHJE (TITLE '���й�˾�ֺ���')
FROM nspubmart.CMSC_LIST_COMP_DVD_AMT;

COMMENT ON nspubview.CMSC_LIST_COMP_DVD_AMT AS 'CMSC_J0001_���й�˾�ֺ���';

COMMENT ON nspubview.CMSC_LIST_COMP_DVD_AMT.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_LIST_COMP_DVD_AMT.SSGSFHJE AS '���й�˾�ֺ���';

--------------------------------CMSC_OPEN_INVST_CNT--------------------------------

REPLACE VIEW nspubview.CMSC_OPEN_INVST_CNT(
 TJRQ
,PD
,ZZRKHS
,JGKHS
) AS LOCKING nspubmart.CMSC_OPEN_INVST_CNT FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,PD (TITLE 'Ƶ��')
,ZZRKHS (TITLE '��Ȼ�˿�����')
,JGKHS (TITLE '����������')
FROM nspubmart.CMSC_OPEN_INVST_CNT;

COMMENT ON nspubview.CMSC_OPEN_INVST_CNT AS 'CMSC_J0003_������';

COMMENT ON nspubview.CMSC_OPEN_INVST_CNT.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_OPEN_INVST_CNT.PD AS 'Ƶ��';
COMMENT ON nspubview.CMSC_OPEN_INVST_CNT.ZZRKHS AS '��Ȼ�˿�����';
COMMENT ON nspubview.CMSC_OPEN_INVST_CNT.JGKHS AS '����������';

--------------------------------CMSC_TOT_INVST_CNT--------------------------------

REPLACE VIEW nspubview.CMSC_TOT_INVST_CNT(
 TJRQ
,TZZZRS
) AS LOCKING nspubmart.CMSC_TOT_INVST_CNT FOR ACCESS SELECT
 TJRQ (TITLE 'ͳ������')
,TZZZRS (TITLE 'Ͷ����������')
FROM nspubmart.CMSC_TOT_INVST_CNT;

COMMENT ON nspubview.CMSC_TOT_INVST_CNT AS 'CMSC_J0002_Ͷ������';

COMMENT ON nspubview.CMSC_TOT_INVST_CNT.TJRQ AS 'ͳ������';
COMMENT ON nspubview.CMSC_TOT_INVST_CNT.TZZZRS AS 'Ͷ����������';