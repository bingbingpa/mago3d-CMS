-- FK, Index �� ���� ���Ϸ� �и�. �� �������� �۾� ����
drop table if exists converter_job cascade;
drop table if exists converter_job_detail cascade;

-- file converter job
create table converter_job(
	converter_job_id				bigint,
	upload_data_id					bigint,
	user_id							varchar(32),
	title							varchar(256)						not null,
	converter_type					char(1)								default '0',
	file_count						int									default 0,
	status							char(1)								default '0',
	error_code						varchar(4000),
	update_date						timestamp with time zone,
	insert_date						timestamp with time zone			default now(),
	constraint converter_job_pk 	primary key (converter_job_id)	
);

comment on table converter_job is 'file converter job';
comment on column converter_job.converter_job_id is '������ȣ';
comment on column converter_job.upload_data_id is '����� ���̵�';
comment on column converter_job.user_id is '����� ���̵�';
comment on column converter_job.converter_type is '��ȯ ���ø�. 0 : ����(������), 1 : �⺻, 2 : ū �ǹ�, 3 : �ʴ��� �ǹ�';
comment on column converter_job.file_count is '��� file ����';
comment on column converter_job.status is '0: �غ�, 1: ����, 2: Ȯ���ʿ�, 3: ����';
comment on column converter_job.error_code is '���� �ڵ�';
comment on column converter_job.update_date is '������';
comment on column converter_job.insert_date is '�����';


-- ����� f4d ��ȯ �̷�
create table converter_job_file(
	converter_job_file_id				bigint,
	converter_job_id					bigint,
	upload_data_id						bigint,
	upload_data_file_id					bigint,
	project_id							int,
	user_id								varchar(32),
	status								char(1)								default '0',
	error_code							varchar(4000),
	insert_date							timestamp with time zone			default now(),
	constraint converter_job_file_pk 	primary key (converter_job_file_id)	
);

comment on table converter_job_file is 'converter ��� ����';
comment on column converter_job_file.converter_job_file_id is '������ȣ';
comment on column converter_job_file.converter_job_id is 'converter job ������ȣ';
comment on column converter_job_file.upload_data_id is '���ε� ���� ������ȣ';
comment on column converter_job_file.upload_data_file_id is '���ε� ���� ������ȣ';
comment on column converter_job_file.project_id is 'project ������ȣ';
comment on column converter_job_file.user_id is '����� ���̵�';
comment on column converter_job_file.status is '����. 0: ����, 1: Ȯ���ʿ�, 2: ����';
comment on column converter_job_file.error_code is '���� �ڵ�';
comment on column converter_job_file.insert_date is '�����';


