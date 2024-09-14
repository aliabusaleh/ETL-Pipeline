SELECT 
    line_item.order_item_key,
    line_item.part_key,
    line_item.line_number,
    line_item.extended_price,
    orders.order_key,
    orders.customer_key,
    orders.order_data,
    {{discounted_amount('line_item.extended_price', 'line_item.discount')}} as item_discount_amount
FROM
    {{ref('stg_tpch_orders')}} as orders
JOIN
    {{ref('stg_tpch_line_items')}} as line_item
ON
    orders.order_key = line_item.order_key
ORDER BY
orders.order_data