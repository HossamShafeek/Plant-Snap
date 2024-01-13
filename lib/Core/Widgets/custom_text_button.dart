import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,
    required this.function,
    required this.size,
    required this.widget
  });

  final Function function;
  final double size;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: (){
        function();
      },
      child: widget,
    );
  }
}