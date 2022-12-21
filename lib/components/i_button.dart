import 'package:flutter/material.dart';
import 'custom_colors.dart';

class IButton extends StatelessWidget {

  final String text;
  final double width;
  final Function onPressed;
  final List<Color> colors;
  final Color textColor;
  final bool isLoading;

  const IButton({super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.isLoading = false,
    this.textColor = CustomColors.white,
    this.colors = const [
      CustomColors.colorPrimaryLight,
      CustomColors.colorPrimary,
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0],
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Visibility(
              visible: !isLoading,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize:
                  MaterialStateProperty.all(Size(width, 50)),
                  backgroundColor:
                  MaterialStateProperty.all(Colors.transparent),
                  // elevation: MaterialStateProperty.all(3),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  onPressed();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
            if (isLoading)
              const SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  color: CustomColors.white,
                  strokeWidth: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
