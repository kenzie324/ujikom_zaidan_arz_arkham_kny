import 'package:flutter/material.dart';
import 'package:ujikom_zaidan_arz_arkham_kny/pages/berita_page.dart';
import 'package:ujikom_zaidan_arz_arkham_kny/pages/prestasi_page.dart';
import 'package:ujikom_zaidan_arz_arkham_kny/pages/visi_misi_page.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HERO =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
              decoration: BoxDecoration(
                color: Color(0xFF243A5E),
                image: DecorationImage(
      image: AssetImage('gambar paling atas.png'), // Nama file background kamu
      fit: BoxFit.cover, // Supaya gambar menutupi seluruh area Hero
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.5), // Angka 0.5 untuk tingkat kegelapan (0.0 - 1.0)
        BlendMode.darken,
      ),
    ),

              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// ================= NAVBAR =================
                      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    /// 
    /// LOGO
Image.asset(
  "assets/Briseis logo.png", // Ganti dengan path file logomu
  height: 40,        // Sesuaikan tinggi logo agar pas dengan navbar
  fit: BoxFit.contain,
),

    /// ================= DESKTOP MENU =================
    if (!isMobile)
      Row(
        children: [

          _navItem(
            "Beranda",
            true,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),

          _navItem(
            "Visi & Misi",
            false,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const VisiMisiPage()),
              );
            },
          ),

          _navItem(
            "Berita & Pengumuman",
            false,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const BeritaPage()),
              );
            },
          ),

          _navItem(
            "Prestasi",
            false,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const PrestasiPage()),
              );
            },
          ),
        ],
      ),

    /// ================= MOBILE MENU =================
    if (isMobile)
      PopupMenuButton<int>(
        icon: const Icon(Icons.menu, color: Colors.white),
        onSelected: (value) {
          if (value == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
          if (value == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const VisiMisiPage()),
            );
          }
          if (value == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const BeritaPage()),
            );
          }
          if (value == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const PrestasiPage()),
            );
          }
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 0, child: Text("Beranda")),
          PopupMenuItem(value: 1, child: Text("Visi & Misi")),
          PopupMenuItem(value: 2, child: Text("Berita & Pengumuman")),
          PopupMenuItem(value: 3, child: Text("Prestasi")),
        ],
      ),
  ],
),

                      const SizedBox(height: 50),
                      const Text(
                        'MEMPERLUAS WAWASAN\n& MEMBANGUN KARAKTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Briseis International School (BIS) menghadirkan\npendidikan yang seimbang dan menyeluruh.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 28),

                      // BUTTONS
                      isMobile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _buttons(),
                            )
                          : Row(
                              children: _buttons(),
                            ),
                    ],
                  );
                },
              ),
            ),

            // ================= FLOATING CARDS =================
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _schoolCard(
                      'Briseis International School Bekasi',
                      'Kota Bekasi, Jawa Barat',
                    ),
                    _schoolCard(
                      'Briseis International School Bandung',
                      'Kota Bandung, Jawa Barat',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

// ================= WHY BIS =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 900;

                  return IntrinsicHeight(
  child: Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SISI KIRI: TEKS INFORMASI
                      Expanded(
                        flex: isMobile ? 0 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mengapa BIS Merupakan Pilihan Terbaik?',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF243A5E),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Briseis International School (BIS) bukan sekadar tempat belajar, '
                              'tetapi ekosistem pertumbuhan karakter. Kami menggabungkan standar '
                              'akademik global dengan pengembangan etika dan kepemimpinan. '
                              'Dengan rasio guru dan siswa yang terjaga, setiap individu mendapatkan '
                              'perhatian personal untuk memaksimalkan potensi unik mereka dalam '
                              'lingkungan yang suportif dan modern.',
                              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8B1E2D),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Pelajari Lebih Lanjut', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      
                      if (!isMobile) const SizedBox(width: 60), // Spasi antar teks dan gambar
                      if (isMobile) const SizedBox(height: 40),

                      // SISI KANAN: GAMBAR
                      // SISI KANAN: GAMBAR
Expanded(
  flex: isMobile ? 0 : 1,
  child: IntrinsicHeight(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: double.infinity,
        child: Image.asset(
          'assets/ini gambar yang kenapa BIS.png',
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
),
                    ],
                  ),
                  );
                },
              ),
            ),

// ================= KURIKULUM =================
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 900;

                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SISI KIRI: GAMBAR (MUNCUL DI ATAS PADA MOBILE)
                      // SISI KIRI: GAMBAR
Expanded(
  flex: isMobile ? 0 : 1,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.asset( // <--- GANTI JADI Image.asset
      'assets/kalo ini yang Kurikulum.png', // <--- TAMBAHKAN assets/
      fit: BoxFit.cover,
    ),
  ),
),

                      if (!isMobile) const SizedBox(width: 60),
                      if (isMobile) const SizedBox(height: 40),

                      // SISI KANAN: TEKS INFORMASI KURIKULUM
                      Expanded(
                        flex: isMobile ? 0 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Kurikulum Internasional Cambridge',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF243A5E),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Kami menerapkan Kurikulum Cambridge Assessment International Education '
                              'secara komprehensif mulai dari Primary hingga A Level. Kurikulum ini '
                              'dirancang untuk membentuk siswa yang percaya diri, bertanggung jawab, '
                              'reflektif, inovatif, dan terlibat aktif.\n\n'
                              'Dengan sertifikasi yang diakui dunia, siswa BIS memiliki jalur karir '
                              'akademik yang luas menuju universitas-universitas terbaik di seluruh dunia.',
                              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

// ================= BERITA & ACARA (LOGIC BY PROGRAMMER 2) =================
            Container(
              width: double.infinity,
              color: const Color(0xFF1F2F4D),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Berita & Pengumuman Terkini',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Update terbaru mengenai aktivitas dan informasi sekolah.',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 32),
                  
                  // Wrap ini otomatis mengambil data dari list allNews
                  // Cari bagian Wrap Berita & Acara, lalu ubah jadi ini:
Wrap(
  spacing: 20,
  runSpacing: 20,
  children: allNews.map((item) { // Ubah '(data Berita)' jadi '(item)'
    return _newsCard(context, item); // Ubah 'Berita' jadi 'item'
  }).toList(),
),
                ],
              ),
            ),

            // ================= PRESTASI =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Prestasi Unggulan',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _achievementCard('Olimpiade Sains Nasional'),
                      _achievementCard('ASEAN Young Robot Competition'),
                    ],
                  ),
                ],
              ),
            ),

            // ================= FOOTER =================
            Container(
              width: double.infinity,
              color: const Color(0xFF1F2F4D),
              padding: const EdgeInsets.all(32),
              child: const Text(
                '© 2025 BIS. All Rights Reserved',
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

    /// ================= NAV ITEM =================
  Widget _navItem(String text, bool active, {VoidCallback? onTap})
{
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF8B1E2D) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),)
    );
  }

  // ================= COMPONENTS =================

  List<Widget> _buttons() => [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Lihat Video'),
        ),
        const SizedBox(width: 12, height: 12),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Selengkapnya'),
        ),
      ];

Widget _schoolCard(String title, String subtitle) {
  return Container(
    width: 520,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFEFF3F8),
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B1E2D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
          ),
          child: const Text('Selengkapnya'),
        ),
      ],
    ),
  );
}

//KENZIE!!! INI KUGANTI YOOO... untuk newcardnya biar data data yang kumasukin bisa nyambung :)

  // ================= TUGAS PROGRAMMER 2: LOGIC & DETAIL =================
  Widget _newsCard(BuildContext context, NewsModel news) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label Kategori (Berita/Pengumuman)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: news.category == 'Pengumuman' ? Colors.red[100] : Colors.blue[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  news.category,
                  style: TextStyle(
                    color: news.category == 'Pengumuman' ? Colors.red[800] : Colors.blue[800],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Judul Berita
              Text(
                news.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              // Tanggal
              Text(
                news.date,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 12),
              // Tombol Detail (Logic Detail Berita)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showNewsDetail(context, news), 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF243A5E),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Baca Detail'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _achievementCard(String title) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(title),
        ),
      ),
    );
  }


// --- FUNGSI POP-UP DETAIL BERITA (TUGAS PROGRAMMER 2) ---
  void _showNewsDetail(BuildContext context, NewsModel news) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(news.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news.date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const Divider(),
            Text(news.description),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Tutup")),
        ],
      ),
    );
  }
}// <--- INI TUTUP KURUNG CLASS HOMEPAGE YANG ASLI

// ================= DATA MODEL & SOURCE (LUAR CLASS) =================

class NewsModel {
  final String title;
  final String category;
  final String date;
  final String description;

  NewsModel({
    required this.title,
    required this.category,
    required this.date,
    required this.description,
  });
}

final List<NewsModel> allNews = [
  NewsModel(
    title: "Pendaftaran Siswa Baru TA 2026/2027",
    category: "Pengumuman",
    date: "17 Feb 2026",
    description: "Briseis International School membuka pendaftaran tahun ajaran baru. Tersedia beasiswa prestasi untuk jenjang SMA!",
  ),
  NewsModel(
    title: "Workshop Robotik & AI di Kampus Bekasi",
    category: "Berita",
    date: "20 Feb 2026",
    description: "Siswa BIS akan mendemonstrasikan hasil karya robotik mereka yang memenangkan kompetisi tingkat nasional kemarin.",
  ),
];
