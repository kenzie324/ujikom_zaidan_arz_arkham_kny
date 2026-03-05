import 'package:flutter/material.dart';
import 'home_page.dart';
import 'visi_misi_page.dart';
import 'berita_page.dart';

// 1. KITA BUAT MODEL DATA SEDERHANA
class ModelPrestasi {
  final String gambar;
  final String judul;
  final String tanggal;

  ModelPrestasi({required this.gambar, required this.judul, required this.tanggal});
}

class PrestasiPage extends StatelessWidget {
  const PrestasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. DAFTAR DATA PRESTASI (Ganti path gambar sesuai file kamu nanti)
    final List<ModelPrestasi> daftarPrestasi = [
      ModelPrestasi(gambar: "assets/Frame 1.png", judul: "Juara 1 Lomba Coding Nasional", tanggal: "10 Januari 2026"),
      ModelPrestasi(gambar: "assets/Frame 2.png", judul: "Medali Emas Olimpiade Matematika", tanggal: "15 Januari 2026"),
      ModelPrestasi(gambar: "assets/Frame 3.png", judul: "Juara Harapan Design Grafis", tanggal: "20 Januari 2026"),
      ModelPrestasi(gambar: "assets/Frame 4.png", judul: "Pemenang Debat Bahasa Inggris", tanggal: "25 Januari 2026"),
      ModelPrestasi(gambar: "assets/Frame 5.png", judul: "Juara 2 Basket Tingkat Provinsi", tanggal: "30 Januari 2026"),
      ModelPrestasi(gambar: "assets/Frame 6.png", judul: "Penghargaan Siswa Berprestasi", tanggal: "01 Februari 2026"),
      // Tambahkan sampai 9 atau sesuai kebutuhan
    ];

    return Scaffold(
      backgroundColor: const Color(0xff1E2B4A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            _navbar(context),
            const SizedBox(height: 50),
            const Text(
              "Prestasi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            /// ================= GRID =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  if (constraints.maxWidth < 1100) crossAxisCount = 2;
                  if (constraints.maxWidth < 700) crossAxisCount = 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // 3. GUNAKAN JUMLAH DATA DARI LIST
                    itemCount: daftarPrestasi.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 40,
                      childAspectRatio: 0.99,
                    ),
                    itemBuilder: (context, index) {
                      // 4. KIRIM DATA KE CARD BERDASARKAN INDEX
                      return _prestasiCard(daftarPrestasi[index]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  /// ================= NAVBAR =================
  // (Tetap sama seperti kode kamu sebelumnya)
Widget _navbar(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {

      bool isMobile = constraints.maxWidth < 800;

      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 40,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

               /// LOGO
Image.asset(
  "assets/Briseis logo.png", // Ganti dengan path file logomu
  height: 40,        // Sesuaikan tinggi logo agar pas dengan navbar
  fit: BoxFit.contain,
),

            /// DESKTOP MENU
            if (!isMobile)
              Row(
                children: [
                  _navItem(context, "Beranda", false, const HomePage()),
                  _navItem(context, "Visi & Misi", false, const VisiMisiPage()),
                  _navItem(context, "Berita & Pengumuman", false, const BeritaPage()),
                  _navItem(context, "Prestasi", true, const PrestasiPage()),
                ],
              ),

            /// MOBILE MENU (HAMBURGER)
            if (isMobile)
              PopupMenuButton<int>(
                icon: const Icon(Icons.menu, color: Colors.white),
                onSelected: (value) {
                  if (value == 0) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                  }
                  if (value == 1) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const VisiMisiPage()));
                  }
                  if (value == 2) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const BeritaPage()));
                  }
                  if (value == 3) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const PrestasiPage()));
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
      );
    },
  );
}

  Widget _navItem(BuildContext context, String title, bool active, Widget page) {
    return GestureDetector(
      onTap: () {
        if (!active) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xff8B1E2D) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// ================= CARD (MODIFIED) =================
  // 5. TERIMA PARAMETER DATA DI SINI
Widget _prestasiCard(ModelPrestasi data) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xffEDEDED),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min, // <<< TAMBAHKAN INI
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            data.gambar,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 120,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        Text(
          data.judul,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          data.tanggal,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff8B1E2D),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text("Selengkapnya"),
        ),
      ],
    ),
  );
}
}