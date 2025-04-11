import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notefyi_r/firebase_options.dart';
import 'package:notefyi_r/login.dart';
import 'package:notefyi_r/services/notifications.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  const fakeUsername = 'Viraj';

  runApp(
    ChangeNotifierProvider(
      create: (_) => NotificationService(username: fakeUsername),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
