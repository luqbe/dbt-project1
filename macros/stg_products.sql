{% macro is_in_stock(column_name='stock_qty') %}
    case 
        when {{ column_name }} > 0 then true 
        else false 
    end
{% endmacro %}