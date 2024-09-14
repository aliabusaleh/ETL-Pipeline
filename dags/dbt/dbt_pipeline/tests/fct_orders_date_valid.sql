SELECT
    *
FROM
    {{ref('fct_orders')}}
WHERE
    date(order_data) > CURRENT_DATE()
    OR
    date(order_data) < date('1990-01-01')