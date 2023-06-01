import 'dart:convert';

import 'package:engaged/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as apicall;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<PostModel>> getPosts() async {
    var uri = Uri.parse("https://dummyjson.com/posts");

    var response = await apicall.get(uri);
    List<PostModel> posts = [];
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var jsonDataList = jsonData['posts'] as Iterable;
      for (var i in jsonDataList) {
        posts.add(PostModel.fromJson(i));
      }
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Engaged"),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final siglePost = snapshot.data![index];
                  return Column(
                    children: [
                      Container(
                        color: Colors.black12,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://logowik.com/content/uploads/images/flutter5786.jpg'),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Text(
                                      siglePost.title!,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Text(
                                      siglePost.userId!.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert_outlined))
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            siglePost.body!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 7),
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )),
                                  Text(siglePost.reactions!.toString()),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.emoji_emotions,
                                          color: Colors.yellow.shade700,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.face,
                                          color: Colors.yellow.shade700,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.mood_bad,
                                          color: Colors.yellow.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    siglePost.tags!.toString(),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
