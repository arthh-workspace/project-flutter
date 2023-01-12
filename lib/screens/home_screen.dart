import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Laravel Auth'),
      ),
      body: Center(
        child: Text('Home Sceen'),
      ),
      drawer: Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
        if (!auth.authenticated) {
          return ListView(
            children: [
              ListTile(
                title: Text('Login'),
                leading: Icon(Icons.login),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          );
        } else {
          return ListView(
            children: [
              DrawerHeader(
                // ignore: sort_child_properties_last
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      // backgroundImage: NetworkImage(auth.user.avatar),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${auth.user.username}',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${auth.user.nama}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          );
        }
      })),
    );
  }
}
