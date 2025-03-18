import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statemanagement/EX-2-START-CODE/dto/post_dto.dart';
import 'package:statemanagement/EX-2-START-CODE/model/post.dart';
import 'package:statemanagement/EX-2-START-CODE/repository/post_repository.dart';

class HttpPostsRepository extends PostRepository {
  @override
  Future<List<Post>> getPost() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);

      List<PostDTO> postDTOs =
          jsonData.map((json) => PostDTO.fromJson(json)).toList();
      // Convert postDTO to post
      List<Post> posts = postDTOs.map((dto) => Post.fromDTO(dto)).toList();
      return posts;
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
