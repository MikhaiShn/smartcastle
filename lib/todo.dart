import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late List<String> zametki;
  TextEditingController textEditingController = TextEditingController();

  void initState() {
    super.initState();
    getNotesFromShared();
  }

  Future getNotesFromShared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      zametki = sp.getStringList('zametki_key') ?? [];
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: TextStyle(fontSize: 26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Очистить список?',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sp =
                                              await SharedPreferences
                                                  .getInstance();

                                          setState(() {
                                            zametki.clear();
                                            sp.remove('zametki_key');
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text('Да')),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Нет')),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(
                  Icons.delete,
                )),
          )
        ],
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.separated(
        itemCount: zametki.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SizedBox(
                            height: 200,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Удалить заметку?',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            SharedPreferences sp =
                                                await SharedPreferences
                                                    .getInstance();
                                            setState(() {
                                              zametki.removeAt(index);
                                              sp.setStringList(
                                                  'zametki_key', zametki);
                                            });

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                  width: 400,
                                                  showCloseIcon: true,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    duration:
                                                        Duration(microseconds: 1),
                                                    backgroundColor:
                                                        Colors.orangeAccent,
                                                    content: Center(
                                                        child: Text(
                                                      'Успешно удалено',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ))));

                                            Navigator.pop(context);
                                          },
                                          child: Text('Да')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Нет')),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  zametki[index],
                  style: TextStyle(fontSize: 22),
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 0,
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textEditingController.clear();
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: textEditingController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        duration: Duration(seconds: 1),
                                        backgroundColor: Colors.orangeAccent,
                                        content: Center(
                                            child: Text(
                                          'Успешно добавлено!',
                                          style: TextStyle(fontSize: 20),
                                        ))));
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();

                                setState(() {
                                  if (textEditingController.text != '') {
                                    zametki.add(textEditingController.text);

                                    sp.setStringList('zametki_key', zametki);
                                  }
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Добавить'))
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
