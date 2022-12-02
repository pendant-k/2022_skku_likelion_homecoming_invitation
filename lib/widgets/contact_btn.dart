import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors.dart';

class ContactBtn extends StatelessWidget {
  const ContactBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.isCenter = false,
    this.icon = Icons.phone_android,
  });
  final String title;
  final VoidCallback onTap;
  final bool isCenter;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final bool isDesk = MediaQuery.of(context).size.width >= 520;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          isDesk ? 10 : 10.w,
        ),
        decoration: BoxDecoration(
          color: !isCenter ? CustomColors.skkuColor : CustomColors.mainColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: isDesk ? 15 : 15.w,
              color: Colors.white.withAlpha(250),
            ),
            SizedBox(
              width: isDesk ? 5 : 5.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: isDesk ? 15 : 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white.withAlpha(250),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
