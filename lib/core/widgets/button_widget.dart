import 'package:codesroots/core/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onTap,
      required this.textColor,
      required this.text,
      required this.buttonColor,
      this.isLoading = false,
      this.isDisable = false
      });

  final VoidCallback onTap;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final bool isLoading;
 final bool isDisable;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      height: 50,
      
      decoration: BoxDecoration(
        color: isDisable ? Colors.grey : buttonColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextButton(
        onPressed:  onTap,
        child: TextWidget(
            title:    text,
                color: textColor,
                fontSize: 20,),
              ),
              
     
    );
  }
}