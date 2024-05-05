import 'package:flutter/material.dart';

class vkScreen extends StatefulWidget {
  const vkScreen({super.key});

  @override
  State<vkScreen> createState() => _vkScreenState();
}

class _vkScreenState extends State<vkScreen> {
  int selectedIndex = 0;
  List<Widget> widgets = [
    Text('Все сообщения'),
    Text('Прочитанные'),
    Text('Удаленные')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VK'),
        backgroundColor: Colors.blue,
      ),
      body: widgets[selectedIndex],
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.sms),
              title: Text('Все сообщения'),   
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Категории'),   
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Главная'),   
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
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
      )
    );
  }
}
