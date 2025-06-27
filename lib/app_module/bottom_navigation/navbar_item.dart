import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serenity_space/utils/fonts/app_fonts.dart';
import 'package:serenity_space/widegts/custom_size_box_widget/custom_sized_box.dart';

import '../../utils/app_color/app_color.dart';
import '../../widegts/app_text/app_text.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final String label;
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: 60, // fixed width to maintain balance
        height: 56, // standard nav bar item height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected
                  ? AppColors.primaryAppBar
                  : AppColors.jetBlack,
            ),
            4.sbh,
            Flexible(
              child: AppText(
                text: label,
                size: 9.sp,
                overflow: TextOverflow.ellipsis,
                color: isSelected
                    ? AppColors.primaryAppBar
                    : AppColors.jetBlack,
                fontWeight: FontWeights.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
