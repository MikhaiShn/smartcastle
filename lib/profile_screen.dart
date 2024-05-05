import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/profile_registration.dart';
import 'package:flutter_application_6/profile_screen2.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorText = ' ';
  bool loading = false;
  @override
  Future signin() async {
    setState(() {
      loading = false;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileScreen2()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        errorText = 'Неверные данные';
      } else if (e.code == 'invalid-email') {
        errorText == 'Неверный формат';
      } else {
        errorText == 'Ошибка';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 4),
          content: Text(e.code),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Вход')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(''),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text('email'),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(label: Text('password'),contentPadding: EdgeInsets.symmetric(horizontal: 10.0)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    
                    ),
                    
                child: Text('Регистрация')),
            SizedBox(
              height: 20,
            ),
            loading == true
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      signin();
                    },
                    child: Text('Войти'))
          ],
        ),
      ),
    );
  }
}
