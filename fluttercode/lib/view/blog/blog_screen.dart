import 'package:Freedom/component/colors.dart';
import 'package:Freedom/component/header.dart';
import 'package:Freedom/component/texts.dart';
import 'package:Freedom/const.dart';
import 'package:Freedom/controller/posts.dart';
import 'package:Freedom/model/post.dart';
import 'package:Freedom/repository/posts.dart';
import 'package:Freedom/view/blog/components/postcontainer.dart';
import 'package:flutter/material.dart';

import 'blog_post.dart';

//ignore: must_be_immutable
class BlogPage extends StatefulWidget {
  const BlogPage();

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  var fetchPosts = PostsController(PostsRepository());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader(),
        Expanded(
          child: ListView(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryText(
                        text: 'Blog',
                        color: TerciaryColor,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SecundaryText(
                            text: 'O que aconteceu?',
                            color: TerciaryColor,
                            align: TextAlign.start),
                        SubText(
                            text: 'N??s queremos saber!',
                            color: OffColor,
                            align: TextAlign.start),
                      ],
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.note_add,
                        size: 27,
                      ),
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => ContainerPost(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: FutureBuilder<List<Attributes>>(
                    future: fetchPosts.fetchPostsList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var renders = snapshot.data![index];
                                print(renders.content.toString());
                                if (renders != null) {
                                  return Column(
                                    children: [
                                      Center(
                                          child: PostContainer(
                                        content: renders.content.toString(),
                                      )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }
                                return SizedBox(
                                  child: Center(
                                    child: Text('N??o encontrado'),
                                  ),
                                );
                              }),
                        );
                      }
                      return SizedBox(
                        child: Center(
                          child: Text('Not Found'),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}