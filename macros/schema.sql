{% macro generate_schema_name(custom_schema_name, node) -%}
    {# default_schema is the schema name from the profile connection #}
    {%- set default_schema = target.schema -%}

    {# log(v ~ " = " ~ env_var('DBT_CLOUD_ENVIRONMENT_TYPE', 'NOT SET'), info=true) #}
    {# log(v ~ " = " ~ env_var('DBT_CLOUD_INVOCATION_CONTEXT', 'NOT SET'), info=true) #}
    
    {# custom_schema_name is the schema config in dbt_project.yml or individual model config #}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}