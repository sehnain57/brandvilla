import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';
import 'app_text.dart';

class CustomDropDown extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? hintText;
  final String? selectedValue;
  final double? height;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Color? bgColor;

  const CustomDropDown({
    super.key,
    required this.items,
    this.selectedValue,
    this.onSaved,
    this.hintText,
    this.onChanged,
    this.height,
    this.contentPadding,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: DropdownButtonFormField2<String>(
          isExpanded: true,
          style: GoogleFonts.figtree(fontSize: 15, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: contentPadding,
            border: InputBorder.none,
          ),
          hint: AppText(text: hintText ?? "", fontSize: 15),
          items: items,
          validator: (value) {
            if (value == null) {
              return 'Please select a value.';
            }
            return null;
          },
          onChanged: onChanged,
          onSaved: onSaved,
          buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.only(right: 8, left: 4),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(4))),
          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.black,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}

class CustomDropDownBorder extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? hintText, labelText;
  final String? selectedValue;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  const CustomDropDownBorder({
    super.key,
    required this.items,
    this.selectedValue,
    this.onSaved,
    this.hintText,
    this.onChanged,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12),
          // contentPadding: EdgeInsets.only(top: 1.3.h),
          // fillColor:AppColors.secondryColor.withOpacity(0.1),
          // filled: true,
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(fontSize: 12),
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
        hint: AppText(
          text: hintText ?? "",
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        items: items,
        validator: (value) {
          if (value == null) {
            return 'Please select a value.';
          }
          return null;
        },
        onChanged: onChanged,
        onSaved: onSaved,
        buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.only(right: 8, left: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8))),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}


class CustomDropDownShadow extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? hintText, labelText;
  final String? selectedValue;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const CustomDropDownShadow({
    super.key,
    required this.items,
    this.selectedValue,
    this.onSaved,
    this.hintText,
    this.onChanged,
    this.labelText, this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: contentPadding ?? EdgeInsets.only(left: 12),
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(fontSize: 12),
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
        ),
        hint: AppText(
          text: hintText ?? "",
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        items: items,
        validator: (value) {
          if (value == null) {
            return 'Please select a value.';
          }
          return null;
        },
        onChanged: onChanged,
        onSaved: onSaved,
        buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.only(right: 8, left: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8))),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}