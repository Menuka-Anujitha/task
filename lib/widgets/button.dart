import 'package:flutter/material.dart';
import 'package:nba_highlights/utils/colors.dart';
import 'package:nba_highlights/utils/text_styles.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const Button({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            fixedSize: const Size.fromHeight(60),
            backgroundColor: AppColors.kPrimaryColor,
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyles.appButton,
          ),
        ),
      ),
    );
  }
}
