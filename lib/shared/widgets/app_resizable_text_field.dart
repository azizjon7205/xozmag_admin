import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xozmag_admin/shared/widgets/sizes.dart';

import '/core/styles/app_text_styles.dart';
import '/core/styles/app_theme.dart';
import '/shared/widgets/spaced_column.dart';
import '/shared/widgets/spaced_row.dart';

class AppResizableTextField extends StatefulWidget {
  const AppResizableTextField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.subLabel,
    this.prefixIconSvgPath,
    this.keyboardType,
    this.contentPadding,
    this.isRequired = false,
    this.isDense = false,
    this.obscureText = false, this.helperText
  });


  final TextEditingController? controller;
  final String? prefixIconSvgPath;
  final String? hint;
  final String? label;
  final String? subLabel;
  final String? helperText;
  final bool isRequired;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<AppResizableTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppResizableTextField> {

  late bool hideText;

  @override
  void initState() {
    hideText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
        mainAxisSize: MainAxisSize.min,
        spacing: 4, children: [
      if (widget.label != null)
        SpacedRow(
          spacing: 1,
          children: [
            Text(
              widget.label!,
              style: AppTextStyles.labelSmall.copyWith(
                    color: colors(context).textStrong,
                  ),
            ),
            if (widget.isRequired)
              Text(
                '* ',
                style: AppTextStyles.labelSmall.copyWith(
                      color: colors(context).primary,
                    ),
              ),
            if (widget.subLabel != null)
              Text(
                widget.subLabel!,
                style: AppTextStyles.paragraphSmall.copyWith(
                      color: colors(context).textSub,
                    ),
              ),
          ],
        ),
      Container(
        height: 100,
        child: TextFormField(
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
          controller: widget.controller,
          style: AppTextStyles.paragraphSmall.copyWith(
                color: colors(context).textStrong,
              ),
          obscureText: hideText,
          cursorColor: colors(context).primary,
          keyboardType: widget.keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: InputDecoration(
            isDense: widget.isDense,
            contentPadding: widget.contentPadding,
            hintText: widget.hint,
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
            suffixIcon: widget.obscureText ? IconButton(
              icon: Icon(
                hideText ? Icons.visibility : Icons.visibility_off,
                color: colors(context).iconSoft,
              ),
              onPressed: () {
                setState(() {
                  hideText = !hideText;
                });
              },
            ) : null,
          ),
        ),
      ),
      if (widget.helperText != null) Row(
        children: [
          Icon(Icons.info, size: 16, color: colors(context).iconSoft,),
          const Width(4),
          Text(widget.helperText!, style: AppTextStyles.paragraphXSmall.copyWith(
              color: colors(context).textSub
          ),)
        ],
      )
    ]);
  }
}
