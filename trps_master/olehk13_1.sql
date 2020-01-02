/* Вивести інформацію про постачальників, які здійснювали постачання деталей для вказаного виробу */

select manufacturer.name, manufacturer.description, manufacturer.rating
from product_component, component, manufacturer
where product_id in (select id from product where name = "super_computer2")
and component.id = component_id
and manufacturer.id = manufacturer_id;