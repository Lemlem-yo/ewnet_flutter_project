import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController  _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12A19A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SvgPicture.asset(
                  "assets/images/4kilo_title.svg",
                  height: 50,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                         controller: _name,
                        onChanged: (_name) {
                          setState(() {
                            _name = _name;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Name"),
                          hintText: 'Enter your name',
                          hintStyle: const TextStyle(
                            color: Color(0xFF12A19A),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color:Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _email,
                        onChanged: (_email) {
                          setState(() {
                            _email = _email;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Color(0xFF12A19A),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phonNumber ,
                        onChanged: (_phoneNumber) {
                          setState(() {
                            _phonNumber = _phonNumber;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("phone number"),
                          hintText: 'Enter phone number',
                          hintStyle: const TextStyle(
                            color: Color(0xFF12A19A),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                          print("register");
                        },
                        child: const Text('Notify Me',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF12A19A)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRect(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text('Follow us on social media:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Add your Facebook link here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {
                          // Add your Email link here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.link),
                        onPressed: () {
                          // Add your LinkedIn link here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
   //
    String name = _name.text;
    String email = _email.text;
    String phoneNumber = _phonNumber.text;
    //

    String apiUrl = 'http://127.0.0.1:3000/signup';
    // construct the user data
    Map<String, String> userData = {
      'name': name,
      'email': email,
      'phoneNUmber': phoneNumber
    };
    //Convert the user data to the JSON file
    String jsonData = jsonEncode(userData);
    //
    try{
      //Make a post request to the nestjs API
      var response = await http.post(
        Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
        body: jsonData
      );
    }catch(error){
      print('Error submitting form: $error');
    }


  }
}
