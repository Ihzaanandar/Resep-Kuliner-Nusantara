-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Des 2024 pada 02.40
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kuliner_nusantara`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'ihza', 'ihza');

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

CREATE TABLE `resep` (
  `id` int(11) NOT NULL,
  `nama_makanan` varchar(50) DEFAULT NULL,
  `bahan` text DEFAULT NULL,
  `langkah` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `resep`
--

INSERT INTO `resep` (`id`, `nama_makanan`, `bahan`, `langkah`) VALUES
(1, 'Tahu Petis', '1 Buah tahu putih\r\n4 Sendok makan tepung terigu\r\n1 sendok makan tepung beras\r\n1 sendok teh garam\r\n1/2 sendok teh merica bubuk\r\nAir secukupnya\r\nMinyak goreng secukupnya\r\n2 sendok makan petis udang\r\n1/2 sendok teh gula pasir\r\n1 sendok makan air asam jawa\r\n2 siung bawang putih, iris tipis\r\n1 sendok makan minyak goreng\r\nDaun bawang secukupnya, iris halus', '1. Potong tahu menjadi kotak kecil.\r\n2. Campurkan tepung terigu, tepung beras, 3. garam, dan merica. Tambahkan air hingga adonan kental.\r\n4. Celupkan tahu ke adonan tepung, goreng hingga kecokelatan.\r\n5. Tumis bawang putih, tambahkan petis, gula, dan air asam jawa. Masak hingga mengental.\r\n6. Sajikan tahu goreng dengan saus petis dan daun bawang.'),
(2, 'Tempe Mendoan', '10 buah tempe mendoan mentah\r\n100 gr tepung terigu\r\n50 gr tepung beras\r\n25 gr tepung sagu\r\n2 batang daun kucai, iris halus\r\n200 ml air\r\nMinyak untuk menggoreng\r\n1 sdm ketumbar\r\n1 cm kencur\r\n1 sdt garam\r\n2 siung bawang putih', '1. Potong tempe menjadi beberapa bagian kecil.\r\n2. Campur tepung terigu, tepung beras, tepung sagu, ketumbar, dan garam. 3. Tambahkan air hingga menjadi adonan kental.\r\n4. Celupkan tempe ke dalam adonan hingga terbalut rata.\r\n5. Goreng tempe hingga kuning kecokelatan. 6. Angkat dan tiriskan.\r\n7. Sajikan dengan taburan daun kucai.'),
(3, 'Wingko Babat', '250 gram tepung ketan\r\n200 gram kelapa parut, kukus sebentar\r\n100 gram gula pasir\r\n1 sendok teh garam\r\n150 ml air santan\r\nMinyak kelapa untuk olesan\r\nCetakan wingko', '1. Campur tepung ketan, gula pasir, dan garam. Tambahkan kelapa parut dan aduk rata.\r\n2. Tambahkan santan sedikit demi sedikit hingga adonan kental.\r\n3. Panaskan cetakan, olesi dengan minyak. 4. Tuangkan adonan ke cetakan.\r\n5. Panggang hingga matang dan kecokelatan di kedua sisi.'),
(4, 'Sate Madura', '500 gram daging sapi atau kambing, potong dadu\r\n1/2 kg bumbu kacang\r\n1/4 kg kecap manis\r\n1/4 kg kecap asin\r\n1 sendok makan gula merah\r\n1 sendok teh garam\r\n1 sendok teh merica bubuk\r\n1 batang serai, memarkan\r\n5 lembar daun jeruk purut\r\nTusuk sate secukupnya', '1. Tusuk daging pada tusuk sate.\r\n2. Campur bumbu kacang, kecap, gula, garam, merica, serai, dan daun jeruk.\r\n3. Lumuri sate dengan bumbu. Diamkan 30 menit.\r\n4. Bakar sate hingga matang. Sajikan dengan bumbu kacang.'),
(5, 'Tahu Tek', 'Bahan Tahu Tek :\r\n6 buah tahu putih\r\n6 butir telur ayam\r\n1/4 sdt garam (per telur)\r\n1/4 sdt kaldu bubuk (per telur)\r\n3 batang daun bawang, potong-potong\r\nMinyak untuk menggoreng\r\n\r\nBahan Bumbu Kacang : \r\n125 gram kacang tanah goreng\r\n2 sdm petis udang\r\n5 buah cabai rawit\r\n2 bawang merah, goreng\r\n3 bawang putih, goreng\r\n1 sdm gula jawa\r\n1/4 sdt garam\r\n2 sdm kecap manis\r\n100 ml air', '1. Goreng tahu dan dadar telur bersama daun bawang.\r\n2. Uleg kacang tanah dengan cabai, bawang merah, bawang putih, petis, gula, dan kecap. Tambahkan air secukupnya.\r\n3. Sajikan tahu, telur, dan lontong dengan bumbu kacang.'),
(6, 'Bakso Malang', 'Bahan Bakso :\r\n500 gram daging sapi giling\r\n100 gram tepung tapioka\r\n3 siung bawang putih, haluskan\r\n1 butir putih telur\r\n1 sendok teh garam\r\n1/2 sendok teh merica bubuk\r\n1/4 sendok teh pala bubuk\r\n\r\nBahan Kuah :\r\n2 liter air kaldu tulang sapi\r\n5 siung bawang putih, haluskan\r\n1 sendok teh garam\r\n1/2 sendok teh merica bubuk\r\n2 batang daun bawang, iris halus\r\n\r\nPelengkap :\r\nTahu goreng\r\nPangsit goreng\r\nMi kuning rebus\r\nBihun rebus\r\nDaun bawang dan seledri\r\nSambal, kecap, dan saus sesuai selera', 'Membuat Bakso :\r\n1. Giling Daging: Giling daging sapi bersama es batu hingga halus menggunakan blender atau food processor.\r\n2. Campurkan Bahan: Dalam mangkuk besar, campurkan daging giling dengan bawang putih halus, bawang putih goreng, putih telur, tepung sagu, baking powder, baking soda, garam, dan gula. Aduk rata.\r\n3. Bentuk Bakso: Ambil sejumput adonan dan bulatkan dengan tangan atau gunakan sendok es krim untuk membentuk bola-bola bakso.\r\n4. Rebus Bakso: Didihkan air dalam panci. Masukkan bakso ke dalam air mendidih dan rebus hingga bakso mengapung dan matang (sekitar 10–15 menit). Angkat dan tiriskan.\r\n\r\nMembuat Kuah :\r\n1. Rebus Tulang Sapi: Didihkan air dalam panci, masukkan tulang sapi dan bawang bombai. Rebus selama sekitar 20 menit.\r\n2. Tambahkan Bumbu: Tambahkan bawang putih halus, pala bubuk, garam, gula, dan lada ke dalam kuah. Masak hingga mendidih dan bumbu meresap.\r\n\r\nPenyajian :\r\n1. Siapkan Mangkok: Di dalam mangkok saji, letakkan mie kuning, soun, tahu goreng, dan tempe goreng.\r\n2. Tambahkan Bakso: Letakkan beberapa bakso di atas bahan pelengkap.\r\n3. Tuangkan Kuah: Siram dengan kuah panas.\r\n4. Taburi Pelengkap: Taburi dengan daun bawang, seledri, dan bawang goreng.\r\n5. Sajikan: Sajikan dengan sambal dan kecap manis sesuai selera.'),
(7, 'Ubi Cilmebu', '1 kg Ubi Cilembu', '1. Potong ujung-ujung ubi Cilembu.\r\n2. Siapkan tutup panci bekas (bagian pegangan tengahnya dilepas) dan letakkan di atas kompor.\r\n3. Tempatkan wajan stainless steel di atas tutup panci dan panaskan selama 5 menit dengan api besar.\r\n4. Tata ubi di atas wajan, lalu tutup.\r\n5. Panggang selama 40–45 menit tanpa membuka tutupnya.\r\n6. Setelah 40 menit, balik ubi dan bungkus tutup dengan kain serbet bersih.\r\n7. Lanjutkan memanggang selama 60 menit lagi atau hingga ubi empuk.'),
(8, 'Batagor', '2 buah tahu putih, potong menjadi 8 bagian\r\n8 lembar kulit pangsit\r\n200 g ikan tenggiri fillet, haluskan\r\n3 batang daun bawang, cincang halus\r\n1 sdt garam\r\n1/2 sdt merica\r\n1 sdt gula pasir\r\n2 butir putih telur\r\n150 ml air dingin\r\n100 g tepung sagu\r\n20 g tepung terigu\r\n\r\nBahan Bumbu Kacang :\r\n100 g kacang tanah, goreng\r\n3 siung bawang putih, goreng\r\n2 buah cabai merah (sesuai selera)\r\n1 sdm gula merah, serut halus\r\n1 sdm cuka\r\nGaram secukupnya', 'Membuat Adonan Batagor :\r\n1. Campurkan Bahan: Dalam mangkuk besar, campurkan ikan tenggiri yang sudah dihaluskan dengan daun bawang, garam, gula pasir, dan merica. Aduk hingga rata.\r\n2. Tambahkan Telur: Masukkan putih telur dan aduk kembali.\r\n3. Masukkan Tepung: Tambahkan tepung sagu dan tepung terigu sedikit demi sedikit sambil terus diaduk. Tuangkan air dingin sedikit demi sedikit hingga adonan bisa dipadatkan.\r\n\r\nSiapkan Tahu dan Kulit Pangsit :\r\n1. Siapkan Tahu: Kukus tahu selama sekitar 10 menit untuk menghangatkannya. Setelah itu, belah bagian tengah tahu agar bisa diisi adonan.\r\n2. Kulit Pangsit: Ambil selembar kulit pangsit, letakkan satu sendok adonan di tengahnya, lalu lipat dan rapatkan.\r\n\r\nMenggoreng Batagor :\r\n1. Panaskan Minyak: Panaskan minyak dalam wajan dengan api sedang.\r\n2. Goreng Tahu dan Kulit Pangsit: Masukkan tahu yang telah diisi adonan dan kulit pangsit ke dalam minyak panas. Goreng hingga berwarna kecokelatan dan renyah.\r\n3. Tiriskan: Angkat batagor yang sudah matang dan tiriskan di atas kertas minyak.\r\n\r\nMembuat Bumbu Kacang :\r\n1. Haluskan Bahan: Dalam blender, haluskan kacang tanah goreng, bawang putih goreng, cabai merah, gula merah, cuka, dan garam hingga halus.\r\n2.Campur dengan Air: Jika perlu, tambahkan sedikit air untuk mendapatkan konsistensi yang diinginkan.\r\n\r\nPenyajian :\r\n1. Sajikan Batagor: Letakkan batagor yang telah digoreng di atas piring saji.\r\n2. Tuangkan Bumbu Kacang: Siram bumbu kacang di atas batagor.\r\n3. Pelengkap: Anda bisa menambahkan irisan mentimun dan sambal sebagai pelengkap'),
(9, 'Seblak', '1 bawang putih\r\n1 bawang merah\r\n1 kemiri\r\n2 cm kencur\r\n3 cabai rawit (sesuai selera)\r\nKerupuk oren mentah secukupnya\r\n1/4 bonggol kol, iris\r\nDaun bawang secukupnya, iris\r\n1 butir telur\r\nGaram dan penyedap secukupnya\r\nAir secukupnya', '1. Haluskan bawang putih, bawang merah, kemiri, kencur, dan cabai rawit hingga halus.\r\n2. Panaskan sedikit minyak dalam wajan.\r\n3. Tumis bumbu yang telah dihaluskan hingga harum.\r\n4. Masukkan 1 butir telur, lalu orak-arik hingga setengah matang.\r\n5. Tuangkan air secukupnya (sekitar 1 gelas) ke dalam wajan dan biarkan mendidih.\r\n6. Masukkan kerupuk oren mentah secukupnya ke dalam wajan. Masak hingga kerupuk menjadi kenyal.\r\n7. Tambahkan irisan kol (1/4 bonggol) dan daun bawang secukupnya. Aduk rata.\r\n8. Bumbui dengan garam dan penyedap rasa sesuai selera. Koreksi rasa dan masak hingga semua bahan matang.\r\n9. Angkat seblak dari wajan dan sajikan selagi hangat.');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `resep`
--
ALTER TABLE `resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
