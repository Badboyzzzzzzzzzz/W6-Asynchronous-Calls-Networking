import 'package:statemanagement/EX-2-START-CODE/dto/post_dto.dart';

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });


// Convert from Post dto to post model
  factory Post.fromDTO(PostDTO dto) {
    return Post(
      id: dto.id,
      userId: dto.userId,
      title: dto.title,
      body: dto.body,
    );
  }
}
