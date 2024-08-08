import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/apd_cubit.dart';
import 'package:spk3/cubit/apd_state.dart';
import 'package:spk3/models/apd.dart';
import 'package:spk3/shared/widgets/custom_card.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class ListAlatPelindungDiriScreen extends StatefulWidget {
  const ListAlatPelindungDiriScreen({super.key});

  @override
  State<ListAlatPelindungDiriScreen> createState() => _ListAlatPelindungDiriScreenState();
}

class _ListAlatPelindungDiriScreenState extends State<ListAlatPelindungDiriScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Alat Pelindung Diri"),
          bottom: const TabBar(
            labelColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(
                text: "Pelindung Mata",
              ),
              Tab(
                text: "Pelindung Telinga",
              ),
              Tab(
                text: "Pelindung Tangan",
              ),
              Tab(
                text: "Pelindung Kepala",
              ),
              Tab(
                text: "Pelindung Kaki",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: BlocBuilder<AlatPelindungDiriCubit, AlatPelindungDiriState>(
                builder: (context, state) {
                  if (state is AlatPelindungDiriLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is AlatPelindungDiriSuccess) {
                    if (state.daftarAlatPelindungDiri
                        .where((alat) => alat.jenis == "Pelindung Mata")
                        .isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Center(
                          child: Text("Tidak ada data"),
                        ),
                      );
                    } else {
                      return ListWidget(
                        children: [
                          for (var item in state.daftarAlatPelindungDiri
                              .where((alat) => alat.jenis == "Pelindung Mata"))
                            CustomCard(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Detail(
                                      alat: item,
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          item.nama,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text("Standar Keamanan: ${item.standarKeamanan}"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 22,
                                  ),
                                  const Icon(Icons.shield_outlined),
                                ],
                              ),
                            ),
                        ],
                      );
                    }
                  }
                  if (state is AlatPelindungDiriFailed) {
                    Text("Error ${state.message}");
                  }

                  return Container();
                },
              ),
            ),
            SingleChildScrollView(
              child: BlocBuilder<AlatPelindungDiriCubit, AlatPelindungDiriState>(
                builder: (context, state) {
                  if (state is AlatPelindungDiriLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is AlatPelindungDiriSuccess) {
                    if (state.daftarAlatPelindungDiri
                        .where((alat) => alat.jenis == "Pelindung Telinga")
                        .isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Center(
                          child: Text("Tidak ada data"),
                        ),
                      );
                    } else {
                      return ListWidget(
                        children: [
                          for (var item in state.daftarAlatPelindungDiri
                              .where((alat) => alat.jenis == "Pelindung Telinga"))
                            CustomCard(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Detail(
                                      alat: item,
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          item.nama,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text("Standar Keamanan: ${item.standarKeamanan}"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 22,
                                  ),
                                  const Icon(Icons.shield_outlined),
                                ],
                              ),
                            ),
                        ],
                      );
                    }
                  }
                  if (state is AlatPelindungDiriFailed) {
                    Text("Error ${state.message}");
                  }

                  return Container();
                },
              ),
            ),
            SingleChildScrollView(
              child: BlocBuilder<AlatPelindungDiriCubit, AlatPelindungDiriState>(
                builder: (context, state) {
                  if (state is AlatPelindungDiriLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is AlatPelindungDiriSuccess) {
                    if (state.daftarAlatPelindungDiri
                        .where((alat) => alat.jenis == "Pelindung Tangan")
                        .isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Center(
                          child: Text("Tidak ada data"),
                        ),
                      );
                    } else {
                      return ListWidget(
                        children: [
                          for (var item in state.daftarAlatPelindungDiri
                              .where((alat) => alat.jenis == "Pelindung Tangan"))
                            CustomCard(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Detail(
                                      alat: item,
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          item.nama,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text("Standar Keamanan: ${item.standarKeamanan}"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 22,
                                  ),
                                  const Icon(Icons.shield_outlined),
                                ],
                              ),
                            ),
                        ],
                      );
                    }
                  }
                  if (state is AlatPelindungDiriFailed) {
                    Text("Error ${state.message}");
                  }

                  return Container();
                },
              ),
            ),
            SingleChildScrollView(
              child: BlocBuilder<AlatPelindungDiriCubit, AlatPelindungDiriState>(
                builder: (context, state) {
                  if (state is AlatPelindungDiriLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is AlatPelindungDiriSuccess) {
                    if (state.daftarAlatPelindungDiri
                        .where((alat) => alat.jenis == "Pelindung Kepala")
                        .isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Center(
                          child: Text("Tidak ada data"),
                        ),
                      );
                    } else {
                      return ListWidget(
                        children: [
                          for (var item in state.daftarAlatPelindungDiri
                              .where((alat) => alat.jenis == "Pelindung Kepala"))
                            CustomCard(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Detail(
                                      alat: item,
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          item.nama,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text("Standar Keamanan: ${item.standarKeamanan}"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 22,
                                  ),
                                  const Icon(Icons.shield_outlined),
                                ],
                              ),
                            ),
                        ],
                      );
                    }
                  }
                  if (state is AlatPelindungDiriFailed) {
                    Text("Error ${state.message}");
                  }

                  return Container();
                },
              ),
            ),
            SingleChildScrollView(
              child: BlocBuilder<AlatPelindungDiriCubit, AlatPelindungDiriState>(
                builder: (context, state) {
                  if (state is AlatPelindungDiriLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is AlatPelindungDiriSuccess) {
                    if (state.daftarAlatPelindungDiri
                        .where((alat) => alat.jenis == "Pelindung Kaki")
                        .isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Center(
                          child: Text("Tidak ada data"),
                        ),
                      );
                    } else {
                      return ListWidget(
                        children: [
                          for (var item in state.daftarAlatPelindungDiri
                              .where((alat) => alat.jenis == "Pelindung Kaki"))
                            CustomCard(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Detail(
                                      alat: item,
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          item.nama,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text("Standar Keamanan: ${item.standarKeamanan}"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 22,
                                  ),
                                  const Icon(Icons.shield_outlined),
                                ],
                              ),
                            ),
                        ],
                      );
                    }
                  }
                  if (state is AlatPelindungDiriFailed) {
                    Text("Error ${state.message}");
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key, required this.alat});

  final AlatPelindungDiri alat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 22),
            child: ListWidget(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Nama",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(alat.nama),
                        ],
                      ),
                    ),
                    Text(
                      alat.standarKeamanan,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Jenis",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(alat.jenis),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Deskripsi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(alat.spesifikasi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
