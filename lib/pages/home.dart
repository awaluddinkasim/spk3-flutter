import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spk3/cubit/area_berbahaya_cubit.dart';
import 'package:spk3/cubit/area_berbahaya_state.dart';
import 'package:spk3/cubit/materi_cubit.dart';
import 'package:spk3/cubit/materi_state.dart';
import 'package:spk3/shared/widgets/list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<MateriCubit>().getMateri();
      context.read<AreaBerbahayaCubit>().getAreaBerbahaya();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
      child: ListWidget(
        children: [
          Text("Selamat Datang", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 18),
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    "assets/home.svg",
                    height: 150,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Sistem Penerapan K3 Area Berbahaya",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Materi Edukasi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<MateriCubit, MateriState>(
                          builder: (context, state) {
                            if (state is MateriLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is MateriSuccess) {
                              return Text(
                                state.daftarMateri.length.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                              );
                            }

                            return Text(
                              "0",
                              style: Theme.of(context).textTheme.titleLarge,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Area Berbahaya",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<AreaBerbahayaCubit, AreaBerbahayaState>(
                          builder: (context, state) {
                            if (state is AreaBerbahayaLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is AreaBerbahayaSuccess) {
                              return Text(
                                state.daftarAreaBerbahaya.length.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                              );
                            }

                            return Text(
                              "0",
                              style: Theme.of(context).textTheme.titleLarge,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
