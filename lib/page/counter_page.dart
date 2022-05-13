import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNumber();
  }

  _saveData(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", value);
    print(prefs.getInt("counter") ?? 0);
  }

  _getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _counter = prefs.getInt("counter") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++;
          _saveData(_counter);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "Presiona el botón para subir el contador!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
