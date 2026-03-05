import 'package:flutter/material.dart';
import 'package:ujikom_zaidan_arz_arkham_kny/pages/berita_page.dart';
import 'package:ujikom_zaidan_arz_arkham_kny/pages/home_page.dart';
import 'prestasi_page.dart';


class VisiMisiPage extends StatelessWidget {
  const VisiMisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: SingleChildScrollView(
        child: Column(
          children: [

          
          /// ================= NAVBAR =================
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
  child: LayoutBuilder(
    builder: (context, constraints) {

      final isMobile = constraints.maxWidth < 800;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

              /// LOGO
Image.asset(
  "assets/Briseis logo 2.png", // Ganti dengan path file logomu
  height: 40,        // Sesuaikan tinggi logo agar pas dengan navbar
  fit: BoxFit.contain,
),

          /// ================= DESKTOP MENU =================
          if (!isMobile)
            Row(
              children: [

                _navItem(
                  "Beranda",
                  false,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                ),

                _navItem("Visi & Misi", true),

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
              icon: const Icon(Icons.menu, color: Colors.black),
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


            const SizedBox(height: 50),

            /// ================= VISI =================
            _card(
              title: "Visi Sekolah",
              text:
                  "Menjadi institusi pendidikan yang unggul dalam membentuk generasi yang "
                  "berkarakter kuat, berprestasi secara akademik, serta memiliki kepedulian sosial dan wawasan global, melalui proses "
                  "pendidikan yang berkualitas, berkelanjutan, dan berlandaskan nilai-nilai integritas.",
              icon: Icons.remove_red_eye_outlined,
            ),

            const SizedBox(height: 40),

            /// ================= MISI =================
            _card(
              title: "Misi Sekolah",
              text:
                  "Mengembangkan warga sekolah yang beragam budaya dan agama melalui proses pembelajaran berkualitas yang "
                  "menekankan pembentukan karakter serta pemberdayaan pendidikan berwawasan global.",
              icon: Icons.track_changes_outlined,
            ),

            const SizedBox(height: 40),

            /// ================= NILAI =================
            _card(
              title: "Nilai Sekolah",
              text:
                  "Integritas, keunggulan, disiplin, kepedulian, inklusivitas, dan pembelajaran "
                  "berkelanjutan menjadi fondasi utama dalam membangun budaya sekolah yang positif, "
                  "inspiratif, dan berorientasi pada masa depan..",
              icon: Icons.school_outlined,
            ),

            const SizedBox(height: 80),

            /// ================= FOOTER =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: const Color(0xFF1F2F4D),
              child: const Center(
                child: Text(
                  "Copyright © 2025 BIS. All Rights Reserved",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// ================= CARD =================
  Widget _card({
    required String title,
    required String text,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;

          return Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(icon, size: 60, color: Colors.blueGrey),
                      const SizedBox(height: 16),
                      Text(title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text(text,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black54)),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            Text(text,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black54)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Icon(icon, size: 80, color: Colors.blueGrey),
                    ],
                  ),
          );
        },
      ),
    );
  }
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
          color: active ? Colors.white : Colors.black,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}
}
