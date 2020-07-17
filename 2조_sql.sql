create table FAQ(
qId varchar2(20),
qQuestion VARCHAR2(100),
qAnswer VARCHAR2(1000),
qKategorie VARCHAR2(50)
);

create table clients(
    cId varchar2(20) constraint users_pk PRIMARY key,
    cPw varchar2(20) not null,
    cName varchar2(10) not null,
    cTel varchar2(20) not null,
    cEmail varchar2(30) not null,
    cNation varchar2(20) not null,
    cResiAddr varchar2(80) not null
);


create table notice(
    nNo number(10) constraint notice_pk primary key,
    nTitle varchar2(40) not null,
    nDate date not null,
    nContent varchar2(2000) not null,
    nFile varchar2(200),
    nFname varchar2(200)
);
CREATE SEQUENCE notice_se start with 1 INCREMENT by 1  nocache;


create table inquire(
    iNo number(10) constraint inquire_pk primary key,
    iId varchar2(20),
    iName varchar2(20) not null,
    iTitle varchar2(40) not null,
    iDate date default sysdate,
    iContent varchar2(500) not null,
    iFile varchar2(80),
    constraint inquire_fk foreign key (iId) references clients(cId) on delete CASCADE
);
CREATE SEQUENCE inquire_seq nocache;


create table schedule(
    pId number(10) constraint schedule_pk primary key,
    pDTime date not null,
    pATime date not null,
    pDeparture varchar2(30) not null,
    pArrive varchar2(30) not null,
    pAdultPrice number(10) not null,
    pChildPrice number(10) not null,
    pBabyPrice number(10) not null
);


create table reservation(
    rNo number(10),
    rPId number(10),
    rId varchar2(20),
    rDTime date not null,
    rDeparture varchar2(30) not null,
    rATime date not null,
    rArrive varchar2(30) not null,
    rSeat varchar2(30) not null,
    CONSTRAINT reservation_fk FOREIGN KEY (rId) REFERENCES clients(cId) on delete cascade
);
create sequence reservation_rNo
start with 1
increment by 1 nocache;



create table noReservation(
    nNo number(10),
    nPId number(10),
    nId varchar2(20),
    nDTime date not null,
    nDeparture varchar2(30) not null,
    nATime date not null,
    nArrive varchar2(30) not null,
    nSeat varchar2(30) not null,
    CONSTRAINT noReservation_fk FOREIGN KEY (nId) REFERENCES clients(cId) on delete cascade
);
create sequence noReservation_nNo
start with 1
increment by 1 nocache;