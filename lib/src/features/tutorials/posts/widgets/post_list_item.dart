import 'package:flutter/material.dart';
import 'package:the_hermitage_community/src/features/tutorials/posts/models/models.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${post.id}'),
        ),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}
