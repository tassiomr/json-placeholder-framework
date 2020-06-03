import 'package:flutter/material.dart';
import 'package:framework_desafio/blocs/posts.bloc.dart';
import 'package:framework_desafio/models/post.dart';
import 'package:framework_desafio/ui/widgets/posts.widget.dart';

class PostsList extends StatefulWidget {
  PostsList();

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllPosts(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: bloc.allPosts,
      builder: (context, AsyncSnapshot<Post> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Widget buildList(AsyncSnapshot<Post> snapshot) {
    return RefreshIndicator(
      onRefresh: () => bloc.fetchAllPosts(true),
      child: ListView.builder(
          itemCount: snapshot.data.posts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostWidget(snapshot.data.posts[index]);
          }),
    );
  }
}
