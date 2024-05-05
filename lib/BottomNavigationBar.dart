import 'package:flutter/material.dart';
import 'package:flutter_application_6/ReceptModal.dart';
import 'package:flutter_application_6/categoryScreen.dart';
import 'package:flutter_application_6/profile.dart';
import 'package:flutter_application_6/recept.dart';
import 'package:flutter_application_6/todo.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text('BottomNavBar'),
      // ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          Recept(),
          CategoriesScreen(),
          Todo(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
        ),
        child: BottomNavigationBar(
          
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.red,), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.business, color: Colors.blue,), label: 'Business'),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.orange,), label: 'Profile')
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
            
          },
          selectedLabelStyle: TextStyle(color: Colors.black),
          selectedIconTheme: IconThemeData(size: 40),
        ),
      ),
    );
  }
}