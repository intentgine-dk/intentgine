CASE
    when company_employees::numeric between 1 and 50
    then '02c84f8b-e340-4621-9a8e-47795be4dd9a'
    when company_employees::numeric between 51 and 200
    then 'ecc3d206-0682-40f9-b827-5eb780efdc0b'
    when company_employees::numeric between 201 and 500
    then '5f560a88-9a2a-4c53-a2eb-24d505bd22e5'
    when company_employees::numeric between 501 and 1000
    then '52d02cd6-f358-4103-992e-563e3d9cab49'
    when company_employees::numeric between 1001 and 2000
    then '1ce179a0-b4ce-4aa0-aa15-3d9dacad04b4'
    when company_employees::numeric between 2001 and 5000
    then '293998a6-ea29-4bed-ba38-cba6fb7b739c'
    when company_employees::numeric between 5001 and 10000
    then '47955320-a21e-4ea9-9905-84f519477fd0'
    when company_employees::numeric > 10000
    then '432b4eeb-a106-48b0-8b29-ad07153db437'
    else NULL
END