USE MarketingAnalytics;
GO

select top 100 * from [dbo].[customers]
-- Customers data with geographic location
select c.CustomerID,c.CustomerName,c.Age,g.Country,g.City
from dbo.customers as c
left join
dbo.geography g
on c.GeographyID=g.GeographyID

-- count customer data with geographical location
select
isnull(g.Country,'country Total')as country,
isnull(g.City,'City Total') as city,
COUNT(c.CustomerID) as total_customers
from dbo.customers as c
join
dbo.geography g
on c.GeographyID=g.GeographyID
group by rollup( g.Country,g.City)
order by g.Country,g.City

select top 100 * from dbo.products

-- categorized the product price as low<(50) ,medium(50-100),high
select *,
case
   when price<50 then 'low'
   when price between 50 and 200 then 'medium'
   else 'high'
end as price_catogory
from dbo.products

-- customer reviews
select top 100 * from dbo.customer_reviews

-- remove white space from ReviewText, "  "-->" "
select ReviewId,CustomerID,productID,ReviewDate,Rating,
replace(ReviewText,'  ',' ')as ReviewText
from dbo.customer_reviews

select top 100 * from dbo.engagement_data

-- Clean and normalize engagement data
select EngagementId,ContentID,ProductID,
upper(Replace(ContentType,'Socialmedia','Social Media'))as contentType,
left(ViewsClicksCombined,charindex('-',ViewsClicksCombined))as Views,
right(ViewsClicksCombined,len(ViewsClicksCombined)-charindex('-',ViewsClicksCombined)) as clicks,
format(convert(Date,EngagementDate),'dd-MM-yyyy')as EngagementDate ,
Likes
from dbo.engagement_data
where ContentType !='Newsletter';

select top 100* from dbo.customer_journey;

-- CTE to identify and Tag duplicate records
;WITH DuplicateRecords AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
            ORDER BY JourneyID
        ) AS Row_Num
    FROM dbo.customer_journey
)

SELECT *
FROM DuplicateRecords
WHERE Row_Num > 1;

-- qurter qyery to select andstanderdze the clean data inner query to process and clean data
select 
    JourneyID,
    CustomerID,
    ProductID,
    VisitDate,
    Stage,
    Action,
    coalesce(Duration, avg_duration) as Duration
from
(
    select 
        JourneyID,
        CustomerID,
        ProductID,
        VisitDate,
        Upper(Stage) as Stage,
        Action,
        Duration,

        -- Average duration for each date
        round(AVG(Duration) Over(partition by VisitDate),2) as avg_duration,

        ROW_NUMBER() over(
            Partition by CustomerID, ProductID, VisitDate, upper(Stage), Action 
            order by JourneyID
        ) as Row_Num

    from dbo.customer_journey
) as subquery
where Row_Num = 1;
