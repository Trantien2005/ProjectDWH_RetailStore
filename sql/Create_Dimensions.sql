CREATE DATABASE RetailStoreDWH;
GO

USE RetailStoreDWH;
GO

-- DimStore
CREATE TABLE DimStore (
    store_key INT IDENTITY(1,1) PRIMARY KEY,
    store_id TINYINT NOT NULL,
    street NVARCHAR(50),
    city NVARCHAR(50),
    province NVARCHAR(50),
    country NVARCHAR(30)
);

-- DimPaymentMethod
CREATE TABLE DimPaymentMethod (
    payment_method_key INT IDENTITY(1,1) PRIMARY KEY,
    payment_method_id TINYINT,
    payment_method_name NVARCHAR(50)
);

-- DimDate
CREATE TABLE DimDate (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day_of_week NVARCHAR(10),
    month INT,
    quarter INT,
    year INT,
    is_weekend BIT,
    season NVARCHAR(20)
);

-- DimWeather
CREATE TABLE DimWeather (
    weather_key       INT IDENTITY(1,1) PRIMARY KEY,
    weather_id        BIGINT NOT NULL,                    
    weather_condition NVARCHAR(50) NOT NULL,   
);

-- DimEmployee (SCD2)
CREATE TABLE DimEmployee (
    employee_key INT IDENTITY(1,1) PRIMARY KEY,
    employee_id SMALLINT,
    employee_name NVARCHAR(100),
    age TINYINT,
    gender NVARCHAR(50),
    schedule_id TINYINT,
    store_key INT,
    StartDate DATE,
    EndDate DATE,
    IsCurrent BIT DEFAULT 1,
    CONSTRAINT FK_DimEmployee_Store 
        FOREIGN KEY (store_key) REFERENCES DimStore(store_key)
);

-- DimCustomer (SCD2)
CREATE TABLE DimCustomer (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id SMALLINT,
    full_name NVARCHAR(100),
    customer_membership NVARCHAR(50),
    gender NVARCHAR(10),
    age TINYINT,
    location NVARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    IsCurrent BIT DEFAULT 1
);

-- DimTime
CREATE TABLE DimTime (
    time_key INT PRIMARY KEY,
    time_string NVARCHAR(5),
    hour_of_day INT,
    minute INT,
    is_peak_hour BIT
);

-- DimProduct (SCD2)
CREATE TABLE DimProduct (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id TINYINT,
    product_name NVARCHAR(100),
    main_ingredient NVARCHAR(100),
    price FLOAT,
    price_level INT,
    StartDate DATE,
    EndDate DATE,
    IsCurrent BIT DEFAULT 1
);

-- DimSchedule
CREATE TABLE DimSchedule (
    schedule_key INT IDENTITY(1,1) PRIMARY KEY,
    schedule_id TINYINT,
    work_days NVARCHAR(50),
    entry_time TIME,
    exit_time TIME,
    shift_time NVARCHAR(50)
);

-- DimEvent
TRUNCATE TABLE DimEvent
ALTER TABLE DimEvent
ADD event_key INT IDENTITY(1,1);
CREATE OR ALTER TABLE DimEvent (
    event_key INT IDENTITY(1,1) PRIMARY KEY,
    event_id SMALLINT,
    event_name NVARCHAR(100),
    finish_date DATE,
    store_key INT,
    start_date DATE,
    event_duration INT,
);