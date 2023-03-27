// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revivetest2/homepages/exercisedetailpages/heel_slides_exercise_page.dart';
import 'package:revivetest2/homepages/exercisedetailpages/knee_extensions_page.dart';
import 'package:revivetest2/homepages/exercisedetailpages/squats_exercise_page.dart';
import 'package:revivetest2/pages/get_user_name.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              GetUserName(),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Choose Your Exercise:',
                  style: GoogleFonts.raleway(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExerciseBox(
                        exerciseName: 'Squats',
                        color: Colors.lightGreen,
                      ),
                      SizedBox(height: 20),
                      ExerciseBox(
                        exerciseName: 'Heel Slides',
                        color: Colors.lightGreen,
                      ),
                      SizedBox(height: 20),
                      ExerciseBox(
                        exerciseName: 'Knee Extensions',
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseBox extends StatefulWidget {
  final String exerciseName;
  final Color color;

  ExerciseBox({required this.exerciseName, required this.color});

  @override
  _ExerciseBoxState createState() => _ExerciseBoxState();
}

class _ExerciseBoxState extends State<ExerciseBox> {
  bool _isTapped = false;

  void _navigateToExerciseDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (widget.exerciseName) {
            case 'Squats':
              return SquatsExercisePage(
                exerciseName: 'Squats',
              );
            case 'Heel Slides':
              return HeelSlidesExercisePage(
                exerciseName: 'Heel Slides',
              );
            case 'Knee Extensions':
              return KneeExtensionsExercisePage(
                exerciseName: 'Knee Extensions',
              );
            default:
              return SquatsExercisePage(
                exerciseName: 'Squats',
              );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    IconData exerciseIcon;
    switch (widget.exerciseName) {
      case 'Squats':
        exerciseIcon = Icons.fitness_center;
        break;
      case 'Heel Slides':
        exerciseIcon = Icons.directions_run;
        break;
      case 'Knee Extensions':
        exerciseIcon = Icons.accessibility;
        break;
      default:
        exerciseIcon = Icons.fitness_center;
    }

    return InkWell(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        _navigateToExerciseDetails();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isTapped ? 85 : 80,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                exerciseIcon,
                color: Colors.white,
                size: 30,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.exerciseName,
                  style: GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.play_circle_filled,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
