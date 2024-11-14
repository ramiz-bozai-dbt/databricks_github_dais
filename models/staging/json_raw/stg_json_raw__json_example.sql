with 

source as (

    select * from {{ source('json_raw', 'json_example') }}

),

renamed as (

    select
        json_data

    from source

)

select * from renamed
