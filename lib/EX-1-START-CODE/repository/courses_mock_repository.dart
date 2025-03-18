import 'package:statemanagement/EX-1-START-CODE/models/course.dart';
import 'package:statemanagement/EX-1-START-CODE/repository/courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {
  @override
  List<Course> getCourses() {
    return [
      Course(name: 'HTML'),
      Course(name: 'java'),
      Course(name: 'FLUTTER'),
    ];
  }

  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }
}
