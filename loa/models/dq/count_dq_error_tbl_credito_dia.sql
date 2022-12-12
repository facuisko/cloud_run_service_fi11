{{ config(  materialized='ephemeral',schema='dq', alias='count_tbl_credito_dia_dq',
            unique_key =['tabla','dq_error_columnname','descripcion','fecha','regla'],
            merge_update_columns =['tabla','dq_error_columnname','descripcion','fecha','regla']) }}


SELECT 'tbl_credito_dia' as tabla,
        dq_error_columnname,
        dq_error_descripcion as descripcion,
        data_date as fecha,
        dq_error_code as regla,  
        count(*) as cantidad_errores, 
        'where credit_plazo_contable NOT IN ("3" , "4")' as sql_query
FROM     {{ ref('dq_error_tbl_credito_dia') }}
group by tabla,dq_error_columnname,dq_error_descripcion,data_date,dq_error_code
