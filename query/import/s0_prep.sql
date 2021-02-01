create table ig_dev.dv01wn_q1_2020 as (
SELECT
    CASE
        WHEN UPPER(TRIM(ntw.company_name)) = ''
        THEN NULL
        ELSE UPPER(TRIM(ntw.company_name))
    END as company_name
    ,CASE
        WHEN TRIM(ntw.company_linkedin_url) = ''
        THEN NULL
        ELSE TRIM(ntw.company_linkedin_url)
    END as company_linkedin_url
    ,CASE
        WHEN TRIM(ntw.company_domain) = ''
        THEN NULL
        ELSE lower(trim(replace(replace(replace(company_domain, 'https://', ''), 'http://', ''), 'www.', '')))
    END as email_domain
    ,CASE
        WHEN TRIM(ntw.company_address1_local) = ''
        THEN NULL
        ELSE TRIM(ntw.company_address1_local)
    END as company_address1_local
    ,CASE
        WHEN TRIM(ntw.company_zip_local) = ''
        THEN NULL
        ELSE TRIM(ntw.company_zip_local)
    END as company_zip_local
    ,CASE
        WHEN TRIM(ntw.company_phone_local) = ''
        THEN NULL
        ELSE TRIM(ntw.company_phone_local)
    END as company_phone_local
    ,ntw.company_city_local
    ,ntw.company_state_local
    ,ntw.company_country_local
    ,ntw.company_employees_bucket
    ,ntw.company_normalized_industry
    ,ntw.company_primary_industry
    ,ntw.company_revenue_bucket
	,ntw.company_primary_sic_code
	,ntw.company_primary_naics_code
FROM 
	ig_ingestion.alteryx_raw_netwise ntw
GROUP BY
    CASE
        WHEN UPPER(TRIM(ntw.company_name)) = ''
        THEN NULL
        ELSE UPPER(TRIM(ntw.company_name))
    END
    ,CASE
        WHEN TRIM(ntw.company_linkedin_url) = ''
        THEN NULL
        ELSE TRIM(ntw.company_linkedin_url)
    END
    ,CASE
        WHEN TRIM(ntw.company_domain) = ''
        THEN NULL
        ELSE lower(trim(replace(replace(replace(company_domain, 'https://', ''), 'http://', ''), 'www.', '')))
    END
    ,CASE
        WHEN TRIM(ntw.company_address1_local) = ''
        THEN NULL
        ELSE TRIM(ntw.company_address1_local)
    END
    ,CASE
        WHEN TRIM(ntw.company_zip_local) = ''
        THEN NULL
        ELSE TRIM(ntw.company_zip_local)
    END
    ,CASE
        WHEN TRIM(ntw.company_phone_local) = ''
        THEN NULL
        ELSE TRIM(ntw.company_phone_local)
    END
    ,ntw.company_city_local
    ,ntw.company_state_local
    ,ntw.company_country_local
    ,ntw.company_employees_bucket
    ,ntw.company_normalized_industry
    ,ntw.company_primary_industry
    ,ntw.company_revenue_bucket
	,ntw.company_primary_sic_code
	,ntw.company_primary_naics_code
)