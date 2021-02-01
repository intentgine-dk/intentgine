INSERT INTO ig_staging.company (
SELECT
    uuid_generate_v4()
    ,company_name
    ,company_linkedin_url
    ,company_domain AS email_domain
    ,company_address AS street_address
    ,company_postal_code AS potal_code
    ,company_phone AS phone_number
    ,'0.0.0.0' AS ip_address
    ,'0.0.0.0' AS mx_ip_address
    ,location_id
    ,employee_size_id
    ,industry_id
    ,subindustry_id
    ,company_primary_sic_code
    ,company_primary_naics_code
    ,revenue_range_id
    ,'Reverify' AS company_data_status
    ,NOW() as last_update_data
    ,'IGDV01WN_Q4_2020' AS datasource
FROM
    ig_dev.dv01wn_q4_2020_refresh_main
)
ON CONFLICT ON CONSTRAINT company_name_key
DO NOTHING;
