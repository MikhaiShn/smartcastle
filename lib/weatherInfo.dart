import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/main.dart';
import 'package:flutter_application_6/weatherModal.dart';
import 'package:http/http.dart' as http;

class WeatherInfo extends StatefulWidget {
  String cityName = ' ';
  WeatherInfo({super.key, required this.cityName});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  TextStyle text = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);



  double temperature = 0.0;
  String status = ' ';
  Image? weatherImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
  }

  Future getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityName}&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric'));
    if (response.statusCode == 200) {
      WeatherApi weatherModal = WeatherApi.fromJson(jsonDecode(response.body));
      setState(() {
        temperature = weatherModal.main!.temp!;
        status = weatherModal.weather!.first.main!;
        if(status == 'Clouds'){
          weatherImage = Image.network('https://cdn-icons-png.flaticon.com/512/5903/5903939.png');
        } if (status == 'Rain'){
          weatherImage = Image.network('https://img.freepik.com/premium-vector/weather-forecast-raining-and-snowing-icon_316839-4385.jpg');
        } if(status == 'Fog'){
          weatherImage = Image.network('https://img.freepik.com/premium-vector/weather-and-meteorology-icon-cloud-and-fog-vector-illustration-weather-forecast-symbol-for-mobile-and-web_646072-163.jpg');
        }
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                widget.cityName,
                style: text,
              ),
              SizedBox(
                height: 10,
              ),
              Text('${temperature.toString()}°C', style: text),
              SizedBox(
                height: 10,
              ),
              Text(
                status,
                style: text,
              ),
              if (weatherImage != null) weatherImage!,
            ],
          ),
        ),
      ),
    );
  }
}
