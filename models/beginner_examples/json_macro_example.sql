with

flattened_json AS (
    
    {{ flatten_json_map('json_data', ref('stg_json_raw__json_example')) }}

)

SELECT * FROM flattened_json
