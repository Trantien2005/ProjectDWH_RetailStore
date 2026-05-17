# Data Warehouse & ETL Retail Store

## Giới thiệu

Dự án xây dựng hệ thống **Data Warehouse (Kho dữ liệu)** và quy trình **ETL (Extract - Transform - Load)** cho chuỗi cửa hàng bán lẻ thực phẩm bổ sung nhằm phục vụ nhu cầu phân tích dữ liệu và hỗ trợ ra quyết định kinh doanh.

Hệ thống được triển khai bằng:
- SQL Server
- SQL Server Integration Services (SSIS)
- SSMS
- CSV Dataset

Mô hình kho dữ liệu sử dụng:
- **Galaxy Schema (Fact Constellation Schema)**

---

# Mục tiêu dự án

- Xây dựng hệ thống Data Warehouse hoàn chỉnh.
- Thiết kế quy trình ETL tự động.
- Chuẩn hóa và tích hợp dữ liệu từ nhiều nguồn.
- Phân tích doanh thu, khách hàng, thời tiết và sự kiện khuyến mãi.
- Hỗ trợ truy vấn OLAP và Business Intelligence.

---

# Kiến trúc hệ thống

Hệ thống được xây dựng theo mô hình:

```text
Source Layer
     ↓
Staging Layer
     ↓
Data Warehouse Layer
```

Các thành phần chính:
- Data Sources
- Staging Area
- Data Warehouse

---

# Bộ dữ liệu sử dụng

Dataset:
- Synthetic Supplements Retail Store Dataset

Nguồn:
- Kaggle Dataset

Các file dữ liệu:
- customer.csv
- store.csv
- product.csv
- employee.csv
- schedule.csv
- payment_method.csv
- sales.csv
- sales_detail.csv
- customer_visit.csv
- weather_store.csv
- event.csv

---

# Thiết kế Data Warehouse

## Dimension Tables
- DimCustomer
- DimEmployee
- DimSchedule
- DimDate
- DimStore
- DimEvent
- DimPaymentMethod
- DimProduct
- DimWeather
- DimTime

## Fact Tables
- FactSales
- FactCustomerVisit
- FactEventPerformance
- FactWeatherImpact

---

# Quy trình ETL

## 1️⃣ Extract
- Đọc dữ liệu từ các file CSV.
- Chuyển đổi kiểu dữ liệu.
- Validation dữ liệu.
- Mapping cột dữ liệu.

## 2️⃣ Transform
- Làm sạch dữ liệu.
- Chuẩn hóa dữ liệu.
- Áp dụng business rules.
- Xử lý Slowly Changing Dimension (SCD).

## 3️⃣ Load
- Nạp dữ liệu vào Staging.
- Nạp dữ liệu vào Data Warehouse.
- Hỗ trợ:
  - Full Load
  - Incremental Load

---

# Slowly Changing Dimension (SCD)

## SCD Type 1
Áp dụng cho:
- DimStore
- DimWeather
- DimPaymentMethod
- DimSchedule

Đặc điểm:
- Ghi đè dữ liệu cũ bằng dữ liệu mới.

## SCD Type 2
Áp dụng cho:
- DimCustomer
- DimEmployee
- DimProduct

Đặc điểm:
- Lưu lịch sử thay đổi dữ liệu.
- Sử dụng:
  - StartDate
  - EndDate
  - IsCurrent

---

# Các chức năng phân tích

## Phân tích doanh thu
- Top sản phẩm bán chạy
- Xu hướng doanh thu theo tháng
- Doanh thu theo cửa hàng
- Hiệu suất nhân viên

## Phân tích khách hàng
- Khung giờ khách ghé đông nhất
- Thời gian ghé trung bình
- Tần suất khách hàng

## Phân tích thời tiết
- Ảnh hưởng thời tiết đến doanh thu
- Tác động thời tiết đến lượt khách

## Phân tích sự kiện
- Doanh thu theo sự kiện
- Hiệu quả chương trình khuyến mãi
- Tăng trưởng lượt khách

---

# Công nghệ sử dụng

| Công nghệ | Mục đích |
|---|---|
| SQL Server | Lưu trữ Data Warehouse |
| SSMS | Quản lý cơ sở dữ liệu |
| SSIS | Xây dựng ETL |
| CSV Dataset | Dữ liệu nguồn |
| OLAP | Phân tích dữ liệu |

---

# 🚀 Hướng phát triển

- Tích hợp Power BI/Tableau Dashboard.
- Hỗ trợ realtime ETL.
- Tối ưu hiệu năng truy vấn.
- Triển khai trên Cloud Data Warehouse.

---

# Kết luận

Dự án giúp xây dựng nền tảng Data Warehouse hoàn chỉnh phục vụ:
- Phân tích dữ liệu doanh nghiệp bán lẻ
- Hỗ trợ Business Intelligence
- Tối ưu ra quyết định kinh doanh

---

# 📚 Tài liệu tham khảo

- Microsoft SQL Server Documentation
- SSIS Documentation
- Kaggle Dataset
- Data Warehouse Concepts by Bill Inmon