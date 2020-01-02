/* Збільшити рейтинг постачальника, що виконав більше число постачань, на вказану величину: */

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