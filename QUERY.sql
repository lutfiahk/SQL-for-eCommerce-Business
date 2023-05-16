CREATE TABLE customers_dataset(
	customer_id character(50),
	customer_unique_id character(50),
	customer_zip_code_prefix character(50),
	customer_city character(50),
	customer_state character(50),
	primary key (customer_id)
);

CREATE TABLE geolocation_dataset(
	geolocation_zip_code_prefix integer,
	geolocation_lat numeric,
	geolocation_lng numeric,
	geolocation_city character(50),
	geolocation_state character(10)
	);

CREATE TABLE order_items_dataset(
	order_id character(50),
	order_item_id character(10),
	product_id character(50),
	seller_id character(50),
	shipping_limit_date date,
	price numeric,
	freight_value numeric);

CREATE TABLE order_payments_dataset(
	order_id character(50),
	payment_sequential integer,
	payment_type character(30),
	payment_installments integer,
	payment_value numeric
);

CREATE TABLE order_reviews_dataset(
	review_id character(50),
	order_id character(50),
	review_score integer,
	review_comment_title text,
	review_comment_message text,
	review_creation_date date,
	review_answer_timestamp date);

CREATE TABLE orders_dataset(
	order_id character(50),
	customer_id character(50),
	order_status character(30),
	order_purchase_timestamp date,
	order_approved_at date,
	order_delivered_carrier_date date,
	order_delivered_customer_date date,
	order_estimated_delivery_date date,
	primary key (order_id)
	);

CREATE TABLE product_dataset(
	product_id character(50),
	product_category_name character(50),
	product_name_length numeric,
	product_description_length numeric,
	product_photos_qty numeric,
	product_weight_g numeric,
	product_lenth_cm numeric,
	product_height_cm numeric,
	product_widht_cm numeric,
	primary key (product_id));

CREATE TABLE seller_dataset(
	seller_id character(50),
	seller_zip_code_prefix character(50),
	seller_city character(50),
	seller_state character(10),
	primary key(seller_id));

ALTER TABLE order_items_dataset ADD FOREIGN KEY (product_id) REFERENCES product_dataset (product_id) 
	,ADD FOREIGN KEY (seller_id) REFERENCES seller_dataset (seller_id)
	,ADD FOREIGN KEY (order_id) REFERENCES orders_dataset (order_id);
	
ALTER TABLE orders_dataset ADD FOREIGN KEY (customer_id) REFERENCES customers_dataset (customer_id);

ALTER TABLE order_reviews_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset (order_id);

ALTER TABLE order_payments_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset (order_id);