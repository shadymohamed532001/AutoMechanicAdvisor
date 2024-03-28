import 'package:flutter/material.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.dropdownColor,
    this.icon,
    this.iconSize,
    this.padding,
  });

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final Color? dropdownColor;
  final IconData? icon;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      items: items,
      validator: validator,
      icon: icon != null
          ? Icon(icon, size: iconSize, color: ColorManager.primaryColor)
          : null,
      dropdownColor: dropdownColor ?? ColorManager.whiteColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.darkGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((DropdownMenuItem<T> item) {
          return Padding(
            padding: padding ?? EdgeInsets.zero,
            child: item,
          );
        }).toList();
      },
    );
  }
}
