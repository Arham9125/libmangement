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


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (context) => CartModel(),
      
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home:  HomeScr())
    );
 
 
 

  }
}
