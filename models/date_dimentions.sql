with cte as (
SELECT
STARTED_AT
    from 
    {{ source('DEMO', 'BIKE') }}
    WHERE STARTED_AT != 'started_at'
)

select
*
from
CTE