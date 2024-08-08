import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/materi_cubit.dart';
import 'package:spk3/cubit/materi_state.dart';
import 'package:spk3/pages/materi/detail.dart';
import 'package:spk3/shared/utils/helpers.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class ListMateriScreen extends StatefulWidget {
  const ListMateriScreen({super.key});

  @override
  State<ListMateriScreen> createState() => ListMateriScreenState();
}

class ListMateriScreenState extends State<ListMateriScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi Edukasi"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MateriCubit>().getMateri();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<MateriCubit, MateriState>(
            builder: (context, state) {
              if (state is MateriLoading) {
                return const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is MateriSuccess) {
                if (state.daftarMateri.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Center(
                      child: Text("Tidak ada data"),
                    ),
                  );
                }
                return ListWidget(
                  children: [
                    for (var item in state.daftarMateri)
                      Card(
                        child: ListTile(
                          title: Text(item.judul, maxLines: 2, overflow: TextOverflow.ellipsis),
                          subtitle: Text(formatTanggal(item.tglDibuat.toString())),
                          leading: const Icon(
                            Icons.book,
                            size: 30,
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MateriDetailScreen(
                                  materi: item,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              }
              if (state is MateriFailed) {
                Text("Error ${state.message}");
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
