# mysql_samles

Connect to mysql:

`mysql -u db_user -p123456`

Create table:

```
create table manufacturer(id serial, name varchar(255) not null, primary key(id)) engine innodb character set utf8;
```

Create table with foreign key:
```
create table component(id serial, name varchar(255) not null, manufacturer_id bigint unsigned not null, primary key(id), foreign key(manufacturer_id) references manufacturer(id) on delete restrict on update cascade) engine innodb character set utf8;
```

trps master:

```
select manufacturer.name from product_component, component, manufacturer where product_id in (select id from product where name = "super_computer2") and component.id = component_id and manufacturer.id = manufacturer_id;
```
