import pyspark.sql.functions as F
import pyspark.pandas
import numpy as np

def model(dbt, session):
    dbt.config(
        submission_method='all_purpose_cluster',
        create_notebook=True,
        cluster_id='0426-154059-dox4kjfg',
        materialized = "table"
        )
  
    # DataFrame representing my previous data, using ref function, but Python syntax
    upstream_model = dbt.ref("stg_nfl__passing_stats")
    
    statistics = upstream_model.describe()

    return statistics