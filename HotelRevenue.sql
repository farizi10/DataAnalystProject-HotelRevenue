--=============================================================--
--           DATA ANALYST : HOTEL REVENUE ANALYTICS            --
--=============================================================--

--IMPORT DAN MEMBACA DATA

select * from PortfolioProject..revenue_2018

select * from PortfolioProject..revenue_2019

select * from PortfolioProject..revenue_2020

--MENGGABUNGKAN DATA DARI TAHUN 2018 SAMPAI 2020 KEDALAM TABEL BARU

with hotels as (
select * from PortfolioProject..revenue_2018
union
select * from PortfolioProject..revenue_2019
union
select * from PortfolioProject..revenue_2020)

--panggil tabel "hotels"
select * from hotels


--MENGHITUNG REVENUE PERTAHUN

with hotels as (
select * from PortfolioProject..revenue_2018
union
select * from PortfolioProject..revenue_2019
union
select * from PortfolioProject..revenue_2020)

select arrival_date_year,
sum((stays_in_weekend_nights + stays_in_week_nights)*adr)as revenue 
from hotels
group by arrival_date_year


--MENGHITUNG REVENUE BERDASARKAN TYPE HOTEL

with hotels as (
select * from PortfolioProject..revenue_2018
union
select * from PortfolioProject..revenue_2019
union
select * from PortfolioProject..revenue_2020)

select arrival_date_year, hotel,
sum((stays_in_weekend_nights + stays_in_week_nights)*adr)as revenue 
from hotels
group by arrival_date_year, hotel






--MARKET SEGMENT  HOTEL
--discount pada dataset "market_segment" di aplikasikan kedalam market segment pada dataset "hotels"
with hotels as (
select * from PortfolioProject..revenue_2018
union
select * from PortfolioProject..revenue_2019
union
select * from PortfolioProject..revenue_2020)

select * from hotels
select * from hotels
left join PortfolioProject..market_segment
on hotels.market_segment = PortfolioProject..market_segment.market_segment




--MEAL COST HOTEL
--cost untuk meal pada dataset "meal_cost" di aplikasikan kedalam dataset "hotels"
with hotels as (
select * from PortfolioProject..revenue_2018
union
select * from PortfolioProject..revenue_2019
union
select * from PortfolioProject..revenue_2020)


select * from hotels
left join PortfolioProject..market_segment
on hotels.market_segment = PortfolioProject..market_segment.market_segment
left join PortfolioProject..meal_cost
on PortfolioProject..meal_cost.meal = hotels.meal
