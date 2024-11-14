{% macro flatten_json_map(json_column, table_name) %}
(
    SELECT 
        key,
        value
    FROM (
        SELECT explode(from_json({{ json_column }}, 'MAP<STRING, STRING>')) AS (key, value)
        FROM {{ table_name }}
    )
)
{% endmacro %}
