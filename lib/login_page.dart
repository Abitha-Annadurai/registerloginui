import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  static const item1 = <String>['Mobile', 'Telephone'];
  final List<DropdownMenuItem<String>> type1 = item1.map((String e) => DropdownMenuItem(value: e, child: Text(e))).toList();
  String? btn1;

  static const item2 = <String>['Gmail', 'Yahoo'];
  final List<DropdownMenuItem<String>> type2 = item2.map((String e) => DropdownMenuItem(value: e, child: Text(e))).toList();
  String? btn2;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.verified_outlined, color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 170,
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset("assets/images.png",),
                        height: 150,
                        width: screenWidth,
                      ),
                      Positioned(
                        bottom: 3,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                           // backgroundImage: AssetImage('assets/avatar.png'),
                            child: Icon(Icons.camera_alt, color: Colors.white,),
                          ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.person,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenWidth/1.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text('Name')
                          ),
                          controller: nameController,
                          validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Please Enter Name';
                          }
                          return null;
                          },),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.call,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenWidth/2.2,
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text('Phone Number')
                          ),
                          controller: nameController,
                          validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Please Enter Name';
                          }
                          return null;
                          },),
                      ),
                    ),
                    DropdownButton(
                        hint: Text('Phone Type'),
                        items: type1,
                        value: btn1,
                        onChanged: (String ? newValue){
                          if(newValue != null){
                            setState(() {
                              btn1 = newValue;
                            });
                          }
                        })
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.mail),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenWidth/2.2,
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text('Email')
                          ),
                          controller: nameController,
                          validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Please Enter Name';
                          }
                          return null;
                          },),
                      ),
                    ),
                    DropdownButton(
                        hint: Text('Email Type'),
                        items: type2,
                        value: btn2,
                        onChanged: (String ? newValue){
                          if(newValue != null){
                            setState(() {
                              btn2 = newValue;
                            });
                          }
                        })
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.place,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenWidth/1.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text('Address')
                          ),
                          controller: nameController,
                          validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Please Enter Name';
                          }
                          return null;
                          },),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.apartment,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenWidth/1.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              label: Text('Company')
                          ),
                          controller: nameController,
                          validator: (value) { if (value == null || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Please Enter Name';
                          }
                          return null;
                          },),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
