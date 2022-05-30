import 'package:flutter/material.dart';
import 'package:flutter_crypto/data/constants/constant.dart';
import 'package:flutter_crypto/data/model/Crypto.dart';

import '../utility/getDataApi.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.cryptoList}) : super(key: key);
  List<Crypto>? cryptoList;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Crypto>? cryptoList;

  @override
  void initState() {
    super.initState();
    cryptoList = widget.cryptoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: _getAppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          color: greenColor,
          backgroundColor: blackColor,
          child: _getBodyCryptoList(),
          onRefresh: () async {
            List<Crypto> newList = await getDatApi();
            setState(() {
              cryptoList =newList;
            });
          },
        ),
      ),
    );
  }

  _getBodyCryptoList() => ListView.builder(
        itemCount: cryptoList!.length,
        itemBuilder: (context, index) => _getListCryptoItem(cryptoList![index]),
      );

  _getListCryptoItem(Crypto crypto) => ListTile(
        title: Text(
          crypto.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: greenColor),
        ),
        subtitle: Text(
          crypto.symbol,
          style: TextStyle(color: greyColor),
        ),
        leading: SizedBox(
          width: 30.0,
          child: Center(
            child: Text(
              crypto.rank.toString(),
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: greyColor),
            ),
          ),
        ),
        trailing: SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    crypto.priceUsd.toStringAsFixed(2),
                    style: TextStyle(color: greyColor, fontSize: 17),
                  ),
                  Text(
                    "${crypto.changePercent24Hr.toStringAsFixed(2)}%",
                    style: TextStyle(
                        color:
                            _getColorChangePercent(crypto.changePercent24Hr)),
                  ),
                ],
              ),
              SizedBox(
                  width: 50,
                  child: Center(
                      child: _getIconChangePercent(crypto.changePercent24Hr))),
            ],
          ),
        ),
      );

  Widget _getIconChangePercent(double percentChange) => percentChange <= 0
      ? Icon(
          Icons.trending_down,
          size: 24,
          color: redColor,
        )
      : Icon(
          Icons.trending_up,
          size: 24,
          color: greenColor,
        );

  Color _getColorChangePercent(double percentChange) =>
      percentChange <= 0 ? redColor : greenColor;

  _getAppBar() => AppBar(
        title: Text(
          'کیرپتو بازار',
          style: TextStyle(fontFamily: 'mr'),
        ),
        backgroundColor: blackColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      );
}
