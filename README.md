
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
| **Notifications Page** | `notifications_page.dart` | Menampilkan notifikasi kegiatan dan tugas mendatang. |

---

## 💾 Pengolahan Data Dummy
Semua data yang ditampilkan dalam aplikasi bersumber dari **file JSON lokal** yang berisi data dummy.
Data tersebut mencakup informasi pengguna, daftar kelas, tugas, jadwal kegiatan, dan catatan.

### Contoh struktur data dummy:
```json
{
  "user": { "name": "Zahra", "avatar": "" },
  "classes_today": [
    { "title": "Mobile Programming", "time": "13:20 PM - 14:20 PM" },
    { "title": "Database Systems", "time": "15:00 PM - 16:00 PM" }
  ],
  "assignments": [
    {
      "title": "Database Systems - ERD Diagram",
      "subject": "Database Systems",
      "deadline": "2025-10-12",
      "progress": 0.6,
      "description": "Create an Entity Relationship Diagram for the campus library system."
    }
  ]
}
```

---

## ⚙️ Panduan Menjalankan Aplikasi

1. Pastikan Flutter telah terinstal pada komputer:
   ```bash
   flutter --version
   ```
2. Clone repositori GitHub kamu:
   ```bash
   git clone https://github.com/username/campus-planner-app.git
   ```
3. Masuk ke direktori proyek:
   ```bash
   cd campus-planner-app
   ```
4. Jalankan aplikasi di emulator atau perangkat fisik:
   ```bash
   flutter run
   ```

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
