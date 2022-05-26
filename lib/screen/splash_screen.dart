import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/model/Crypto.dart';
import 'package:flutter_crypto/screen/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print('initState');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Center(
          child: SpinKitSpinningLines(color: Colors.white),
        ),
      ),
    );
  }

  void getData() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject));
    print(cryptoList);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(
          cryptoList: cryptoList,
        ),
      ),
    );
  }
}
