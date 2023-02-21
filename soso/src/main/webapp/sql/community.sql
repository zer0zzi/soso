--커뮤니티
--1. 자유 게시판
--1-1) 자유 게시판
create table free_board(
 free_num number,
 free_fixed number(10) default 2 not null, --고정:1, 고정x:2
 free_title varchar2(100) not null,
 free_content clob not null,
 free_hit number(8) default 0 not null,
 free_regdate date default sysdate not null,
 free_modifydate date,
 free_uploadfile blob,
 free_filename varchar2(100),
 free_ip varchar2(40) not null,
 mem_num number not null,
 constraint free_board_pk primary key (free_num),
 constraint free_board_fk foreign key (mem_num) references member (mem_num)
);
create sequence free_board_seq;

--1-2) 자유 게시판 댓글
create table free_reply(
 fre_num number, --댓글번호
 fre_pnum number(10), --대댓글 구현 위한 번호
 fre_content varchar2(1500) not null, --댓글 내용
 fre_regdate date default sysdate not null,
 fre_modifydate date,
 fre_ip varchar2(40) not null,
 free_num number not null, --게시물번호
 mem_num number not null, --작성자
 constraint free_reply_pk primary key (fre_num),
 constraint free_reply_fk1 foreign key (free_num) references free_board (free_num),
 constraint free_reply_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence free_reply_seq;

--1-3) 자유 게시판 좋아요
create table free_fav(
 f_fav_num number,
 free_num number not null,
 mem_num number not null,
 constraint free_fav_pk primary key (f_fav_num),
 constraint free_fav_fk1 foreign key (free_num) references free_board (free_num),
 constraint free_fav_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence free_fav_seq;

--2. 홍보 라운지
--2-1) 홍보 라운지
create table promo_board(
 promo_num number,
 promo_fixed number(10) default 2 not null, --고정:1, 고정x:2
 promo_title varchar2(100) not null,
 promo_content clob not null,
 promo_hit number(8) default 0 not null,
 promo_regdate date default sysdate not null,
 promo_modifydate date,
 promo_uploadfile blob,
 promo_filename varchar2(100),
 promo_ip varchar2(40) not null,
 mem_num number not null,
 stc_num number,
 constraint promo_board_pk primary key (promo_num),
 constraint promo_board_fk1 foreign key (mem_num) references member (mem_num),
 constraint promo_board_fk2 foreign key (stc_num) references study_create (stc_num)
);
create sequence promo_board_seq;

--2-2) 홍보 라운지 댓글
create table promo_reply(
 pre_num number,
 pre_pnum number(10),
 pre_content varchar2(1500) not null,
 pre_regdate date default sysdate not null,
 pre_modifydate date,
 pre_ip varchar2(40) not null,
 promo_num number not null,
 mem_num number not null,
 constraint promo_reply_pk primary key (pre_num),
 constraint promo_reply_fk1 foreign key (promo_num) references promo_board (promo_num),
 constraint promo_reply_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence promo_reply_seq;

--2-3) 홍보 라운지 좋아요
create table promo_fav(
 p_fav_num number,
 promo_num number not null,
 mem_num number not null,
 constraint promo_fav_pk primary key (p_fav_num),
 constraint promo_fav_fk1 foreign key (promo_num) references promo_board (promo_num),
 constraint promo_fav_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence promo_fav_seq;

--3. 리뷰
--3-1) 리뷰 게시판
create table review_board(
 review_num number,
 review_fixed number(10) default 2 not null, --고정:1, 고정x:2
 review_title varchar2(100) not null,
 review_rating number(8) not null, --0.0~5.0
 review_content clob not null,
 review_hit number(8) default 0 not null,
 review_regdate date default sysdate not null,
 review_modifydate date,
 review_uploadfile blob,
 review_filename varchar2(100),
 review_ip varchar2(40) not null,
 mem_num number not null,
 stc_num number,
 constraint review_board_pk primary key (review_num),
 constraint review_board_fk1 foreign key (mem_num) references member (mem_num),
 constraint review_board_fk2 foreign key (stc_num) references study_create (stc_num)
);
create sequence review_board_seq;

--3-2) 홍보 라운지 댓글
create table review_reply(
 vre_num number,
 vre_pnum number(10),
 vre_content varchar2(1500) not null,
 vre_regdate date default sysdate not null,
 vre_modifydate date,
 vre_ip varchar2(40) not null,
 review_num number not null,
 mem_num number not null,
 constraint review_reply_pk primary key (vre_num),
 constraint review_reply_fk1 foreign key (review_num) references review_board (review_num),
 constraint review_reply_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence promo_reply_seq;

--3-3) 홍보 라운지 좋아요
create table review_fav(
 v_fav_num number,
 review_num number not null,
 mem_num number not null,
 constraint review_fav_pk primary key (v_fav_num),
 constraint review_fav_fk1 foreign key (review_num) references review_board (review_num),
 constraint review_fav_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence review_fav_seq;