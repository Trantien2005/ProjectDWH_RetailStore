CREATE TABLE FactEventPerformance (
    event_key INT NOT NULL,     -- Khóa ngo?i t? DimEvent
    store_key INT,     -- Khóa ngo?i t? DimStore
    date_key INT NOT NULL,      -- Khóa ngo?i t? DimDate (ngày b?t ð?u ho?c ngày chính)
    additional_visits INT,      -- (Th?c t? - Trung b?nh)
    additional_revenue DECIMAL(18, 2), -- (Th?c t? - Trung b?nh)
    new_customer_count INT,     -- S? lý?ng khách hàng m?i
    total_transactions INT,     -- T?ng giao d?ch trong s? ki?n
    
    -- Thi?t l?p khóa chính (Composite Key)
    CONSTRAINT PK_FactEventPerformance PRIMARY KEY (event_key, store_key, date_key)
);

CREATE TABLE FactWeatherImpact (
    date_key INT NOT NULL,      -- Khóa ngo?i t? DimDate
    store_key INT,     -- Khóa ngo?i t? DimStore
    weather_key INT NOT NULL,   -- Khóa ngo?i t? DimWeather
    total_visits INT,
    total_transactions INT,
    total_revenue DECIMAL(18, 2),
    avg_visit_duration_minutes FLOAT, -- Ð? ki?u FLOAT cho chính xác s? l?
    
    -- Thi?t l?p khóa chính (Composite Key)
    CONSTRAINT PK_FactWeatherImpact PRIMARY KEY (date_key, store_key, weather_key)
);


TRUNCATE TABLE FactWeatherImpact;

TRUNCATE TABLE FactEventPerformance;

USE RetailStoreDWH;
GO

CREATE TABLE FactSales (
    sales_key INT IDENTITY(1,1) PRIMARY KEY,
    sales_id INT,
    date_key INT,
    customer_key INT,
    store_key INT,
    product_key INT,
    employee_key INT,
    payment_method_key INT,
    quantity_sold INT,
    discount_amount DECIMAL(10,2),
    revenue DECIMAL(12,2),             -- quantity * price

    FOREIGN KEY (date_key) REFERENCES DimDate(date_key),
    FOREIGN KEY (customer_key) REFERENCES DimCustomer(customer_key),
    FOREIGN KEY (store_key) REFERENCES DimStore(store_key),
    FOREIGN KEY (product_key) REFERENCES DimProduct(product_key),
    FOREIGN KEY (employee_key) REFERENCES DimEmployee(employee_key),
    FOREIGN KEY (payment_method_key) REFERENCES DimPaymentMethod(payment_method_key)
);

CREATE TABLE FactCustomerVisit (
    visit_key INT IDENTITY(1,1) PRIMARY KEY,
    visit_id INT,
    date_key INT,
    customer_key INT,
    store_key INT,
    entry_time_key INT,
    exit_time_key INT,
    visit_duration_minutes INT,

    FOREIGN KEY (date_key) REFERENCES DimDate(date_key),
    FOREIGN KEY (customer_key) REFERENCES DimCustomer(customer_key),
    FOREIGN KEY (store_key) REFERENCES DimStore(store_key),
);

