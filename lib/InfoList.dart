import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  String name;
  String image;
  List<String> ingredients;
  dynamic int;
  InfoPage(
      {super.key,
      required this.name,
      required this.image,
      required this.ingredients});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(widget.image),
              Text('Ингридиенты: '),
              ListView.builder(
                  itemCount: widget.ingredients.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [Text('${widget.ingredients[index]}')],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
