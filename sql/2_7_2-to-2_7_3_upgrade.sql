ALTER TABLE lists
  ADD begdate    date          DEFAULT NULL,
  ADD enddate    date          DEFAULT NULL,
  ADD occurrence int(11)       DEFAULT 0,
  ADD referredby varchar(255)  DEFAULT NULL,
  ADD extrainfo  varchar(255)  DEFAULT NULL;

ALTER TABLE patient_data
  ADD squad      int(11)       NOT NULL DEFAULT 0,
  ADD fitness    int(11)       NOT NULL DEFAULT 0;

ALTER TABLE history_data
  CHANGE last_breast_exam        last_breast_exam        varchar(255) DEFAULT '',
  CHANGE last_mammogram          last_mammogram          varchar(255) DEFAULT '',
  CHANGE last_gynocological_exam last_gynocological_exam varchar(255) DEFAULT '',
  CHANGE last_rectal_exam        last_rectal_exam        varchar(255) DEFAULT '',
  CHANGE last_prostate_exam      last_prostate_exam      varchar(255) DEFAULT '',
  CHANGE last_physical_exam      last_physical_exam      varchar(255) DEFAULT '',
  CHANGE last_sigmoidoscopy_colonoscopy last_sigmoidoscopy_colonoscopy varchar(255) DEFAULT '',
  ADD    last_ecg             varchar(255) NOT NULL DEFAULT '',
  ADD    last_cardiac_echo    varchar(255) NOT NULL DEFAULT '',
  -- here is 1 digit for each of the above exams, in order, with values
  -- 0=n/a, 1=normal, 2=abnormal:
  ADD    last_exam_results    varchar(255) NOT NULL DEFAULT '000000000';

UPDATE history_data SET last_breast_exam        = '' WHERE last_breast_exam        = '0000-00-00 00:00:00';
UPDATE history_data SET last_mammogram          = '' WHERE last_mammogram          = '0000-00-00 00:00:00';
UPDATE history_data SET last_gynocological_exam = '' WHERE last_gynocological_exam = '0000-00-00 00:00:00';
UPDATE history_data SET last_rectal_exam        = '' WHERE last_rectal_exam        = '0000-00-00 00:00:00';
UPDATE history_data SET last_prostate_exam      = '' WHERE last_prostate_exam      = '0000-00-00 00:00:00';
UPDATE history_data SET last_physical_exam      = '' WHERE last_physical_exam      = '0000-00-00 00:00:00';
UPDATE history_data SET last_sigmoidoscopy_colonoscopy = '' WHERE last_sigmoidoscopy_colonoscopy = '0000-00-00 00:00:00';
