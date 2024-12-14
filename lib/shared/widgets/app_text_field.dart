import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/spaced_column.dart';
import '/shared/widgets/spaced_row.dart';
import 'sizes.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      this.controller,
      this.hint,
      this.label,
      this.subLabel,
      this.prefixIconSvgPath,
      this.keyboardType,
      this.contentPadding,
      this.maxLines = 1,
        this.suffix,
      this.isRequired = false,
        this.isReadOnly = false,
        this.isDisabled = false,
      this.obscureText = false,
        this.suffixMaxHeight,
      this.helperText});

  final TextEditingController? controller;
  final String? label;
  final bool isRequired;
  final String? subLabel;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;
  final String? hint;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixIconSvgPath;
  final Widget? suffix;
  final double? suffixMaxHeight;
  final String? helperText;
  final bool isReadOnly;
  final bool isDisabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool hideText;

  @override
  void initState() {
    hideText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(mainAxisSize: MainAxisSize.min, spacing: 4, children: [
      if (widget.label != null)
        SpacedRow(
          spacing: 1,
          children: [
            Text(
              widget.label!,
              style: AppTextStyles.labelSmall
                  .copyWith(color: colors(context).textStrong),
            ),
            if (widget.isRequired)
              Text(
                '* ',
                style: AppTextStyles.labelSmall
                    .copyWith(color: colors(context).primary),
              ),
            if (widget.subLabel != null)
              Text(
                widget.subLabel!,
                style: AppTextStyles.paragraphSmall
                    .copyWith(color: colors(context).textSub),
              ),
          ],
        ),
      TextFormField(
        controller: widget.controller,
        style: AppTextStyles.paragraphSmall.copyWith(
          color: colors(context).textStrong,
        ),
        obscureText: hideText,
        readOnly: widget.isReadOnly || widget.isDisabled,
        cursorColor: colors(context).primary,
        keyboardType: widget.keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          hintText: widget.hint,
          hintStyle: AppTextStyles.paragraphSmall.copyWith(
            color: widget.isDisabled ? colors(context).textDisabled : colors(context).textSoft,
          ),
          filled: widget.isDisabled,
          fillColor: widget.isDisabled ? colors(context).bgWeak : null,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 48, maxWidth: 48),
          prefixIcon: widget.prefixIconSvgPath != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                    widget.prefixIconSvgPath!,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                        colors(context).iconSoft, BlendMode.srcIn),
                  ),
                )
              : null,
          suffixIconConstraints: BoxConstraints(maxHeight: widget.suffixMaxHeight ?? 48),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    hideText ? Icons.visibility : Icons.visibility_off,
                    color: colors(context).iconSoft,
                  ),
                  onPressed: () {
                    setState(() {
                      hideText = !hideText;
                    });
                  },
                )
              : widget.suffix,
          enabled: !widget.isDisabled
        ),
      ),
      if (widget.helperText != null)
        Row(
          children: [
            Icon(
              Icons.info,
              size: 16,
              color: colors(context).iconSoft,
            ),
            const Width(4),
            Expanded(
              child: Text(
                widget.helperText!,
                style: AppTextStyles.paragraphXSmall
                    .copyWith(color: colors(context).textSub,
                ),
              ),
            )
          ],
        )
    ]);
  }
}
