with cte as (
SELECT
to_timestamp(STARTED_AT)as STARTED_AT,
date(to_timestamp(STARTED_AT))as date_started_at,
hour(to_timestamp(STARTED_AT))as hour_started_at,

{{day_type('STARTED_AT')}} AS DAY_TYPE,

MONTH(to_timestamp(STARTED_AT))AS MONTH,

{{season_func('STARTED_AT')}} as season_of_year

    from 
    {{ ref("stage_bike") }}
    WHERE STARTED_AT != 'started_at'
)

select
*
from
CTE