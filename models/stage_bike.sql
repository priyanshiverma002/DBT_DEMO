with bike as(
    select 
    RIDE_ID,
    replace(STARTED_AT,'"','')as STARTED_AT,
    replace(ENDED_AT,'"','')as ENDED_AT,
    START_STATION_NAME,
    START_STATIO_ID,
    END_STATION_NAME,
    END_STATION_ID,
    START_LAT ,
    START_LNG ,
    END_LAT ,
    END_LNG ,
    MEMBER_CSUAL 
    from {{ source('DEMO', 'BIKE') }}
    where RIDE_ID != 'bikeid' and STARTED_AT != '"starttime"' and STARTED_AT != 'starttime'

)
select 
*
from bike