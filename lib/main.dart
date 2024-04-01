import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/views/main_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBU57KzgFIldxY4ingouY4jKF97TIVZe74",
          authDomain: "gabrielmeireles-portfolio.firebaseapp.com",
          projectId: "gabrielmeireles-portfolio",
          storageBucket: "gabrielmeireles-portfolio.appspot.com",
          messagingSenderId: "927988727531",
          appId: "1:927988727531:web:7abd5a1b422b1ac0f948ae"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    return ProviderScope(
      child: MaterialApp(
        title: 'Gabriel Meireles',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: PageStorage(
          bucket: bucket,
          child: MainDashBoard(),
        ),
      ),
    );
  }
}
