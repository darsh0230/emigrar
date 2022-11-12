import 'package:emigrar/constants/constantColors.dart';
import 'package:emigrar/providers/utilProvider.dart';
import 'package:emigrar/screens/auth/loginScreen.dart';
import 'package:emigrar/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UtilProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return MaterialApp(
      title: 'Emigrar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: cc.black,
      ),
      home: const HomeScreen(),
    );
  }
}
