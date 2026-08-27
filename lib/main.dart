import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Saya',
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.indigo),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                Text(value, style: const TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> _bukaLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Tidak bisa membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rahmat Riyadi',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Mahasiswa Informatika, Universitas Mulawarman',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
                        const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'Biodata',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const InfoTile(
              icon: Icons.school,
              label: 'Program Studi',
              value: 'Informatika, Angkatan 2024',
            ),
            const InfoTile(
              icon: Icons.location_on,
              label: 'Asal',
              value: 'Tanah Bumbu, Kalimantan Selatan',
            ),
            const InfoTile(
              icon: Icons.home,
              label: 'Domisili',
              value: 'Samarinda, Kalimantan Timur',
            ),
            const InfoTile(
              icon: Icons.code,
              label: 'Minat',
              value: 'Mobile Development & Artificial Intelligence',
            ),
                        const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'Tentang Saya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Saya mahasiswa Informatika yang senang mengulik teknologi, '
              'terutama pengembangan aplikasi mobile dan kecerdasan buatan. '
              'Di luar kuliah, saya aktif mengajar bimbel matematika karena '
              'saya suka membantu adik-adik memahami hal yang mereka anggap sulit. '
              'Saya juga sedang belajar bahasa Jepang dan Inggris secara mandiri.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 24),
                        const Text(
              'Kontak',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _bukaLink('mailto:rahmatriyadiambis@gmail.com'),
              icon: const Icon(Icons.email),
              label: const Text('rahmatriyadiambis@gmail.com'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => _bukaLink('https://github.com/riyadiambis'),
              icon: const Icon(Icons.code),
              label: const Text('GitHub'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => _bukaLink('https://www.instagram.com/riyadi_ofisharu'),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Instagram'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
