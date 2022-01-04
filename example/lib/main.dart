import 'package:flutter/material.dart';
import 'package:reloadly_flutter/reloadly_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ReloadlyAirtime reloadly;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeReloadly();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: initializeReloadly,
                child: Text('Reload'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  // reloadly.checkAccessTokenExpired();
                },
                child: Text('Check Token Expired'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initializeReloadly() {
    reloadly = ReloadlyAirtime(
      clientID: '7i37CaR8LCJl6f4oAiqccc5QMaylZpTa',
      clientSecret:
          'TgHOlJTylQ-7aLnrrsr5vgTjJJ3t7n-ukh0X1o0SlXUya4D9xZx3RenhwA5njnd',
    )..initialize();
  }
}
