import '../model/post.dart';

abstract class Repositories {
  //get
  Future<List<Attributes>> getPostsList();

  //post
  Future<String> postPosts();

  //put
  Future<String> putPosts();

  //patch
  Future<String> patchPosts();

  //delete
  Future<String> deletePosts();
}
