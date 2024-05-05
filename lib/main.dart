import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/profile_screen.dart';
import 'package:flutter_application_6/shop.dart';
import 'package:flutter_application_6/shopLogIn.dart';
import 'package:flutter_application_6/shopSplash.dart';
import 'package:flutter_application_6/users.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyDBBGgrNz_WkMEfwn1Yav7cgWJf17SxTA0',
    appId: 'com.example.flutter_application_1',
    messagingSenderId: 'sendid',
    projectId: 'smartcastle2-7b547',
    storageBucket: 'smartcastle2-7b547.appspot.com',
  ));
  await initializeDateFormatting('ru', null);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shop(), 
    );
  }
}
