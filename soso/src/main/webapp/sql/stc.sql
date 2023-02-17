–스터디 모집
create table study_create(
    stc_num number,
    stc_title varchar2(90) not null,
    stc_content clob not null,
    stc_state varchar2(100) not null,
    stc_period varchar2(50) not null,
    stc_per number(3) default 1 not null,
    stc_way varchar2(50) not null,
    stc_filter varchar2(300) not null,
    stc_filename varchar2(100),
    stc_uploadfile blob,
    stc_date date default sysdate not null,
    stc_modify_date date,
    hit number(8) default 0 not null,
    mem_num number not null,
    constraint study_create_pk primary key (stc_num),
    constraint study_create_fk1 foreign key (mem_num) references member (mem_num) 
); 
create sequence stc_seq;
