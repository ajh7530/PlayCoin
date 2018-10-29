drop table playcoin;

create table playcoin(
    user_id varchar2(30) not null unique,
    user_name varchar2(30) not null,
    user_email varchar2(150) not null unique,
    user_nickname varchar2(60),
    user_register_date date not null
);