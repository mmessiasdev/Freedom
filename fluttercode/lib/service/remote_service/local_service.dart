import 'dart:convert';
import 'package:Freedom/model/locals.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';

Future<List<Attributes>> getLocalList() async {
  // TODO: implement getPostsList
  List<Attributes> listItens = [];
  var url = Uri.parse('$baseUrl/api/places');
  var response = await http.get(url);
  print('status code : ${response.statusCode}');
  var body = jsonDecode(response.body);
  // parse
  var itemCount = body["data"];
  for (var i = 0; i < itemCount.length; i++) {
    listItens.add(Attributes.fromJson(itemCount[i]));
  }
  print(itemCount);

  return listItens;
}
