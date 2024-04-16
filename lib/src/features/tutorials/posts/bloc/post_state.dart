import 'package:equatable/equatable.dart';
import 'package:the_hermitage_community/src/features/tutorials/posts/posts.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.hasReachedMax = false,
    this.posts = const <Post>[],
  });

  final PostStatus status;
  final bool hasReachedMax;
  final List<Post> posts;

  // create a copywith
  PostState copyWith({
    PostStatus? status,
    bool? hasReachedMax,
    List<Post>? posts,
  }) {
    return PostState(
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      posts: posts ?? this.posts,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, hasReachedMax, posts];
}
