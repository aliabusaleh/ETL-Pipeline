# ELT Pipeline with Snowflake, DBT, and Airflow

![alt text](./etl_pipeline.jpeg)

This project demonstrates the process of building an **ELT pipeline** from scratch using **DBT**, **Snowflake**, and **Airflow**. The pipeline extracts data from Snowflake's TPCH dataset, performs transformations using DBT, and orchestrates the workflow using Airflow. The primary focus is on **data modeling**, **fact table creation**, and **business logic transformations**.



## Overview

### ELT vs. ETL
Traditional ETL (Extract, Transform, Load) transforms data before loading it into a data warehouse. ELT, in contrast, loads raw data first, then applies transformations. Modern tools and cloud storage (like Snowflake) make ELT more efficient by leveraging cheaper storage.

### Tools Used:
- **DBT**: Data transformation
- **Snowflake**: Data warehouse
- **Airflow**: Workflow orchestration

## Project Steps

### 1. Environment Setup
- Set up a **Snowflake account**.
- Create a **warehouse**, **database**, and **role** in Snowflake using the following SQL commands:
    ```sql
    CREATE WAREHOUSE IF NOT EXISTS DBT_WAREHOUSE;
    CREATE DATABASE IF NOT EXISTS DBT_DATABASE;
    CREATE ROLE IF NOT EXISTS DBT_ROLE;
    ```
- Grant privileges to the user and roles.

### 2. DBT Setup
- Install DBT Core:
    ```bash
    pip install dbt-core
    ```
- Initialize the DBT project:
    ```bash
    dbt init data_pipeline
    ```
- Configure the Snowflake profile within DBT.

### 3. Data Modeling
- **Staging Tables**: Pull data from Snowflake TPCH dataset and create views for `orders` and `lineitems` tables.
- **Fact Tables**: Create fact tables using business logic and transformations:
    - Example: Creating a surrogate key for dimensional modeling.
    - Aggregating data into a fact table.

### 4. Macros
- Defined reusable macros in DBT for business logic, such as calculating the discounted amount from extended prices.

### 5. Testing
- Added **DBT tests** (both generic and singular) to ensure data integrity:
    - Unique, non-null checks on primary keys.
    - Valid range checks on dates and values.

### 6. Orchestration with Airflow
- Installed **Airflow** and **Astronomer Cosmos** to orchestrate the DBT transformations.
- Set up Airflow DAGs to trigger DBT runs:
    - Scheduled DAGs to run daily.
    - Configured the Snowflake connection within Airflow.

## Project Structure

data_pipeline/ ├── models/ │ ├── staging/ │ └── marts/ ├── macros/ ├── tests/ ├── dags/ │ └── dbt_pipeline_dag.py └── Dockerfile


- `models/`: Contains all the DBT models, including staging and fact tables.
- `macros/`: Contains reusable business logic for transformations.
- `tests/`: Includes DBT tests for data validation.
- `dags/`: Contains the Airflow DAG for orchestrating the DBT runs.

## How to Run

1. **DBT Models**:
    ```bash
    dbt run
    ```
2. **Airflow DAG**:
    - Start Airflow:
        ```bash
        airflow webserver
        airflow scheduler
        ```
    - Trigger the `dbt_pipeline_dag` from the Airflow UI.

## Future Improvements
- Add more comprehensive data tests.
- Integrate additional sources or incremental data loading.
- Deploy to cloud services (AWS, GCP) for scalability.

## Conclusion

This project demonstrates how to create an ELT pipeline using modern tools like DBT, Snowflake, and Airflow. It covers the complete workflow from environment setup to orchestration with Airflow. The result is a scalable and reusable ELT pipeline, ready for deployment in a production environment.

## Referances
This project was build with a hand-on tutorial, with adaptation for Widnows and another changes needed, original [video](https://www.youtube.com/watch?v=OLXkGB7krGo&t=729s) 
## License
This project is open-source and available under the [MIT License](https://opensource.org/license/MIT).

