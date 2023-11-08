import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    SecondPageArguments? arguments = ModalRoute.of(context)!.settings.arguments as SecondPageArguments?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("MI COMERCIO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text(arguments!.name),
              Text(arguments.phone),
              Text(arguments.address),
              Text(arguments.business),
              Text(arguments.delivery),
              Text(arguments.webpage),
          ],
        ),
      ),
    );
  }
} 
class SecondPageArguments{
  String name;
  String phone;
  String address;
  String business;
  String delivery;
  String webpage;
  SecondPageArguments({required this.name,required this.phone,required this.address,required this.business,required this.delivery,required this.webpage});
}