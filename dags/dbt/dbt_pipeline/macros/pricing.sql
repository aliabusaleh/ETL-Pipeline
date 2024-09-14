
{% macro discounted_amount(extended_price, discounted_percentage,  scale=2) %}
    (-1 * {{ extended_price }} * {{discounted_percentage}})::numeric(16, {{ scale }})
{% endmacro %}
