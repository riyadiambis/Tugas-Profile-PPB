import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
