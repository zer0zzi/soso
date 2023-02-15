--로그인/회원가입
create table member(
	mem_num number,
	mem_id varchar2(10) unique not null,
	mem_auth number(1) default 2 not null,--0:탈퇴 1:정지 2:일반 9:관리자
	mem_nick varchar2(30),	
	mem_au_id varchar2(40),
	constraint member_pk primary key (mem_num)
);

create table member_detail(
	mem_num number,
	mem_name varchar2(30) not null,
	mem_pw varchar2(40) not null,
	mem_phone varchar2(15) not null,
	mem_email varchar2(50) not null,
	mem_zipcode varchar2(5) not null,
	mem_address1 varchar2(90) not null,
	mem_address2 varchar2(90) not null,
	mem_photo blob,
	mem_photo_name varchar2(100),
	mem_reg date default sysdate not null,
	mem_modify date,
	constraint member_detail_pk primary key (mem_num),
	constraint member_detail_fk1 foreign key (mem_num) references member (mem_num)
);

create sequence member_seq;
