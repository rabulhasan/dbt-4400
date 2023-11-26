CREATE TABLE `dbt_rhasan.FactTable` (
    fact_id INT AUTO_INCREMENT PRIMARY KEY, -- A unique identifier for each fact record
    date_ID INT,
    location_ID INT,
    sign_complaintType_ID INT,
    status_ID INT,
    time_ID INT,
    
    -- Add any other measures or degenerate dimensions as needed
    FOREIGN KEY (date_ID) REFERENCES `dbt_rhasan.DateDimension`(date_ID),
    FOREIGN KEY (location_ID) REFERENCES `dbt_rhasan.LocationDimension`(location_ID),
    FOREIGN KEY (sign_complaintType_ID) REFERENCES `dbt_rhasan.SignComplaintTypeDimension`(sign_complaintType_ID),
    FOREIGN KEY (status_ID) REFERENCES `dbt_rhasan.StatusDimension`(status_ID),
    FOREIGN KEY (time_ID) REFERENCES `dbt_rhasan.TimeDimension`(time_ID)
)
