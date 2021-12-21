import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:women_safety/screens/homepage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _username = TextEditingController();
final _phonenumber = TextEditingController();
final _firstphonenumber = TextEditingController();
final _secondphonenumber = TextEditingController();
final _thirdphonenumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Text('Women',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(width: 8.0,),
          Text('Safety',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),),
        ],),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Register',style: TextStyle(fontSize: 30.0),),
              ),
            ),
            const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _username,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _phonenumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _firstphonenumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your parent number 1',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _secondphonenumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your parent number 2',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _thirdphonenumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your parent number 3',
                ),
              ),
            ),
            const SizedBox(height: 30.0,),
            ElevatedButton(onPressed: () async{
      
              var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://10.0.2.2:3000/user/register'));
      request.body = json.encode({
        "username": _username.text,
        "password": _passwordController.text,
        "email": _emailController.text,
        "phonenumber": _phonenumber.text,
        "firstphonenumber": _firstphonenumber.text,
        "secondphonenumber": _secondphonenumber.text,
        "thirdphonenumber": _thirdphonenumber.text,
      });
      request.headers.addAll(headers);
      
      http.StreamedResponse response = await request.send();
      
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Navigator.push(
                    context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                            );
      }
      else {
        print(response.reasonPhrase);
      }
      
      
      
      
            }, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}