import 'package:flutter/material.dart';
import 'package:flutter_crypto/model/Crypto.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.cryptoList}) : super(key: key);
  List<Crypto>? cryptoList;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("widget.cryptoList![0].name"),
        ),
      ),
    );
  }
}
