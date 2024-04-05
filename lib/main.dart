import 'package:flutter/material.dart';
import 'package:weatherforecastapplication/view/home.dart';
import 'package:provider/provider.dart';

import 'controll/apicontroll.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
   create: (context) => WeatherProvider(),
child: MaterialApp(
      
      home: Home(),
      
      ),
    );
  }
}

