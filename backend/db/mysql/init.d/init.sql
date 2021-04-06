-- create user
-- for localhost
create user 'myuser'@'localhost' identified by 'mypass';

-- for remote host(ex. TablePlus)
grant all privileges on *.* to 'myuser'@'%';

-- create database
create database if not exists mydb;
use mydb;

-- table
create table if not exists users (
    id int(11) auto_increment not null,
    name varchar(64) not null,
    description varchar(255) not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp,
    primary key (id)
);

create table if not exists articles (
    id int(11) auto_increment not null,
    user_id int(11) not null,  -- 外部キー
    title varchar(255) not null,
    index user_id_idx(user_id),
    foreign key fk_users(user_id) references users(id),
    primary key (id)
);

-- insert to users
insert into users (name, description) values ('aa', 'おはよう');
insert into users (name, description) values ('ab', 'こんにちは');
insert into users (name, description) values ('ba', 'こんにちは');
insert into users (name, description) values ('bb', 'こんにちは');
insert into users (name, description) values ('aaa', 'こんばんは');
insert into users (name, description) values ('aab', 'Java');
insert into users (name, description) values ('aba', 'メロンパン');
insert into users (name, description) values ('baa', 'あああああああああああああああああ');
insert into users (name, description) values ('abb', 'いいいいいい');
insert into users (name, description) values ('bab', 'っっっっっっっっっっっっっっっっっっっっっっk');
insert into users (name, description) values ('bba', 'でもでも');
insert into users (name, description) values ('bbb', 'P!=NP');

-- insert to articles
insert into articles (user_id, title) values (1, '命題 A');
insert into articles (user_id, title) values (3, '命題 B');
insert into articles (user_id, title) values (5, '命題 C');
insert into articles (user_id, title) values (3, '命題 D');
