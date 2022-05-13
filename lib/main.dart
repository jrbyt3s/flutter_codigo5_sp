import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/page/counter_page.dart';
import 'package:flutter_codigo5_sp/page/home_page.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';

void main() async {
  //Es importante agregar estas 2 lineas para usar el share preference de manera global:
  WidgetsFlutterBinding();
  SPGlobal sharedPreferences = SPGlobal();
  await sharedPreferences.initShared();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
