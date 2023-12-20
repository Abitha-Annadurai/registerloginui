import 'package:flutter/material.dart';
import 'login_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String? gender;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                //full name
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Full Name')
                  ),
                  controller: nameController,
                  validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please Enter Name';
                  }
                  return null;
                  },),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text('Username')
                  ),
                  controller: nameController,
                  validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please Enter Name';
                  }
                  return null;
                  },),

                //email
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Email')
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),

                //password
                TextFormField(
                  decoration: InputDecoration(
                      label: Text('Password')
                  ),
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text('Re-type Password')
                  ),
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                Text('Gender',  style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: "male",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  Text('Female')
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "female",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  Text('Male')
                ],
              ),
            ],
          ),

                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      }
                    },
                    child: Text('Register'.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text('Register with facebook'.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,),
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Login'.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
