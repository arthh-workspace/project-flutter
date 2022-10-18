import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: txtUsername,
                  decoration: InputDecoration(hintText: "Masukkan Username"),
                ),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Masukkan Password"),
                ),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Color(0xffF18265)),
                  onPressed: () {
                    this._doLogin();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffffffff)
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _doLogin() async{
    if(txtUsername.text.isEmpty||txtPassword.text.isEmpty){
      Alert(context: context,title: "data tidak benar", type: AlertType.error).show();
      return;
    }
    final response = await http.post('http://project.test/api/login', body: 
    {
      'username':txtUsername.text,
      'password':txtPassword.text
    });
    if(response.statusCode == 201){
      Alert(context: context, title: "login berhasil", type: AlertType.success).show();
    }else{
      Alert(context: context, title: "login gagal", type: AlertType.error).show();
    }
  }
}
