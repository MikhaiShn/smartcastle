import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/profile.dart';
import 'package:flutter_application_6/profile_screen.dart';
import 'package:flutter_application_6/profile_screen2.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController email = TextEditingController();
  TextEditingController passwordFirst = TextEditingController();
  TextEditingController passwordSecond = TextEditingController();

  Future<void> register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: passwordFirst.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen2()),
      );
    } catch (e) {
      print('Registration failed: $e');
      // Handle the registration failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(labelText: 'Укажите ваш e-mail'),
          ),
          TextField(
            controller: passwordFirst,
            decoration: InputDecoration(labelText: 'Введите новый пороль'),
          ),
          TextField(
            controller: passwordSecond,
            decoration: InputDecoration(labelText: 'Повторите новый пороль'),
          ),
          ElevatedButton(
            onPressed: () {
              if (passwordFirst.text == passwordSecond.text) {
                register();
              };
              Navigator.pop(context);
             FirebaseAuth.instance.signOut();
            },
            child: Text('Зарегистрироваться'),
          )
        ],
      ),
    );
  }
}
