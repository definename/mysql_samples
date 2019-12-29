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

# TRPS MASTER:

Вивести інформацію про постачальників, які здійснювали постачання деталей для вказаного виробу:
```
select manufacturer.name, manufacturer.description, manufacturer.rating
from product_component, component, manufacturer
where product_id in (select id from product where name = "super_computer2")
and component.id = component_id
and manufacturer.id = manufacturer_id;
```

Збільшити рейтинг постачальника, що виконав більше число постачань, на вказану величину:
```
update manufacturer as UP_RATING,
	(select manufacturer.id as MAN_ID, count(manufacturer.id) as MAN_COUNT
		from product_component, component, manufacturer
		where product_component.component_id = component.id
		and component.manufacturer_id = manufacturer.id
		group by manufacturer.id
		having MAN_COUNT =
        (select MAX(A.MAN_COUNT) from
				(select manufacturer.id, count(manufacturer.id) as MAN_COUNT
					from product_component, component, manufacturer
					where product_component.component_id = component.id
					and component.manufacturer_id = manufacturer.id
					group by manufacturer.id
                    ) as A )
	) as B set UP_RATING.rating = 100 where UP_RATING.id = B.MAN_ID;
```
