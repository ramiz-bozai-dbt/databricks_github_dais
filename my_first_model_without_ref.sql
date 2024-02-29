select
    *,
    --Let's calculate the completion rate.
    completions / attempts as completion_pct,
    1 as test,
    2 as test_col,
    3 as yet_another_col,
    case
        when age between 20 and 23 then '20-23'
        when age between 24 and 28 then '24-28'
        when age between 29 and 40 then '29-40'
        when age >= 41 then '40+'
    end
        as age_bucket

from `ramiz_bozai_sandbox_dev`.`dbt_rbozai`.`stg_nfl__passing_stats`