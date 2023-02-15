--채팅방
create table talkroom(
 talkroom_num number,
 talkroom_name varchar2(600) not null,
 talkroom_date date default sysdate not null,
 constraint talkroom_pk primary key (talkroom_num)
);
create sequence talkroom_seq;

--채팅방 멤버
create table talk_member(
 talkroom_num number not null,
 mem_num number not null,
 constraint talkmember_fk1 foreign key (talkroom_num) references talkroom (talkroom_num),
 constraint talkmember_fk2 foreign key (mem_num) references member (mem_num)
);

--채팅 메시지
create table talk(
 talk_num number,
 talkroom_num number not null,--수신그룹
 mem_num number not null, --발신자
 message varchar2(4000) not null,
 chat_date date default sysdate not null,
 constraint talk_pk primary key (talk_num),
 constraint talk_fk1 foreign key (talkroom_num) references talkroom (talkroom_num),
 constraint talk_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence talk_seq;

--채팅 메시지 읽기
create table talk_read(
 talkroom_num number not null,
 talk_num number not null,
 mem_num number not null,
 constraint read_fk foreign key (talkroom_num) references talkroom (talkroom_num),
 constraint read_fk2 foreign key (talk_num) references talk (talk_num), 
 constraint read_fk3 foreign key (mem_num) references member (mem_num)
);
