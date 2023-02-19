-- stg_stripe__payments.sql

with

source as (

    select * from {{ source('helios','car') }}

),

renamed as (

    select
        -- ids
        "id" as "car_id",

        -- strings
        "make",

        -- timestamps
        created::timestamp_ltz as created_at

    from source

)

select * from renamed