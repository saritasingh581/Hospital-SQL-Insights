📖 About the Project  

This project explores how structured SQL queries can extract meaningful insights from hospital data — using just one table: Patient. From identifying high-cost departments to understanding patient flow and hospital efficiency, each query provides answers to real-world operational questions in healthcare.  

🎯 What This Project Solves  
Through SQL, the project addresses key business questions such as:   

 - How many patients are being treated per hospital?  
 - Which departments are the busiest or underutilized?  
 - Which hospitals spend the most on patient care?  
 - How efficient are different departments?  
 - What are the monthly trends in medical expenses?   

🛠️ Tools & Technologies  

 - Language: SQL (PostgreSQL)  
 - Editor: Any SQL-compatible tool (e.g., pgAdmin, DBeaver, DataGrip)  
 - Dataset: Simulated Patient table with anonymized healthcare data  

📋 Patient Table Schema  
The dataset consists of the following fields:  

| Column Name      | Description                          |
| ---------------- | ------------------------------------ |
| `patient_id`     | Unique identifier for each patient   |
| `hospital_name`  | Name of the hospital                 |
| `city`           | Hospital's location                  |
| `department`     | Department where patient was treated |
| `doctor_count`   | Number of doctors available          |
| `admission_date` | Date of patient admission            |
| `discharge_date` | Date of discharge                    |
| `total_expense`  | Total medical expense per patient    |

📊 Insights Extracted  
This project includes SQL queries that reveal:    

 Total number of patients by hospital

Average number of doctors per hospital

Top 3 departments by patient volume

Hospital with the highest total medical expenditure

Average daily cost per hospital

Patients with the longest stays

Distribution of patients by city

Average stay duration by department (efficiency)

🗂️ Repository Contents
pgsql
Copy
Edit
📦 hospital-sql-insights/
├── README.md              -- Project overview and instructions
├── queries.sql            -- All SQL queries used in analysis
└── sample_data.csv        -- (Optional) Dummy data for testing
▶️ How to Run
Import the Patient table into your PostgreSQL database.

Open and run queries from queries.sql.

Review results to explore insights and trends.

🧠 Who This Is For
This project is useful for:

Data analysts working in healthcare

SQL learners exploring practical use cases

Hospital management teams seeking data-driven decisions


Least-utilized departments

Monthly expense trends
