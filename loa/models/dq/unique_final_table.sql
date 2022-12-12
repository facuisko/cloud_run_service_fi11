{{ config(  materialized='incremental',schema='dq', alias='unique_final_table_dq',
            unique_key =['tabla','dq_error_columnname','descripcion','fecha','regla'],
            merge_update_columns =['tabla','dq_error_columnname','descripcion','fecha','regla']) }} --,
            -- unique_key =['tabla','dq_error_columnname','descripcion','fecha','regla'],
            -- merge_update_columns =['tabla','dq_error_columnname','descripcion','fecha','regla']) }}

SELECT * FROM {{ ref('count_dq_error_tbl_credito_dia') }}
UNION ALL 
SELECT * FROM {{ ref('count_dq_error_tbl_credito_dia_1') }} 
