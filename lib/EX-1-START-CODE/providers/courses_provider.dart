import 'package:flutter/material.dart';
import 'package:statemanagement/EX-1-START-CODE/models/course.dart';
import 'package:statemanagement/EX-1-START-CODE/repository/courses_repository.dart';

class CoursesProvider extends ChangeNotifier {
  List<Course> _courses = [];
  final CoursesRepository coursesRepository;
  CoursesProvider({required this.coursesRepository}) {
    fetchCourses();
  }

  List<Course> get courses => _courses;
  void fetchCourses() {
    _courses = coursesRepository.getCourses();
    notifyListeners();
  }

  Course? getCourse(String courseId) {
    return _courses.firstWhere((c) => c.name == courseId);
  }

  void addScore(String courseId, CourseScore score) {
    Course? course = getCourse(courseId);
    if (course != null) {
      coursesRepository.addScore(course, score);
      notifyListeners();
    }
  }
}
