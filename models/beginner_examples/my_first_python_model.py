import pyspark.sql.functions as F
import pyspark.pandas
import numpy as np

def model(dbt, session):
    dbt.config(
        submission_method='all_purpose_cluster',
        create_notebook=False,
        cluster_id='0426-154059-dox4kjfg',
        materialized = "table"
        )

    stg_nfl__passing_stats_df = dbt.ref("stg_nfl__passing_stats")

    transformed_df = stg_nfl__passing_stats_df.to_pandas_on_spark()

    transformed_df['completion_pct'] = transformed_df['attempts'] / transformed_df['completions']

    return transformed_df