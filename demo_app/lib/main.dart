import 'package:demo_app/Pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/Pages/my_home_page.dart';//Se importa archivo para poder ejecutar clase MyHomePage

//Ejecucion de aplicacion general
void main() => runApp(const MyApp());

//creacion de clase principal donde se llaman y se pone a interactuar todas las pantallas de la apk
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: MyHomePage(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/Second": (BuildContext context) =>SecondPage(),
      },
    );
  }
}