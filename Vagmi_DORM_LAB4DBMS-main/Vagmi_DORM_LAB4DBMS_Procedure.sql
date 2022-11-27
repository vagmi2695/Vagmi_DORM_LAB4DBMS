CREATE PROCEDURE `ServiceRating` ()
BEGIN
-- 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
-- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
SELECT SOP.SUPP_ID, R.RAT_RATSTARS,
CASE 
 WHEN R.RAT_RATSTARS = 5 THEN 'Excellent Service'
 WHEN R.RAT_RATSTARS >= 4 THEN 'Good Service'
 WHEN R.RAT_RATSTARS > 2 THEN 'Average Service'
 else 'Poor Service'
END AS Type_of_Service
FROM (SELECT Supp_pro.SUPP_ID, O.ORD_ID FROM (SELECT supplier_pricing.PRICING_ID, supplier_pricing.SUPP_ID FROM supplier_pricing INNER JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID) AS Supp_Pro 
INNER JOIN `order` AS O ON O.PRICING_ID = Supp_Pro.PRICING_ID) As SOP
INNER JOIN rating AS R ON R.ORD_ID = SOP.ORD_ID;
END
