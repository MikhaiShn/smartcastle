import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/profile_screen.dart';

class ProfileScreen2 extends StatefulWidget {
  
  const ProfileScreen2({super.key});

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Профиль')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(FirebaseAuth.instance.currentUser!.email!),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: ));
            }, child: Text('Выйти'))
          ],
        ),
      ),
    );
  }
}