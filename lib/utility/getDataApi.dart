import 'package:dio/dio.dart';

import '../data/model/Crypto.dart';

Future<List<Crypto>> getDatApi() async {
  var response = await Dio().get('https://api.coincap.io/v2/assets');
  List<Crypto> cryptoList = response.data['data']
      .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
      .toList();
  return cryptoList;
}
