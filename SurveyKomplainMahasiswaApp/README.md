# SurveyKomplainMahasiswaApp-PemrogramanMobile

## Latar Belakang
Proyek ini bertujuan untuk membuat aplikasi mobile yang dapat menampilkan hasil survey komplain mahasiswa tentang kampus.

## Manfaat Sistem
   * Memudahkan pihak perguruan tinggi dalam memonitor dan mengevaluasi layanan komplain maupun pengaduan
   * Tampilan dashboard mempercepat pihak perguruan tinggi dalam memahami informasi dan trennya
   * Mengakomodasi mahasiswa dalam menyampaikan pengaduan atau keluhannya ke pihak perguruan tinggi
   * Menjadi salah satu media komunikasi yang baik antara mahasiswa dengan pihak perguruan tinggi sehingga dapat menyelesaikan masalah dengan lebih efektif
   * Meningkatkan kepuasan dan loyalitas mahasiswa terhadap perguruan tinggi

## Diagram Alur (Flowchart)
<img src="flutter_survey_app/img/flowchart.png" alt="Flowchart" style="width: 500px; border: 0px solid #000;">

Flowchart di atas adalah representasi visual dari proses atau alur kerja aplikasi mobile untuk melihat hasil survey. Berikut adalah penjelasannya:

- Mulai dari titik "Start" di bagian atas.
- Langkah pertama yaitu "Melihat halaman utama". Halaman ini adalah halaman yang pertama tampil setelah pengguna berhasil membuka aplikasi. Di halaman ini pengguna bisa meelihat dashboard yang berisi beberapa informasi meliputi Total Surveys, Sum of Problem Factors, Sum of Respondents Based on Gender, Sum of Respondents Based on Country of Origin, Average of Age, dan Average of GPA. 
- Setelah itu terdapat simbol decision "lihat detail total survey?". Ini melibatkan keputusan pengguna apakah ingin melihat detail survei atau tidak.
- Jika "Ya", pengguna akan diteruskan ke langkah selanjutnya yaitu bisa melihat halaman detail hasil survey. Namun, jika pengguna memilih "Tidak" maka pengguna bisa melihat ke informasi lain misalnya Sum of Problem Factors. Di langkah ini akan ada simbol decision lagi "Pilih faktor?" untuk memilih kategori faktor yang ingin dilihat.
- Jika "Ya", pengguna akan bisa melihat jumlah masalah dari faktor yang sudah dipilih. Tetapi, jika "Tidak" pengguna bisa melihat ke informasi lain misalnya Sum of Respondents Based on Gender. Di langkah ini akan ada simbol decision lagi "Pilih gender?" untuk memilih kategori gender yang ingin dilihat datanya.
- Jika "Ya", pengguna akan bisa melihat jumlah responden dari kategori gender yang sudah dipilih. Namun, jika "Tidak" pengguna bisa melihat ke informasi lain misalnya Sum of Respondents Based on Country of Origin. Di langkah ini akan ada simbol decision lagi "Pilih negara?" untuk memilih kategori negara yang ingin dilihat datanya.
- Jika pengguna memilih "Ya", pengguna akan bisa ngelihat jumlah responden dari kategori negara yang sudah dipilih. Tetapi, jika "Tidak" alur akan berakhir di titik "End".

Flowchart tersebut dapat membantu pengguna untuk memahami alur dari aplikasi mobile dalam memonitor hasil survey komplain mahasiswa.

## Dokumentasi
#### 1. Login (Autentikasi)
<img src="flutter_survey_app/img/login1.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<img src="flutter_survey_app/img/login2.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Fitur ini digunakan oleh pengguna agar bisa mengakases aplikasi. Pengguna harus memasukkan username dan password yang terdaftar pada database sistem. Jika password yang dimasukkan tidak valid maka akan muncul notifikasi Invalid Password.</p>

#### 2. Splash Page
<img src="flutter_survey_app/img/splashpage.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Splash Page ini merupakan halaman pertama yang muncul ketika pengguna berhasil mengakses aplikasi surveykomplainapp. Halaman tersebut akan menampilkan logo instansi perguruan tinggi sebagai identitas dan pengenalan. Halaman ini berfungsi untuk meberikan kesan pertama yang menarik kepada pengguna, serta memberikan waktu bagi aplikasi untuk memuat data atau proses yang diperlukan sebelum masuk ke halaman utama. Splash Page ini ditampilkan beberapa detik sebelum berpindah ke halaman Opsi Menu.</p>

#### 3. Opsi Menu
<img src="flutter_survey_app/img/menu.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Pada halaman ini pengguna dapat memilih menu yang ingin diakses dalam menggunakan aplikasi. Terdapat tiga opsi menu yaitu Dashboard, List Report, dan Penganduan Kekerasan Seksual.</p>

#### 4. Dashboard
<img src="flutter_survey_app/img/dashboard1.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<img src="flutter_survey_app/img/dashboard2.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Halaman dashboard pada surveykomplainapp merupakan halaman yang menampilkan informasi penting terkait survey atau komplain yang telah diisi oleh mahasiswa. Halaman ini berfungsi untuk memberikan gambaran umum kepada pengguna mengenai hasil survey dan informasi lainnya mengenai data komplain.</p>

#### 5. Complain Form
<img src="flutter_survey_app/img/complainform.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Form komplain tersebut memungkinkan mahasiswa untuk menyampaikan keluhan atau saran terhadap layanan yang diberikan oleh oleh perguruan tinggi. Mahasiswa dapat memilihi jenis keluhan, laporan keluhannya, dan data diri seperti umur, IPK, tahun, gender, serta kewarganegaraan.</p>

#### 6. Detail Survey
<img src="flutter_survey_app/img/detailpage.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Halaman ini memudahkan pengguna untuk melihat secara detail semua data survey. Di halaman ini menampilkan genre dan reports yang diberikan mahasiswa.</p>

#### 7. List Reports
<img src="flutter_survey_app/img/listreports.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Menu ini menampilkan data pengaduan kekerasan seksual yang diperoleh dari inputan menu pengaduan kekerasan seksual. Pada menu ini akan jenis laporan, kronologi, dan gambar sebagai bukti.</p>

#### 8. Pengaduan Kekerasan Seksual
<p style="text-align: justify;">Menu pengaduan kekerasan seksual pada surveykomplainapp adalah sebuah fitur yang memungkinkan mahasiswa untuk melaporkan kasus-kasus kekerasan seksual yang dialami atau disaksikan di lingkungan kampus.</p>

<img src="flutter_survey_app/img/popup.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Pop up tersebut akan tampil jika pengguna tidak memiliki akses ke menu pengaduan kekerasan seksual karena statusnya tidak lulus.</p>

<img src="flutter_survey_app/img/formpengaduanks.png" alt="Detailpage" style="width: 300px; border: 0px solid #000;">

<p style="text-align: justify;">Jika pengguna memiliki akses terhadap menu ini maka bisa melaporkan aduannya ke pihak perguruan tinggi dengan mengisi form tersebut.  </p>

## Kontributor

| Foto | Nama Lengkap | GitHub | Peran |
|:----:|:------------:|:------:|:-----:|
| <img src="https://akademik.polinema.ac.id/upload_dir/foto_ktm_valid/2021/2131710140-EiSw6.jpeg" alt="Foto 1" width="100px" height="100%"> | Muhamad Helmi Permana Agung | [N00budrag0n](https://github.com/N00budrag0n) | Backend Flutter dan Frontend Flutter |
| <img src="https://akademik.polinema.ac.id/upload_dir/foto_ktm_valid/2021/2131710073-9pkTX.jpeg" alt="Foto 2" width="100px" height="100%"> | Ibnu Tsalis Assalam | [i9191](https://github.com/i9191) | Backend Laravel dan Backend Flutter |
| <img src="https://media.licdn.com/dms/image/D5603AQH0XquxsrmMTQ/profile-displayphoto-shrink_800_800/0/1674222566598?e=1704326400&v=beta&t=jqGSDulx2f-3VHXYQskX-mWwdaidGCcPBETEPLZ7jlE" alt="Foto 3" width="100px" height="100%"> | Khosyi Nasywa Imanda | [KhosyiNasywaImanda](https://github.com/KhosyiNasywaImanda) | Design UI dan Frontend Flutter |
| <img src="https://akademik.polinema.ac.id/upload_dir/foto_ktm_valid/2021/2131710030-e8pLR.jpeg" alt="Foto 4" width="100px" height="100%"> | Nafiatul Fadlilah | [NafiatulFadlilah](https://github.com/NafiatulFadlilah) | Design Alur Sistem dan Frontend Flutter |

