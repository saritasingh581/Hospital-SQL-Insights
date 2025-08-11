CREATE TABLE Patient(
      Hospital_Name VARCHAR(30) NOT NULL,
	  Location VARCHAR(50) NOT NULL,
	  Department VARCHAR(50) NOT NULL,
	  Doctors_count INT,
	  Patients_count INT,
	  Admission_Date DATE,
	  Discharge_Date DATE,
	  Medical_Expenses NUMERIC(10,2)
);

-- 1) Total Number of Patients
--> Write an SQL query to find the total number of patients across all hospitals

	SELECT SUM(patients_count) As Total_Patients
	FROM Patient

--2) Average Number of Doctors per Hospital
--> Retrieve the average count of doctors available in each hospital.

  SELECT Hospital_Name,
       ROUND(AVG(Doctors_count), 2) AS Avg_Doctors_Per_Department
       FROM Patient
       GROUP BY Hospital_Name ;

--3) Top 3 Departments with the Highest Number of Patients
--> Find the top 3 hospital departments that have the highest number of patients.

   SELECT 
        department,
		SUM(patients_count) AS Total_Patients  -- Sum patients count per department
        FROM Patient
        GROUP BY department
        ORDER BY Total_Patients DESC
        LIMIT 3;

--4) Hospital with the Maximum Medical Expenses
--> Identify the hospital that recorded the highest medical expenses   

  SELECT 
      hospital_name, 
	  SUM(medical_expenses) AS MAX_Medical_Expenses  -- Sum medical expenses per hospital
      FROM Patient
      GROUP BY hospital_name
      ORDER BY MAX_Medical_Expenses DESC
      LIMIT 1;

--5) Daily Average Medical Expenses
--> Calculate the average medical expenses per day for each hospital.

-- Calculate total medical expenses and total days stayed per hospital

  WITH hospital_stats AS(

  SELECT 
      hospital_name,
      SUM(medical_expenses) AS Total_expenses,
      SUM(discharge_date - admission_date) AS Total_Days  -- Total number of hospital stay days per hospital
      FROM Patient
      GROUP BY hospital_name
)
-- Calculate average medical expenses per day for each hospital
SELECT
   hospital_name,
   ROUND(Total_Expenses / NULLIF(Total_Days, 0), 2) AS Avg_Expenses_per_Day
   FROM hospital_stats;

--6) Longest Hospital Stay
--> Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.   

    SELECT admission_date, discharge_date,
	(discharge_date - admission_date) AS Longest_Hospital_Stay  -- Calculate length of stay in days
	FROM Patient
	ORDER BY Longest_Hospital_Stay DESC
	LIMIT 1;

--7) Total Patients Treated Per City
--> Count the total number of patients treated in each city. 

    SELECT Location AS city,
	SUM(patients_count) AS Total_Patients   -- Sum the number of patients in each city
	FROM Patient
	GROUP BY Location
	ORDER BY Total_Patients DESC;

--8) Average Length of Stay Per Department
--> Calculate the average number of days patients spend in each department

	SELECT
	       department,
	       ROUND(AVG(discharge_date - admission_date), 2)AS Avg_stay_Length  -- Calculate average stay duration in days, rounded to 2 decimals
	       FROM Patient
		   WHERE discharge_date IS NOT NULL AND admission_date IS NOT NULL
	       GROUP BY department
	       ORDER BY Avg_Stay_Length DESC;

--9) Identify the Department with the Lowest Number of Patients
--> Find the department with the least number of patients.

	SELECT 
	      department, 
	      SUM(patients_count) AS Total_patients  --Calculate total number of patients per department
	      FROM Patient
	      GROUP BY department
	      ORDER BY Total_Patients 
	      LIMIT 1;

--10) Monthly Medical Expenses Report
--> Group the data by month and calculate the total medical expenses for each month.	

-- Expenses by admission Month
    SELECT 
    TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses,
    'Admission' AS Type
FROM Patient
WHERE Admission_Date IS NOT NULL
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')

UNION ALL

-- Expenses by Discharge Month
SELECT 
    TO_CHAR(Discharge_Date, 'YYYY-MM') AS Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses,
    'Discharge' AS Type
FROM Patient
WHERE Discharge_Date IS NOT NULL
GROUP BY TO_CHAR(Discharge_Date, 'YYYY-MM')
ORDER BY Month, Type;
