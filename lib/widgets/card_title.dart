import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDesk = MediaQuery.of(context).size.width >= 520;
    return Text(
      title,
      style: TextStyle(
        fontSize: isDesk ? 20 : 20.w,
        fontWeight: FontWeight.bold,
        color: CustomColors.pColor,
      ),
    );
  }
}
