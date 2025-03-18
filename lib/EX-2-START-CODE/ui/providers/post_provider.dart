import 'package:flutter/material.dart';
import 'package:statemanagement/EX-2-START-CODE/repository/http_posts_repository.dart';

import '../../model/post.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final HttpPostsRepository _repository;

  AsyncValue<List<Post>>? postValue;

  PostProvider({repository}) : _repository = repository;

  void fetchPost(int postId) async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
      List<Post> posts = await _repository.getPost();
      // 3  Set success state
      postValue = AsyncValue.success(posts);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
