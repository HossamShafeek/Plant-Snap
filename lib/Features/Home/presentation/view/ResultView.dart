
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_snap/Features/Home/presentation/widgets/Result_View_Body.dart';
class ResultView extends StatelessWidget {
  const ResultView({super.key,
    required this.imagePath,
    required this.prediction,
    required this.confidence
  });
  final File imagePath;
  final String prediction;
  final double confidence;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ResultViewBody(
        confidence:confidence ,
        imagePath: imagePath,
        prediction:prediction ,
      ),
    );
  }
}
