import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoody/provider/my_provider.dart';
import 'package:zoody/screen/Widget/HomePage.dart';
import 'package:zoody/screen/Widget/cart_page.dart';
import 'package:zoody/screen/Widget/detail_page.dart';
import 'package:zoody/screen/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Myprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zoody",
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff2b2b2b),
            appBarTheme: AppBarTheme(
              color: Color(0xff2b2b2b),
            )),
        home: HomePage(),
        // home: LoginPage(),
        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (index, snacpshot) {
        //       if (snacpshot.hasData) {
        //         return HomePage();
        //       }
        //       return LoginPage();
        //     }),
      ),
    );
  }
}
