import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/EX-1-START-CODE/providers/courses_provider.dart';
import 'package:statemanagement/EX-1-START-CODE/repository/courses_mock_repository.dart';
import 'package:statemanagement/EX-1-START-CODE/repository/courses_repository.dart';
import 'package:statemanagement/EX-1-START-CODE/screens/course_list_screen.dart';


CoursesRepository repository = CoursesMockRepository();
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CoursesProvider(coursesRepository: repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: CoursesListScreen(),
    );
  }
}
