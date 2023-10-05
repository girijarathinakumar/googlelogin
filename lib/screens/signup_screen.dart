import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String name;
  late String email;
  late String password;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/login.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hello! Signup to get started",
                style: TextStyle(
                    fontFamily: "Pacifico",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    name = value;
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Edu_SA_Beginner",
                      fontWeight: FontWeight.normal),
                  cursorColor: Colors.black,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      focusedBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.black)),
                      labelText: "Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      fontSize: 15,
                      color:Colors.black,
                      fontFamily: "Edu_SA_Beginner",
                      fontWeight: FontWeight.normal),
                  cursorColor: Colors.black,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      focusedBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  obscureText: _passwordVisible,
                  onChanged: (value) {
                    password = value;
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Edu_SA_Beginner",
                      fontWeight: FontWeight.normal),
                  cursorColor: Colors.black,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      focusedBorder:  const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off_sharp,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      suffixIconColor: Colors.black,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () async {
                      try {
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                      } catch (e) {
                        print(e);
                      }

                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontFamily: "Courgette",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              )

            ],
          ),
        ),
      ),
    );
  }
}
