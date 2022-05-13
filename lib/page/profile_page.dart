import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /* String fullName = "";
  String address = "";
  bool darkMode = false;
  int gender = 1; */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getDataFull();
  }

  /*  _getDataFull() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    fullName = prefs.getString("fullName") ?? "";
    address = prefs.getString("address") ?? "";
    darkMode = prefs.getBool("darkMode") ?? false;
    gender = prefs.getInt("gender") ?? 1;
    setState(() {});
  } */

  // llamamos una instacia del singlenton Sharedpreference:
  SPGlobal sharedPreferencesGlobal = SPGlobal();
  // luego lo llamamos directamente para cargar la data guardada:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            sharedPreferencesGlobal.darkMode ? Colors.black : Colors.pinkAccent,
        title: Text("Profile"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white30.withOpacity(0.2),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(sharedPreferencesGlobal.fullName),
                subtitle: Text("Full name"),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(sharedPreferencesGlobal.address),
                subtitle: Text("Address"),
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text(
                    sharedPreferencesGlobal.darkMode == true ? "on" : "off"),
                subtitle: Text("Dark mode"),
              ),
              ListTile(
                leading: Icon(Icons.circle),
                title: Text(
                    sharedPreferencesGlobal.gender == 1 ? "Male" : "Female"),
                subtitle: Text("Gender"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
