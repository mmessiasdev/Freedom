import '../model/post.dart';
import '../repository/repositories.dart';

class PostsController {
  PostsController(this._repositories);
  final Repositories _repositories;

  //get
  Future<List<Attributes>> fetchPostsList() async {
    return _repositories.getPostsList();
  }
}
