-- STG_HEL__CARS.sql
{{
    config(
        materialized='incremental',
        unique_key='"car_id"',
        on_schema_change='sync_all_columns'
    )
}}

with source as (
    select * from {{ source('Helios','CARS') }}
),

renamed as (
    select
        -- ids
        "id" as "car_id",
        
        -- strings
        "make",
        "model",
        "max_speed",
        -- timestamps
        "created_at"::timestamp_ltz as "created_at"
    from source
)
select * from renamed