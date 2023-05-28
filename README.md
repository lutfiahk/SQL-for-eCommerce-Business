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

  <p align="center">
    <img src="https://github.com/lutfiahusnakhoirunnisa/SQL-for-eCommerce-Business/assets/99700225/80f1d3cc-d5ca-4aaf-99cb-b33124ce7c65"/>
  </p>

  Angka average monthly active user terus meningkat dari tahun 2016 hingga 2018. Average monthly active user dari tahun 2016 menuju 2017 naik secara drastis, hal ini dikarenakan memang perusahaan baru mulai beroperasi pada tahun 2016 pada bulan September.

 <p align="center">
    <img src="https://github.com/lutfiahusnakhoirunnisa/SQL-for-eCommerce-Business/assets/99700225/a5fae049-dd77-41a5-9321-0bd7dfa12f14"/>
  </p>
  
  Jumlah customer baru tiap tahunnya meningkat sejalan dengan average monthly active user yang juga meningkat tiap tahunnya.
  
  Walaupun angka new customer dan average monthly active user tiap tahunnya terlihat baik, tapi perlu dilihat dari total customer yang melakukan repeat order tiap tahunnya masih sangat rendah dibandingkan dengan customer baru yang masuk.
  
   <p align="center">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/664ef65a-af89-4d07-ac3c-0ee643cca002"/>
  </p>
  
  <b>“Perusahaan perlu melakukan evaluasi lanjut untuk menyelesaikan masalah rendahnya customer yang melakukan repeat order”</b>
  
  <p align="center">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/9ae782f6-5c02-48b1-9071-a83f00ced64d"/>
  </p>

  Dari rasio customer baru dengan customer yang melakukan repeat order, terlihat perusahaan memiliki masalah serius dalam hal loyalitas customer

  <p align="center">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/dce1528b-6750-4795-9337-f4e2ab78d432"/>
  </p>

 Dari tabel di atas, diketahui bahwa tiap tahunnya rata-rata customer hanya melakukan satu kali transaksi. Perusahaan perlu untuk membuat strategi untuk menjaga atau menarik customer agar melakukan transaksi kembali, ada beberapa hal yang perlu dilakukan, antara lain :
 
 * Analisa customer experience, apakah ada perbedaan dari customer baru dengan customer yang melakukan repeat order
 * Walaupun angka customer baru penting, tetapi perlu juga untuk menjaga retensi pelanggan. Campaign atau promo dapat diberikan kepada customer untuk menarik minat kembali.

  <p align="center">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/b80ac959-653f-4b9c-a99e-4e6884be794e"/>
  </p>
  
Total Customer aktif tahun 2017 cenderung paling stabil dibanding tahun 2016 dan 2018
Pada tahun 2016 dan 2017, terlihat terjadi penurunan drastis total customer aktif pada akhir tahun, dan naik kembali pada awal tahun
Pada September 2018 terjadi penurunan customer aktif yang sangat ekstrim hingga hampir menuju 0, dan penurunan kembali berlanjut pada bulan berikutnya

<h2>Annual Product Category Quality Analysis</h2>

  <p align="center">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/a85db2ac-8d5d-4b07-92b8-16ef55dbadc8"/>
  </p>
  
Revenue pada 2016 masih sangat rendah, tetapi hal ini disebabkan penjualan tahun 2016 yang hanya terjadi pada 4 bulan terakhir. 

Terjadi kenaikan total revenue tiap tahunnya, dan revenue tahun 2018 merupakan yang tertinggi dibanding 2 tahun sebelumnya. Tetapi dari angka Monthly Active User yang diketahui mendekati 0 pada akhir tahun 2018 pada analisa sebelumnya, kita perlu melakukan analisa total revenue lanjutan apakah ada dampak dari turun drastisnya monthly active user ini

  <p align="center">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/2762b5bc-4679-4635-85bf-e14c7b188571"/>
  </p>

Secara umum, revenue terlihat semakin baik dari tahun ke tahun, walaupun pada tiap akhir tahun mengalami penurunan, tetapi kembali naik pada awal tahun. Sesuai dengan angka monthly active user yang turun drastis pada bulan September, Revenue berhenti masuk setelah bulan Agustus 2018. 

Tabel di bawah, menunjukkan aktivitas pesanan customer berdasarkan order statusnya setelah bulan Agustus. 

  <p align="left">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/33ee8176-6319-4d28-98a5-414371f052be"/>
  </p>
  
Hanya ada order dengan status canceled dan shipped, yang artinya tidak ada revenue masuk setelah bulan Agustus

![image](https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/a0c1eb82-911d-49e9-9e54-f42e7dc7bd68)

Banyak canceled order terus meningkat tiap tahunnya, dan puncaknya pada tahun 2018.

![image](https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/f0642c2e-7977-4bff-a81c-d66e66364581)

Tetapi jika dilihat dari cancelation ratenya, ternyata tahun 2017 lah yang paling tinggi

![image](https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/87b7c887-b042-4a38-b339-23c78c6ba25c)

Top produk pada tiap tahunnya berbeda, jika dilihat dari total revenue yang dihasilkan pada tiap kategori produk, dapat dilihat produk unggulan tiap tahunnya pada grafik di atas.

Produk yang paling sering dicancel ordernya pada tiap tahunnya juga berbeda, jika dilihat dari total canceled order pada tiap kategori produk, dapat dilihat produk dengan canceled order terbanyak tiap tahunnya pada grafik di atas.

<h2>Analysis of Annual Payment Type Usage</h2>

  <p align="left">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/238db407-49f6-42cf-b649-87358967cc15"/>
  </p>

Dari 2016 hingga 2018, customer paling banyak menggunakan credit card untuk melakukan pembayaran. Penggunaan voucher masih dibilang rendah, perusahaan dapat mencoba untuk meningkatkan penggunaan voucher untuk customer agar dapat menarik lebih banyak customer dan meningkatkan loyalitas customer.

  <p align="left">
    <img src="https://github.com/lutfiahk/SQL-for-eCommerce-Business/assets/99700225/eecdf0a8-ce41-483f-87d2-582c4aeb2fff"/>
  </p>
  
Tiap tahun ke tahun tipe pembayaran paling tinggi adalah credit card dan frekuensi penggunaannya naik tiap tahun.

Penggunaan voucher naik dari tahun 2016 ke 2017 secara signifikan, dan turun pada tahun 2018. Hal ini mengindikasikan ada sedikit masalah dengan voucher pada tahun 2018, seperti ketersediaan voucher yang kurang, marketing yang kurang menyampaikan kepada customer terlebih mayoritas customer merupakan customer baru.

<h2>Conclusion</h2>

Perlu dilakukan analisis lanjutan mengenai alasan mengapa penjualan menurun drastis pada akhir tahun 2018, ada beberapa hal yang perlu diperhatikan :

* Revenue berhenti pada Agustus 2018, perlu dianalisa lagi apakah ada peristiwa atau hal yang menyebabkan berhentinya penjualan
* Perusahaan perlu berfokus pada peningkatan loyalitas pelanggan, karena angka customer yang melakukan repeat order sangat kecil dan timpang dibandingkan dengan customer baru.
* Perusahaan perlu melakukan analisis customer experience untuk mengetahui mengapa banyak customer yang tidak melakukan repeat order, dan perlu juga untuk mengetahui mengapa banyak customer yang melakukan cancel order
* Penurunan penggunaan voucher di tahun 2018 perlu untuk dianalisa lebih lanjut penyebabnya, apakah karena kurangnya voucher yang tersedia atau kurangnya marketing pada customer mengenai adanya voucher, terlebih mayoritas customer di perusahaan merupakan customer baru.
