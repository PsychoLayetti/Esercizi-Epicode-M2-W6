#
select *
from dimproduct D 
join dimproductsubcategory SUB on D.ProductSubcategoryKey = SUB.ProductSubcategoryKey
join dimproductcategory CAT on SUB.ProductCategoryKey = CAT.ProductCategoryKey;

#
select *
from dimproduct D
join factresellersales F on D.ProductKey = F.ProductKey;

#
select *
from dimproduct D
left join factresellersales F on D.ProductKey = F.ProductKey
where SalesOrderNumber is null and FinishedGoodsFlag = 1;

#
select distinct ProductKey
from factresellersales;

#
select distinct ProductKey
from dimproduct;

#query annidata o subquery 
select distinct P.ProductKey, P.EnglishProductName, P.FinishedGoodsFlag
from dimproduct P
where P.FinishedGoodsFlag = 1 and P.ProductKey not in (select distinct ProductKey 
from factresellersales);

#Voglio vedere le transazioni di vendita indicando anche il nome del prodotto venduto
select P.ProductKey, P.EnglishProductName, P.FinishedGoodsFlag, V.SalesOrderNumber, V.OrderDate, V.OrderQuantity, V.UnitPrice, V.TotalProductCost, V.SalesAmount
from dimproduct P 
join factresellersales V on P.ProductKey = V.ProductKey
where P.FinishedGoodsFlag = 1 and V.OrderQuantity >= 1 and V.SalesAmount > 0;

#Voglio vedere l'elenco delle transazioni di vendita indicando la categoria di appartenenza di ciascun prodotto venduto.
select P.ProductKey, P.EnglishProductName, P.FinishedGoodsFlag, S.EnglishProductSubcategoryName,
C.EnglishProductCategoryName, V.SalesOrderNumber, V.OrderDate, V.OrderQuantity, V.UnitPrice, V.TotalProductCost, V.SalesAmount
from dimproduct P 
join dimproductsubcategory S on P.ProductSubcategoryKey = S.ProductSubcategoryKey
join dimproductcategory C on S.ProductCategoryKey = C.ProductCategoryKey
join factresellersales V on P.ProductKey = V.ProductKey;

#
