import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/data/model/Crypto.dart';
import 'package:flutter_crypto/screen/home_screen.dart';
import 'package:flutter_crypto/utility/getDataApi.dart';
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/logo.png')),
          SpinKitSpinningLines(
            color: Colors.white,
            size: 40,
          ),
        ],
      )),
    );
  }

  void getData() async {
    List<Crypto> cryptoList = await getDatApi();
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(
          cryptoList: cryptoList,
        ),
      ),
    );
  }
}
