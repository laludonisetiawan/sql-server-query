use BikeStores;

/*
Having digunakan untuk menyaring hasil dari fungsi agregasi setelah melakukan pengelompokan data menggunakan GROUP BY.
*/

SELECT * FROM production.products

-- HAVING DATA rata-rata harga produk per kategory yang lebih besar dari 370.
-- Klausa HAVING berguna untuk memfilter hasil setelah agregasi, dan dalam konteks table production.products, kita bisa menggunakannya untuk menyaring hasil berdasarkan fungsi agregasi seperti SUM, AVG, COUNT
SELECT category_id, AVG(list_price) AS avg_price
FROM production.products
GROUP BY category_id
HAVING AVG(list_price) > 370

-- menyaring jumlah produk per merek yang memiliki lebih dari 10 produk
SELECT
	brand_id,
	COUNT(product_id) AS total_products
FROM
	production.products
GROUP BY
	brand_id
HAVING
	COUNT(product_id) > 10;