// ignore_for_file: unused_local_variable

import 'package:demo_app/Pages/second_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String nameValue;
  late String phoneValue;
  late String addressValue;
  late String businessValue = "Tienda";
  late String deliveryValue = "No";
  late String webpageValue;
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("REGISTRA TU COMERCIO"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children:<Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre: "),
                onSaved: (value){
                  nameValue = value!;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Ingresar nombre";
                  }
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Comercio:  "),
                items: <String>["Tienda","Ferretería","Dulcería"].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: businessValue,
                onChanged: (String? valueIn){
                  setState(() {
                    businessValue = valueIn!;
                  });
                }
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Telefono: "),
                keyboardType: TextInputType.number,
                onSaved: (value){
                  phoneValue = value!;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Ingresar Telefono";
                  }
                },  
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Direccion: "),
                onSaved: (value){
                  addressValue = value!;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Ingresar direccion";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Pagina WEB: "),
                onSaved: (value){
                  webpageValue = value!;
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Domicilio:  "),
                items: <String>["Si","No"].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: deliveryValue,
                onChanged: (String? valueIn){
                  setState(() {
                    deliveryValue = valueIn!;
                  });
                }
              ),
              ElevatedButton(
                child: const Text("REGISTRAR"),
                onPressed: (){
                  _showSecondPage(context);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
    }
    Navigator.of(context).pushNamed("/Second",
        arguments: SecondPageArguments(
          name: nameValue, 
          phone: phoneValue, 
          address: addressValue,
          business: businessValue,
          delivery: deliveryValue,
          webpage: webpageValue,
          ));
    }
}
