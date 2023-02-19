
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

with anonymized_data as (
    select id, md5(name), occupation
    from {{ ref('people') }}
)

select * from anonymized_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
