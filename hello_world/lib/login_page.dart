// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';
// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                TextField(
                  onChanged: (text){
                    email = text;
                  },
                decoration: InputDecoration(labelText: 'Email', 
                border: OutlineInputBorder(),
                )
                ),
                SizedBox(height: 15),
                TextField(
                  onChanged: (text){
                    password = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password', 
                    border: OutlineInputBorder(),
                  )
                ),
              SizedBox(height: 15),
              ElevatedButton(onPressed: (){
                if (email == 'abc@123.com' && 
                    password == '123'){
                  Navigator.of(context).pushNamed('/home');
                  }
                  else{
                    print('incorreto');
                  }
              },
              child: Text('Login'),
              ),  
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}