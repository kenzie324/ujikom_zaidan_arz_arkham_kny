import 'package:flutter/material.dart';

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
              decoration: const BoxDecoration(
                color: Color(0xFF243A5E),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;

                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Mengapa BIS Merupakan\nPilihan Terbaik sebagai\nSekolah Internasional?',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'BIS menekankan pendidikan berkualitas, '
                              'tidak hanya akademik tetapi juga karakter.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40, height: 40),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8B1E2D),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                        ),
                        child: const Text('Selanjutnya'),
                      ),
                    ],
                  );
                },
              ),
            ),

            // ================= KURIKULUM =================
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Kurikulum BIS',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'BIS menerapkan Kurikulum Cambridge '
                    'dari Primary hingga A Level.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            // ================= BERITA =================
            Container(
              width: double.infinity,
              color: const Color(0xFF1F2F4D),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Berita & Acara',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _newsCard('Apa Itu Fotosintesis?'),
                      _newsCard('Strict Parents Pada Anak'),
                    ],
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
    return SizedBox(
      width: 320,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(subtitle),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B1E2D),
                ),
                child: const Text('Selengkapnya'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _newsCard(String title) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Selengkapnya'),
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
}
