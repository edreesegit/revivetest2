// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KneeExtensionsExercisePage extends StatelessWidget {
  final String exerciseName;

  KneeExtensionsExercisePage({Key? key, required this.exerciseName})
      : super(key: key);

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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    exerciseName,
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Directions:',
                              style: GoogleFonts.raleway(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '1) Sit in a chair with your feet flat on the ground and your knees bent at a 90-degree angle.',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '2) Lift your right leg straight out in front of you, keeping your foot flexed.',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '3) Hold your leg in this position for a few seconds, then slowly lower it back down.',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '4) Remember to keep your movements slow and controlled, and to breathe regularly throughout the exercise.',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              ExerciseButton(
                exerciseName: exerciseName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseButton extends StatefulWidget {
  final String exerciseName;

  ExerciseButton({Key? key, required this.exerciseName}) : super(key: key);

  @override
  _ExerciseButtonState createState() => _ExerciseButtonState();
}

class _ExerciseButtonState extends State<ExerciseButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
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
        // TODO: Implement begin exercise functionality
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isTapped ? 85 : 80,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Begin ${widget.exerciseName}',
                  style: GoogleFonts.raleway(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
