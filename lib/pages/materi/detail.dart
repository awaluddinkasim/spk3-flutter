import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:spk3/models/materi.dart';
import 'package:spk3/shared/utils/helpers.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class MateriDetailScreen extends StatefulWidget {
  const MateriDetailScreen({super.key, required this.materi});

  final MateriEdukasi materi;

  @override
  State<MateriDetailScreen> createState() => _MateriDetailScreenState();
}

class _MateriDetailScreenState extends State<MateriDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
          child: ListWidget(
            children: [
              Text(widget.materi.judul, style: Theme.of(context).textTheme.titleLarge),
              Text(formatTanggal(widget.materi.tglDibuat.toString())),
              const SizedBox(height: 22),
              HtmlWidget(widget.materi.materi),
            ],
          ),
        ),
      ),
    );
  }
}
