with daily_weather as(
    select 
    date(TIME)as daily_weather,
    WEATHER,
    TEMP,
    PRESSURE,
    HUMIDITY,
    CLOUDS
	
    from {{ source('DEMO', 'WEATHER') }}
    
),
daily_weather_agg as(
select 
    daily_weather,
    weather,
    round(avg(TEMP),2) as avg_temp,
    round(avg(PRESSURE),2) as avg_pressure,
    round(avg(HUMIDITY),2) as avg_humidity,
    round(avg(CLOUDS),2) as avg_cloud
from daily_weather
group by 1,2

qualify row_number()over(partition by daily_weather order by count(weather) desc) = 1

)
select
* 
from 
daily_weather_agg

