SELECT
    order_key,
    sum(extended_price) as gross_item_Sales_amount,
    sum(item_discount_amount) as item_discount_amount
FROM
    {{ref('int_order_items')}}
GROUP BY
    order_key