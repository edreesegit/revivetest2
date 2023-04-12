// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revivetest2/homepages/exercisedetailpages/exercisecalibrationpages/squats_calibration_page.dart';

class SquatsExercisePage extends StatelessWidget {
  final String exerciseName;

  SquatsExercisePage({Key? key, required this.exerciseName}) : super(key: key);

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Directions:',
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen[900],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '• Stand with your feet shoulder-width apart and your toes pointing slightly outward.',
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen[800],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '• Keep your chest up, engage your core, and look straight ahead',
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen[800],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '• Lower your hips back and down as if you are sitting in a chair.',
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen[800],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '• Keep your knees in line with your toes and your weight on your heels.',
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen[800],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '• Stop when your thighs are parallel to the ground or lower, then push up through your heels to return to the starting position.',
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen[800],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '• Remember to keep your movements slow and controlled, and to breathe regularly throughout the exercise.',
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreen[800],
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
  final bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SquatsCalibration()),
        );
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

class CalibrationButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isTapped;

  const CalibrationButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.isTapped,
  }) : super(key: key);

  @override
  _CalibrationButtonState createState() => _CalibrationButtonState();
}

class _CalibrationButtonState extends State<CalibrationButton> {
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    _isTapped = widget.isTapped;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: _isTapped ? 85 : 80,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _isTapped = !_isTapped;
              widget.onPressed();
            });
          },
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.buttonText,
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
      ),
    );
  }
}
