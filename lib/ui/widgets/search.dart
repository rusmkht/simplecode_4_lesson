import 'package:flutter/material.dart';
import 'package:flutter_simplecode_4_lesson/constants/app_colors.dart';
import 'package:flutter_simplecode_4_lesson/constants/app_styles.dart';
import 'package:flutter_simplecode_4_lesson/generated/l10n.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: AppStyles.s16w400,
              cursorColor: AppColors.mainText,
              decoration: InputDecoration(
                hintText: S.of(context).findPerson,
                hintStyle: AppStyles.s16w400.copyWith(
                  color: AppColors.neutral2,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                  horizontal: 18.0,
                ),
                filled: true,
                fillColor: AppColors.neutral1,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 25,
                  color: AppColors.neutral2,
                ),
                suffixIcon: const Icon(
                  Icons.filter_list_alt,
                  size: 25,
                  color: AppColors.neutral2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

