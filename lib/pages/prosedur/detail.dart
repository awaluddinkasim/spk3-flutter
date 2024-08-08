import 'package:flutter/material.dart';
import 'package:spk3/models/prosedur.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class ProsedurK3DetailScreen extends StatefulWidget {
  const ProsedurK3DetailScreen({super.key, required this.prosedur});

  final ProsedurK3 prosedur;

  @override
  State<ProsedurK3DetailScreen> createState() => _ProsedurK3DetailScreenState();
}

class _ProsedurK3DetailScreenState extends State<ProsedurK3DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
          child: ListWidget(
            children: [
              Text(widget.prosedur.judul, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(widget.prosedur.deskripsi),
              const SizedBox(height: 18),
              const Text("Prosedur", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              Text(widget.prosedur.prosedur),
            ],
          ),
        ),
      ),
    );
  }
}
