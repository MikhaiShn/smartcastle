import 'package:flutter/material.dart';
import 'package:flutter_application_6/weatherInfo.dart';
class Weather extends StatefulWidget {
   Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Погода'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(hintText: 'Введите название города'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherInfo(
                cityName: cityController.text,
              )));
            }, child: Text('Получить погоду'))
          ],
        ),
      ),
    );
  }
}