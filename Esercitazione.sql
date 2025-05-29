#Seleziono la tabella su cui lavorare
select * from dimproduct;
#Seleziono alcune colonne e cambio nome ad una colonna
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag as FGF From dimproduct;
#Metto una condizione su una colonna
select ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag as FGF 
From dimproduct where FinishedGoodsFlag  = 1 ;
#Cambio nome ad una colonna e metto due condizioni
select ProductKey, ProductAlternateKey as Model, EnglishProductName, StandardCost, ListPrice From dimproduct 
where ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%' ;
#Eseguo un operazione
select ProductKey, ProductAlternateKey as Model, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost as markup From dimproduct 
where ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%';
#Metto un altra condizione
select ProductKey, ProductAlternateKey as Model, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost as markup From dimproduct 
where (ListPrice >1000 and ListPrice <2000) and (ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%') ;
#Seleziono una tabella
select * from dimemployee;
#Metto una condizione
select * from dimemployee where SalesPersonFlag = 1;
#Seleziono una tabella
select * from factresellersales;
#Metto una condizione
select * from factresellersales where OrderDate > '2020-01-01';
#Metto un altra condizione
select * from factresellersales where (OrderDate > '2020-01-01') and (ProductKey in (597,598,477,214));
#Seleziono alcune colonne, eseguo un operazione e metto due condizioni
select SalesOrderNumber, OrderDate, ProductKey, OrderQuantity, UnitPrice, TotalProductCost, SalesAmount, SalesAmount - TotalProductCost as Markup 
from factresellersales where (OrderDate > '2020-01-01') and (ProductKey in (597,598,477,214)); 