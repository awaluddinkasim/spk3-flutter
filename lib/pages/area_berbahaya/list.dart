import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/area_berbahaya_cubit.dart';
import 'package:spk3/cubit/area_berbahaya_state.dart';
import 'package:spk3/pages/area_berbahaya/detail.dart';
import 'package:spk3/shared/constants.dart';
import 'package:spk3/shared/widgets/custom_card.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class ListAreaBerbahayaScreen extends StatefulWidget {
  const ListAreaBerbahayaScreen({super.key});

  @override
  State<ListAreaBerbahayaScreen> createState() => _ListAreaBerbahayaScreenState();
}

class _ListAreaBerbahayaScreenState extends State<ListAreaBerbahayaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Area Berbahaya"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<AreaBerbahayaCubit>().getAreaBerbahaya();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<AreaBerbahayaCubit, AreaBerbahayaState>(builder: (context, state) {
            if (state is AreaBerbahayaLoading) {
              return const Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is AreaBerbahayaSuccess) {
              if (state.daftarAreaBerbahaya.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Center(
                    child: Text("Tidak ada data"),
                  ),
                );
              }
              return ListWidget(
                children: [
                  for (var item in state.daftarAreaBerbahaya)
                    CustomCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AreaBerbahayaScreen(areaBerbahaya: item),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  item.lokasi,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item.deskripsi,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue.shade200,
                            ),
                            child: Image.network(
                              "${Constants.baseUrl}/area/${item.gambar}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            }
            if (state is AreaBerbahayaFailed) {
              Text("Error ${state.message}");
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
