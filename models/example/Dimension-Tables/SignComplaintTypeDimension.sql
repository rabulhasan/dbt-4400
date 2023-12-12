Select * , 
    row_number () over ()
    As sign_complaintType_ID
    from
(
select
    Distinct
    complaint_type,
    descriptor as complaint_descriptor
from {{ref("311_Compliant_staging")}}
 )






