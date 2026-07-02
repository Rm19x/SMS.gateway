# SMS gateway by Mr.Rm19

 **SMS gateway by Mr.Rm19** adalah solusi pengiriman SMS global nyata , dan siap produksi. Aplikasi ini dirancang untuk menangani pengiriman pesan secara masal dengan integrasi *multi-gateway* otomatis.

- **Author**: Mr.Rm19

---

## Fitur Utama
* **Multi-Gateway Routing**: Integrasi Twilio dan Vonage dengan sistem *failover* otomatis.
* **Asynchronous Processing**: Pengiriman SMS masal yang tidak membebani server menggunakan Sidekiq & Redis.
* **Data Validation**: Validasi nomor telepon E.164 untuk memastikan pengiriman sukses.
* **URL Optimization**: Generator pemendek URL otomatis untuk efisiensi karakter SMS.
* **Persistent Logging**: Pencatatan riwayat pengiriman ke database SQLite dengan fitur *auto-purge*.
* **Docker Ready**: Siap dideploy ke environment mana pun dengan kontainer.

## Kebutuhan Sistem
* Ruby 3.x
* Redis Server
* Docker & Docker Compose (Direkomendasikan)

## Cara Instalasi
```
cp .env.example .env
Edit file .env dengan kredensial Twilio & Vonage kamu
bundle install
rake db:migrate
docker-compose up
Aplikasi akan berjalan di http://localhost:4567
```
