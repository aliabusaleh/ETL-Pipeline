SELECT
    orders.*,
    order_items_summary.gross_item_Sales_amount,
    order_items_summary.item_discount_amount
FROM
    {{ref('stg_tpch_orders')}} as orders
JOIN
    {{ref('int_order_item_summary')}} as order_items_summary
ON
    orders.order_key = order_items_summary.order_key
ORDER BY 
    orders.order_data