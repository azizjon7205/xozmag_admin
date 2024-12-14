import 'package:flutter/material.dart';
import '../../core/styles/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.width = double.infinity, this.height = 48, required this.widget, this.onTap});
  final double height;
  final double? width;
  final Widget widget;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 0),
                  color: colors(context).primary
              ),
              const BoxShadow(
                  blurRadius: 2,
                  offset: Offset(0, 1),
                color: Color(0x3D0E121B)
              ),
            ]
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color: colors(context).primary,
              ),
            ),

            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.12), // Start gradient with 12% opacity
                    Colors.white.withOpacity(0.0),  // End gradient with 0% opacity
                  ],
                ).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white, // Set the color to white, gradient is applied by ShaderMask
                    width: 1, // Stroke width
                  ),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colors(context).white.withOpacity(0.16),
                      colors(context).white.withOpacity(0)
                    ]),
              ),
              child: Center(
                child: widget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
