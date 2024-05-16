import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:libmanagement/firebase_options.dart';
import 'package:libmanagement/function/cart.dart';

import 'package:libmanagement/home.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (context) => CartModel(),
      
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       iconTheme: IconThemeData(color: Colors.pink),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home:  HomeScr())
    );
 
 
 

  }
}
