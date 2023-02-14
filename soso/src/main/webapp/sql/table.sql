--회원관리
create table spmember(
 mem_num number,
 id varchar2(12) unique not null,
 nick_name varchar2(30),
 auth number(1) default 2 not null, --0탈퇴회원,1정지회원,2일반회원,9관리자
 au_id varchar2(36), --자동 로그인에 사용되는 식별값
 constraint spmember_pk primary key (mem_num)
);

create table spmember_detail(
 mem_num number,
 name varchar2(30) not null,
 passwd varchar2(35) not null,
 phone varchar2(15) not null,
 email varchar2(50) not null,
 zipcode varchar2(5) not null,
 address1 varchar2(90) not null,
 address2 varchar2(90) not null,
 hobby varchar2(300),
 photo blob,
 photo_name varchar2(100),
 reg_date date default sysdate not null,
 modify_date date,
 constraint spmember_detail_pk primary key (mem_num),
 constraint spmember_detail_fk1 foreign key (mem_num)
                          references spmember (mem_num)
);

create sequence spmember_seq;

--게시판
create table spboard(
 board_num number,
 title varchar2(90) not null,
 content clob not null,
 hit number(8) default 0 not null,
 reg_date date default sysdate not null,
 modify_date date,
 uploadfile blob,
 filename varchar2(100),
 ip varchar2(40) not null,
 mem_num number not null,
 constraint spboard_pk primary key (board_num),
 constraint spboard_fk1 foreign key (mem_num)
                    references spmember (mem_num)
);

create sequence spboard_seq;

--게시판 좋아요
create table spboard_fav(
 fav_num number,
 board_num number not null,
 mem_num number not null,
 constraint spboard_fav_pk primary key (fav_num),
 constraint fav_spboard_fk1 foreign key (board_num)
                      references spboard (board_num),
 constraint fav_spmember_fk2 foreign key (mem_num)
                      references spmember (mem_num)
);
create sequence spfav_seq;

--게시판 댓글
create table spboard_reply(
 re_num number,
 re_content varchar2(900) not null,
 re_date date default sysdate not null,
 re_mdate date,
 re_ip varchar2(40) not null,
 board_num number not null,
 mem_num number not null,
 constraint spboard_reply_pk primary key (re_num),
 constraint reply_spboard_fk1 foreign key (board_num)
                        references spboard (board_num),
 constraint reply_spmember_fk2 foreign key (mem_num)
                        references spmember (mem_num)
);
create sequence spreply_seq;

--채팅
--채팅방
create table sptalkroom(
 talkroom_num number,
 talkroom_name varchar2(900) not null,
 talkroom_date date default sysdate not null,
 constraint sptalkroom_pk primary key (talkroom_num)
);
create sequence sptalkroom_seq;

--채팅방 멤버
create table sptalk_member(
 talkroom_num number not null,
 mem_num number not null,
 constraint sptalkmember_fk1 foreign key (talkroom_num)
                    references sptalkroom (talkroom_num),
 constraint sptalkmember_fk2 foreign key (mem_num)
                    references spmember (mem_num)
);

--채팅 메시지
create table sptalk(
 talk_num number,
 talkroom_num number not null, -- 수신그룹
 mem_num number not null, -- 발신자
 message varchar2(4000) not null,
 chat_date date default sysdate not null,
 constraint sptalk_pk primary key (talk_num),
 constraint sptalk_fk1 foreign key (talkroom_num)
                references sptalkroom (talkroom_num),
 constraint sptalk_fk2 foreign key (mem_num)
                references spmember (mem_num)
);
create sequence sptalk_seq;

--채팅 메시지 읽기
create table sptalk_read(
 talkroom_num number not null,
 talk_num number not null,
 mem_num number not null,
 constraint read_fk foreign key (talkroom_num)
              references sptalkroom (talkroom_num),
 constraint read_fk2 foreign key (talk_num)
                     references sptalk (talk_num),
 constraint read_fk3 foreign key (mem_num)
                     references spmember (mem_num)           
);






