import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/prosedur_cubit.dart';
import 'package:spk3/cubit/prosedur_state.dart';
import 'package:spk3/pages/prosedur/detail.dart';
import 'package:spk3/shared/widgets/custom_card.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class ListProsedurK3Screen extends StatefulWidget {
  const ListProsedurK3Screen({super.key});

  @override
  State<ListProsedurK3Screen> createState() => ListProsedurK3ScreenState();
}

class ListProsedurK3ScreenState extends State<ListProsedurK3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prosedur K3"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProsedurCubit>().getProsedur();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<ProsedurCubit, ProsedurState>(
            builder: (context, state) {
              if (state is ProsedurLoading) {
                return const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is ProsedurSuccess) {
                if (state.daftarProsedur.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Center(
                      child: Text("Tidak ada data"),
                    ),
                  );
                }
                return ListWidget(
                  children: [
                    for (var item in state.daftarProsedur)
                      CustomCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProsedurK3DetailScreen(
                                prosedur: item,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    item.judul,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item.deskripsi,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 22,
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                  ],
                );
              }

              if (state is ProsedurFailed) {
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
