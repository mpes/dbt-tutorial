-- Use the `ref` function to select from other models
{% snapshot city_snapshot %}

{{
config(
	target_database='DBT_MOJE',
	target_schema='MOJE_SCD',
	unique_key='"id"',
	strategy='check',
	check_cols=['"name"','"country"'],
	invalidate_hard_deletes = True
)
}}

select "id","name","country"
from DBT_MOJE.MOJE_SCHEMA.CITY
--where "id" = 1

{% endsnapshot %}
