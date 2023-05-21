<h1>Analyzing eCommerce Business Performance with SQL</h1>
<p align="center">
  <img src="https://github.com/lutfiahusnakhoirunnisa/SQL-for-eCommerce-Business/blob/main/OUTPUT/Screenshot%202023-05-21%20202025.png"/>
</p>
<h3><b>Description :</b></h3>

Dalam suatu perusahaan mengukur performa bisnis sangatlah penting untuk melacak, memantau, dan menilai keberhasilan atau kegagalan dari berbagai proses bisnis. Oleh karena itu, dalam paper ini akan menganalisa performa bisnis untuk sebuah perusahan eCommerce,  dengan memperhitungkan beberapa metrik bisnis yaitu pertumbuhan pelanggan, kualitas produk, dan tipe pembayaran.

Tools: 
* SQL Query : PostgreSQL
* Data Visualization : Ms. Excel & Canva

<h2>Data Preparation</h2>

Data Preparation dimulai dengan membuat table dan import table, kemudian dibuat suatu ERD (enntity relationship diagram) untuk menjelaskan bagaimana hubungan dari antar dataset. Berikut merupakan tampilan ERD dari dataset yang dipakai:

<p align="center">
  <img src="https://github.com/lutfiahusnakhoirunnisa/SQL-for-eCommerce-Business/blob/main/OUTPUT/erd.png" width="500" height="400"/>
</p>

<details>
  <summary>Klik di sini untuk melihat Deskripsi Dataset</summary>
  
  Dataset yang digunakan adalah :
  * Sellers : berisi informasi tentang penjual/seller
  * Customers : berisi informasi mengenai customer
  * Geolocation : berisi informasi mengenai geolokasi dari customer dan seller seperti titik latitude dan longitude, dihubungkan dengan key zip_code_prefix
  * Product : berisi informasi mengenai product yang dijual, seperti nama dan deskripsi product, berat, pangjang product, dsb
  * Order_items : berisi informasi mengenai item pembelian seperti order_id, id dari seller, id dari product, dan informasi lain seperti harga, dsb
  * Orders : berisi informasi mengenai detail pembelian seperti order_id yang digunakan untuk menghubungkan dengan dataset order_item, customer_id, status, tanggal purchase, dsb
  * Order_payments : berisi informasi mengenai pembayaran, seperti order_id, total pembayaran, cara pembayaran, dsb 
  * Order_reviews : berisi informasi mengenai review yang dilakukan oleh customer
  
</details>

<h2>Annual Customer Activity Growth Analysis</h2>

* <b>Bagaimana angka Average Monthly Active User tiap tahunnya?</b>

  <p align="center">
    <img src="https://github.com/lutfiahusnakhoirunnisa/SQL-for-eCommerce-Business/assets/99700225/80f1d3cc-d5ca-4aaf-99cb-b33124ce7c65"/>
  </p>

  Angka average monthly active user terus meningkat dari tahun 2016 hingga 2018. Average monthly active user dari tahun 2016 menuju 2017 naik secara drastis, hal ini dikarenakan memang perusahaan baru mulai beroperasi pada tahun 2016 pada bulan September.

* <b>Bagaimana angka new customer tiap tahunnya?</b>

 <p align="center">
    <img src="https://github.com/lutfiahusnakhoirunnisa/SQL-for-eCommerce-Business/assets/99700225/a5fae049-dd77-41a5-9321-0bd7dfa12f14"/>
  </p>
  
  Jumlah customer baru tiap tahunnya meningkat sejalan dengan average monthly active user yang juga meningkat tiap tahunnya.
