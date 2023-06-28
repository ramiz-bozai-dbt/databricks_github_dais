{{
    config(
        severity='error'
    )
}}

with passing_stats as ( select * from {{ ref('stg_nfl__passing_stats') }} )

select *
from passing_stats 
where yards < 0