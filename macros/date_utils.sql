{% macro season_func(date_str) %}

CASE 
    WHEN MONTH(to_timestamp({{date_str}})) in (12,1,2) THEN 'WINTER'
    WHEN MONTH(to_timestamp({{date_str}})) in (3,4,5) THEN 'SPRING'
    WHEN MONTH(to_timestamp({{date_str}})) in (6,7,8) THEN 'SUMMER'
    ELSE 'AUTUMN'
END 

{% endmacro %}

{% macro day_type(date_str) %}

case 
    when DAYNAME(to_timestamp({{date_str}})) in ('sat','sun') 
    then 'WEEKEND'
else 'BUSINESSDAY' END

{% endmacro %}