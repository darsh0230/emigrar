import 'package:emigrar/constants/constantColors.dart';
import 'package:emigrar/providers/authProvider.dart';
import 'package:emigrar/providers/utilProvider.dart';
import 'package:emigrar/screens/auth/loginScreen.dart';
import 'package:emigrar/screens/auth/registerScreen.dart';
import 'package:emigrar/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UtilProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<AuthProvider>().loadAuthCred();
      print(context.read<AuthProvider>().userExists());
      setState(() {});
    });
  }

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
      home: AnimatedSplashScreen(
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: cc.black,
        splash: SizedBox(
          width: 250.0,
          height: 250.0,
          child: Image.asset("assets/images/logo1.png"),
        ),
        // nextScreen: RegisterScreen(),
        nextScreen: context.read<AuthProvider>().userExists()
            ? HomeScreen()
            : LoginScreen(),
      ),
    );
  }
}
