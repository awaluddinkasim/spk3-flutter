import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 6),
        child: ListWidget(
          children: [
            SvgPicture.asset(
              "assets/about.svg",
              height: 230,
            ),
            const SizedBox(height: 28),
            Text(
              "Sistem Penerapan K3 Area Berbahaya merupakan aplikasi inovatif yang dikembangkan sebagai bagian integral dari komitmen PT PLN (Persero) dalam meningkatkan keselamatan dan kesehatan kerja di lingkungan operasionalnya. Aplikasi ini lahir dari kesadaran mendalam akan pentingnya pengelolaan risiko di area-area yang dianggap berbahaya dalam operasional PLN, sebuah langkah proaktif dalam menjaga keselamatan karyawan dan menjamin keberlanjutan operasional perusahaan.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            Text(
              "Dengan Sistem Penerapan K3 Area Berbahaya, PT PLN (Persero) berharap dapat menciptakan lingkungan kerja yang lebih aman, meningkatkan efisiensi operasional, dan membudayakan praktik K3 yang baik di seluruh lini organisasi. Aplikasi ini merupakan wujud nyata dari komitmen PLN terhadap keselamatan karyawan dan keberlanjutan operasional perusahaan.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
