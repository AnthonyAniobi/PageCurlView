import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ntisa_burgers/screens/homepage/homepage.dart';
import 'package:ntisa_burgers/screens/tab_overlay.dart';
import 'package:ntisa_burgers/services/providers/cart_provider.dart';
import 'package:ntisa_burgers/services/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await dotenv.load();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ntiser Burgers',
      debugShowCheckedModeBanner: false, // remove debug banner
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: TabOverlay(),
    );
  }
}
