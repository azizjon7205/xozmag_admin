import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/app_theme.dart';
import '../../core/styles/colors/palette_tokens.dart';

class SvgGradient extends StatelessWidget {
  const SvgGradient({super.key, required this.svgImage});

  final String svgImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    PaletteTokens.neutral500.withOpacity(0.1),
                    PaletteTokens.neutral500.withOpacity(0),
                  ],
                ),
            ),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  PaletteTokens.neutral500.withOpacity(0.16),
                  // Start gradient with 12% opacity
                  PaletteTokens.neutral500.withOpacity(0.0),
                  // End gradient with 0% opacity
                ],
              ).createShader(bounds);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                border: Border.all(
                  color: Colors.white,
                  // Set the color to white, gradient is applied by ShaderMask
                  width: 1, // Stroke width
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: colors(context).bgWhite,
                shape: BoxShape.circle,
                border:
                Border.all(color: colors(context).strokeSoft)),
            child: SvgPicture.asset(
              svgImage,
              colorFilter: ColorFilter.mode(
                colors(context).iconSub,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
    );
  }
}
