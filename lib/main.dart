import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:spk3/cubit/apd_cubit.dart';
import 'package:spk3/cubit/area_berbahaya_cubit.dart';
import 'package:spk3/cubit/materi_cubit.dart';
import 'package:spk3/cubit/prosedur_cubit.dart';
import 'package:spk3/pages/about.dart';
import 'package:spk3/pages/apd/list.dart';
import 'package:spk3/pages/area_berbahaya/list.dart';
import 'package:spk3/pages/home.dart';
import 'package:spk3/pages/materi/list.dart';
import 'package:spk3/pages/prosedur/list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MateriCubit()),
        BlocProvider(create: (context) => AlatPelindungDiriCubit()),
        BlocProvider(create: (context) => AreaBerbahayaCubit()),
        BlocProvider(create: (context) => ProsedurCubit()),
      ],
      child: MaterialApp(
        title: 'Sistem Penerapan K3',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.lightBlue.shade300, elevation: 7),
          colorScheme: const ColorScheme.light(primary: Colors.blueGrey),
          scaffoldBackgroundColor: Colors.grey.shade100,
          useMaterial3: true,
        ),
        home: const MainApp(),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Image.asset(
                "assets/pln.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.my_library_books_rounded),
              title: const Text("Materi Edukasi"),
              onTap: () {
                context.read<MateriCubit>().getMateri();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListMateriScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_city_rounded),
              title: const Text("Area Berbahaya"),
              onTap: () {
                context.read<AreaBerbahayaCubit>().getAreaBerbahaya();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListAreaBerbahayaScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("Prosedur K3"),
              onTap: () {
                context.read<ProsedurCubit>().getProsedur();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListProsedurK3Screen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shield_sharp),
              title: const Text("Alat Pelindung Diri"),
              onTap: () {
                context.read<AlatPelindungDiriCubit>().getAlatPelindungDiri();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListAlatPelindungDiriScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Tentang"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const HomeScreen(),
    );
  }
}
