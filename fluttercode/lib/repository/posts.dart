import 'dart:convert';

import 'package:Freedom/repository/repositories.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
import '../model/post.dart';

class PostsRepository implements Repositories {
  late Attributes product;

  @override
  Future<String> deletePosts() {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<List<Attributes>> getPostsList() async {
    // TODO: implement getPostsList
    List<Attributes> listItens = [];
    var url = Uri.parse('$baseUrl/api/posts?populate=*');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = jsonDecode(response.body);
    // parse
    var itemCount = body["data"];
    print(itemCount);
    for (var i = 0; i < itemCount.length; i++) {
      listItens.add(Attributes.fromJson(itemCount[i]));
    }
    return listItens;
  }

  @override
  Future<String> patchPosts() {
    // TODO: implement patchPosts
    throw UnimplementedError();
  }

  @override
  Future<String> postPosts() {
    // TODO: implement postPosts
    throw UnimplementedError();
  }
  
  @override
  Future<String> putPosts() {
    // TODO: implement putPosts
    throw UnimplementedError();
  }

  // @override
  // Future<String> putPosts() async {
  //   // TODO: implement putPosts
  //   var url = Uri.parse('$baseUrl/api/posts?populate=*');
  //   String resData = '';
  //   await http.put(url, body: {
  //     'quantity': (product.quantity!).toString(),
  //   }).then(
  //     (value) {
  //       Map<String, dynamic> result = json.decode(value.body);
  //       print(result);
  //       return resData = result['quantity'];
  //     },
  //   );
  //   return resData;
  // }
}