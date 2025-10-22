
# 🏫 Campus Planner App

## 📌 Deskripsi Singkat
**Campus Planner App** adalah aplikasi mobile berbasis **Flutter** yang dirancang untuk membantu mahasiswa dalam mengatur jadwal kuliah, tugas, kegiatan organisasi, serta catatan akademik mereka dalam satu tempat yang terintegrasi.

Aplikasi ini dibuat sebagai proyek UTS untuk mata kuliah **Pemrograman Mobile**, dengan tujuan agar pengguna (mahasiswa) dapat mengelola aktivitas kampus secara efisien dan terstruktur, tanpa harus berpindah-pindah platform.

---

## 🎯 Tujuan Aplikasi
- Membantu mahasiswa dalam memantau **jadwal harian dan mingguan**.
- Memberikan **pengingat tugas dan deadline** secara terorganisasi.
- Menyediakan tampilan antarmuka yang **modern, sederhana, dan mudah digunakan**.
- Menjadi dasar pengembangan aplikasi akademik yang lebih kompleks di masa depan.

---

## 🧩 Daftar Halaman dan Fungsinya

| Halaman | Nama File | Fungsi Utama |
|----------|------------|--------------|
| **Home Page** | `home_page.dart` | Menampilkan sapaan pengguna, daftar kelas hari ini, dan tugas-tugas yang harus diselesaikan. |
| **Add Task Page** | `add_task_page.dart` | Menambahkan tugas baru ke dalam daftar. |
| **Schedule Page** | `schedule_page.dart` | Menampilkan daftar jadwal kuliah, kegiatan organisasi, dan event kampus berdasarkan tanggal. |
| **Schedule Detail Page** | `schedule_detail_page.dart` | Menampilkan detail kegiatan seperti waktu, tempat, deskripsi, dan penyelenggara. |
| **Assignments Page** | `assignments_page.dart` | Menampilkan seluruh daftar tugas beserta progres penyelesaian dalam bentuk bar. |
| **Assignment Detail Page** | `assignment_detail_page.dart` | Menampilkan detail tugas dan memungkinkan pengguna menandainya sebagai selesai. |
| **Notes Page** | `notes_page.dart` | Menyimpan catatan atau ringkasan kuliah yang penting. |

---

## 💾 Pengolahan Data Dummy
Semua data yang ditampilkan dalam aplikasi bersumber dari **file JSON lokal** yang berisi data dummy.
Data tersebut mencakup informasi pengguna, daftar kelas, tugas, jadwal kegiatan, dan catatan.

### Contoh struktur data dummy:
```json
{
  "user": {
    "name": "Zahra",
    "avatar": ""
  },
  "tasks": [
    {
      "id": 1,
      "title": "Read Lecture Notes",
      "time": "09:30 AM",
      "status": false
    },
    {
      "id": 2,
      "title": "Complete Assignment 2",
      "time": "12:30 PM",

      "status": false
    },
    {
      "id": 3,
      "title": "Review Placeholder Text",
      "time": "02:30 PM",
 
      "status": true
    }
  ],
}
```

---
# 📱 Cara Menggunakan Aplikasi

## 1. Masuk ke Aplikasi

Untuk menjalankan aplikasi, buka terminal di direktori proyek, lalu ketik perintah berikut:

```bash
flutter run
```

Aplikasi akan dijalankan di emulator atau perangkat yang terhubung.

## 2. Beranda (Home Page)

- Lihat **daftar kelas** dan **tugas hari ini**.  
- Klik ikon **🔔 (lonceng)** untuk membuka halaman **Notifications**.  
- Tekan tombol **Add Task** untuk menambah tugas baru.  

Tampilan beranda membantu pengguna memantau aktivitas harian secara cepat.


## 3. Melihat Jadwal (Schedule Page)

- Semua kegiatan ditampilkan berdasarkan **tanggal** dan **kategori** (misalnya: class, meeting, event, dll).  
- Klik salah satu kegiatan untuk melihat **detailnya**.  

Fitur ini memudahkan pengelolaan waktu agar tidak melewatkan agenda penting.

## 4. Menandai Tugas Selesai (Assignments Page)

- Buka tab **Assignments** untuk melihat semua daftar tugas.  
- Klik pada salah satu tugas untuk membuka **detail tugas**.  
- Tekan tombol **“Mark as Completed”** untuk menandai tugas telah selesai.  

Dengan fitur ini, progres tugas dapat dilacak dengan mudah.


## 5. Menambahkan Catatan (Notes Page)

- Gunakan halaman **Notes** untuk menyimpan ringkasan materi atau pengingat kuliah.  
- Setiap catatan disusun berdasarkan **tanggal pembuatan**.  

Catatan dapat digunakan sebagai referensi belajar dan dokumentasi pribadi.


✨ **Selamat menggunakan aplikasi dan kelola aktivitas harianmu dengan lebih efisien!**

---

## 🎨 Desain Antarmuka (UI/UX)
- Tema warna utama: **Indigo dan Putih**, memberikan kesan profesional dan bersih.
- Font utama: **Poppins**.
- Inspirasi desain diambil dari **Dribbble UI Concept (Educational Planner App)**.
- Tata letak menggunakan **Column, Row, Container, dan ListView** untuk mendukung tampilan responsif.

---

## 👩‍💻 Informasi Pengembang

| Nama | NIM | Kelas | Program Studi | Universitas |
|------|-----|-------|----------------|-------------|
| **Zahra Tunihaya Romo** | 230605110141 | A | Teknik Informatika | UIN Maulana Malik Ibrahim Malang |

---

## 🌟 Fitur yang Akan Dikembangkan

- Integrasi database lokal menggunakan **SQLite**.
- Fitur **Push Notification** untuk pengingat jadwal dan deadline.
- **Sinkronisasi Cloud (Firebase)** agar data dapat diakses di berbagai perangkat.
- **Dark Mode dan Custom Theme** untuk meningkatkan pengalaman pengguna.
- **Kalender Interaktif** agar pengguna dapat menambah atau menghapus jadwal secara langsung.
- Fitur **Statistik Produktivitas** untuk menganalisis tingkat penyelesaian tugas dan aktivitas mingguan.
- **Sistem Login Mahasiswa** agar data lebih personal dan aman.
- **Widget Dashboard** di layar utama ponsel untuk menampilkan jadwal dan tugas secara cepat.

---

## 📚 Lisensi
Proyek ini dibuat untuk keperluan akademik sebagai tugas **Ujian Tengah Semester (UTS)** mata kuliah *Pemrograman Mobile*.
Segala bentuk distribusi ulang atau komersialisasi tanpa izin pengembang tidak diperbolehkan.
