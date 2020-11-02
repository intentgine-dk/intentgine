update ig_dev.email_topology as t1
set topology = CASE
				when concat(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'FN'
				when concat(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'LN'
				when concat(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'FNLN'
				when concat(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'LNFN'
				when concat(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), '.', lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'FN.LN'
				when concat(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '.', lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'LN.FN'
				when concat(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), '_', lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'FN_LN'
				when concat(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '_', lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'LN_FN'
				when concat(substring(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), 1, 1), lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'F1LN'
				when concat(substring(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), 1, 1), '.', lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'F1.LN'
				when concat(substring(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), 1, 1), '_', lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), '@', email_domain) = lower(t2.email_address)
				THEN 'F1_LN'
				when concat(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), '.', substring(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), 1, 1), '@', email_domain) = lower(t2.email_address)
				THEN 'FN.L1'
				when concat(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), substring(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), 1, 1), '@', email_domain) = lower(t2.email_address)
				THEN 'FNL1'
				when concat(substring(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), 1, 1), '.', substring(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), 1, 1), '@', email_domain) = lower(t2.email_address)
				THEN 'F1.L1'
				when concat(substring(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), 1, 1), substring(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), 1, 1), '@', email_domain) = lower(t2.email_address)
				THEN 'F1L1'
				when concat(lower(trim(replace(replace(last_name, '-', ''), ' ', ''))), substring(lower(trim(replace(replace(first_name, '-', ''), ' ', ''))), 1, 1), '@', email_domain) = lower(t2.email_address)
				THEN 'LNF1'
				ELSE NULL
			END
from ig_staging.contact as t2
where
	t1.email_domain = split_part(t2.email_address, '@', 2)
	and t1.topology IS NULL
