import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors.dart';

class ContentBlock extends StatelessWidget {
  const ContentBlock({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final bool isDesk = MediaQuery.of(context).size.width >= 520;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$title : ',
          style: TextStyle(
            fontSize: isDesk ? 16 : 16.sp,
            color: CustomColors.textColor,
          ),
        ),
        Text(
          body,
          style: TextStyle(
            fontSize: isDesk ? 15 : 15.sp,
            fontWeight: FontWeight.bold,
            color: CustomColors.textColor,
          ),
        )
      ],
    );
  }
}
