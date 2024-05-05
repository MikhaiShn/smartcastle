import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<DocumentSnapshot> users = [];



  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    try {
      QuerySnapshot collection =
          await FirebaseFirestore.instance.collection('users').get();
      setState(() {
        users = collection.docs;
        print('users: $users');
      });
    } catch (e) {
      print(e);
    }
  }

  Future createUsers(String name, String age, String imageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc()
          .set({'name': name, 'age': age, 'image': imageUrl});
    } catch (e) {
      print('error createUser: $e');
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  PlatformFile? pickedFile;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Пользователи')),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Вы точно хотите удалить?'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () async {},
                                      child: Text('Да')),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Нет')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Column(
                children: [
                  Text(
                    users[index]['name'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // Text(users[index]['age'].toString(),
                  //     style:
                  //         TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Image.network(users[index]['image'])
                ],
              ),
            ),
          );
        },
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    width: 300,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                label: Center(child: Text('Add'))),
                          ),
                        )),
                        TextField(
                          controller: ageController,
                          decoration: InputDecoration(
                              label: Center(child: Text('age'))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            final result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              pickedFile = result.files.first;
                            }

                            print('picked: ${pickedFile!.name}');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Добавить фото',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              print('clickk');
                              final path = 'files/${pickedFile!.name}';
                              final file = File(pickedFile!.path!);
                              final ref =
                                  FirebaseStorage.instance.ref().child(path);
                              ref.putFile(file);
                              final String imageUrl =
                                  await ref.getDownloadURL();

                                  print('url: $imageUrl');
                              createUsers(nameController.text,
                                  ageController.text, imageUrl);
                              getUsers();
                              Navigator.pop(context);
                            },
                            child: Text('Add'))
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
