import 'package:flutter/material.dart';
import 'package:spk3/models/area_berbahaya.dart';
import 'package:spk3/shared/constants.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class AreaBerbahayaScreen extends StatefulWidget {
  const AreaBerbahayaScreen({super.key, required this.areaBerbahaya});

  final AreaBerbahaya areaBerbahaya;

  @override
  State<AreaBerbahayaScreen> createState() => _AreaBerbahayaScreenState();
}

class _AreaBerbahayaScreenState extends State<AreaBerbahayaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
        child: ListWidget(
          children: [
            const SizedBox(height: 32),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: SizedBox(
                height: 200,
                child: Image.network(
                  "${Constants.baseUrl}/area/${widget.areaBerbahaya.gambar}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(widget.areaBerbahaya.lokasi, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              children: [
                const Expanded(
                  child: Text("Tingkat Bahaya"),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 53, 150, 199),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(widget.areaBerbahaya.tingkatBahaya.toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Theme.of(context).primaryColor,
            ),
            Text(widget.areaBerbahaya.deskripsi),
          ],
        ),
      ),
    );
  }
}
