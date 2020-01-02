# mysql_samles

Connect to mysql:

`mysql -u db_user -p123456`

Create table:

```
create table manufacturer(
id serial, name varchar(255) not null,
primary key(id)) engine innodb character set utf8;
```

Create table with foreign key:
```
create table component(
id serial, name varchar(255) not null,
manufacturer_id bigint unsigned not null,
primary key(id),
foreign key(manufacturer_id) references manufacturer(id) on delete restrict on update cascade)
engine innodb character set utf8;
```

Dump database with all data:
```
mysqldump -h localhost -u db_user -p123456 tprs_master > trps_master_data.sql

```

Dump database with no data:
```
mysqldump -d -h localhost -u db_user -p123456 tprs_master > trps_master_no_data.sql
```

Load database:
```
mysql -h localhost -u db_user -p123456 tprs_master < trps_master_no_data.sql 
```
