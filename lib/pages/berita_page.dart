import 'package:flutter/material.dart';
import 'home_page.dart';
import 'visi_misi_page.dart';
import 'prestasi_page.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2F4D),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ================= NAVBAR =================
            Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
  color: const Color(0xFF243A5E),
  child: LayoutBuilder(
    builder: (context, constraints) {

      final isMobile = constraints.maxWidth < 800;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

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

                _navItem("Beranda", false, onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                }),

                _navItem("Visi & Misi", false, onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const VisiMisiPage()),
                  );
                }),

                _navItem("Berita & Pengumuman", true),

                _navItem("Prestasi", false, onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const PrestasiPage()),
                  );
                }),
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
      );
    },
  ),
),

            /// ================= HERO =================
            Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
  color: const Color(0xFF243A5E),
  child: const Center(
    child: Text(
      "Berita & Pengumuman Sekolah",
      textAlign: TextAlign.center, // <<< TAMBAHKAN INI
      style: TextStyle(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
            const SizedBox(height: 40),

/// ================= GRID BERITA =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center, // Biar card-nya rapi di tengah
                children: [
                  _newsCard(
                    "Kunjungan Industri 2025", 
                    "assets/Frame 69-1.png", 
                    "Siswa kelas 12 melakukan kunjungan edukatif ke industri teknologi untuk melihat proses kerja nyata."
                  ),
                  _newsCard(
                    "Juara Lomba Matematika", 
                    "assets/Frame 69.png", 
                    "Selamat kepada tim BIS yang berhasil meraih medali emas dalam kompetisi sains tingkat nasional."
                  ),
                  _newsCard(
                    "Pendaftaran Siswa Baru", 
                    "assets/Frame 69-5.png", 
                    "Pendaftaran untuk tahun ajaran baru 2026/2027 telah resmi dibuka. Segera daftar sekarang!"
                  ),
                  _newsCard(
                    "Workshop Seni & Budaya", 
                    "assets/Frame 69-2.png", 
                    "Meningkatkan kreativitas siswa melalui kegiatan workshop membatik dan tari tradisional."
                  ),
                  _newsCard(
                    "Seminar Parenting", 
                    "assets/Frame 69-3.png", 
                    "Sinergi antara orang tua dan sekolah dalam mendukung tumbuh kembang karakter anak di era digital."
                  ),
                  _newsCard(
                    "Update Gedung Sekolah", 
                    "assets/Frame 69-4.png", 
                    "Laboratorium komputer kini dilengkapi dengan perangkat terbaru untuk menunjang kegiatan belajar coding."
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            /// ================= FOOTER =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: const Color(0xFF1F2F4D),
              child: const Center(
                child: Text(
                  "© 2025 BIS. All Rights Reserved",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// ================= NAV ITEM =================
  Widget _navItem(String text, bool active, {VoidCallback? onTap}) {
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
            color: active ? Colors.white : Colors.white70,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  /// ================= CARD BERITA =================
  Widget _newsCard(String title, String imagePath, String desc) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Berita
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              // Error builder kalau gambar gagal muat
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 16,
              color: Color(0xFF1F2F4D),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}