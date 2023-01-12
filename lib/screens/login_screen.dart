import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController.text = 'mahasiswa';
    _passwordController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 200, left: 30, right: 30, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Selamat Datang",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Sistem Informasi Penilaian",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                  Text("Kesesuaian Pelaksanaan Perkuliahan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kini survey bisa dilakukan kapan saja dan dimana saja secara online tanpa perlu kertas",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            Container(
              height: 310,
              width: 330,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding: EdgeInsets.only(left: 40, top: 60, right: 30, bottom: 0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          controller: _usernameController,
                          validator: (value) => value.isEmpty
                              ? 'please enter valid email'
                              : null),
                      TextFormField(
                          controller: _passwordController,
                          validator: (value) =>
                              value.isEmpty ? 'please enter password' : null),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            minimumSize: Size(80, 40),
                            backgroundColor: Colors.blue),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Map creds = {
                            'username': _usernameController.text,
                            'password': _passwordController.text,
                            'device_name': 'mobile',
                          };
                          if (_formKey.currentState.validate()) {
                            try {
                              Provider.of<Auth>(context, listen: false)
                                  .login(creds: creds);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            } catch (e) {
                              print(e);
                            }
                            try {
                              Provider.of<Auth>(context, listen: false)
                                  .login(creds: creds);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
