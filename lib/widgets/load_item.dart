import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors.dart';

class LoadItem extends StatelessWidget {
  const LoadItem({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final bool isDesk = MediaQuery.of(context).size.width >= 520;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isDesk ? 16 : 16.w,
              fontWeight: FontWeight.w600,
              color: CustomColors.pColor,
            ),
          ),
          SizedBox(
            height: isDesk ? 15 : 15.w,
          ),
          Text(
            body,
            style: TextStyle(
              fontSize: isDesk ? 15 : 15.w,
              color: CustomColors.textColor,
            ),
            maxLines: 4,
          )
        ],
      ),
    );
  }
}
