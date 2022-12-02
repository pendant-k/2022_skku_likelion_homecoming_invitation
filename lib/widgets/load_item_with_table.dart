import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../custom_colors.dart';

class LoadItemWithTable extends StatelessWidget {
  const LoadItemWithTable({super.key});

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
            '🚗자동차',
            style: TextStyle(
              fontSize: isDesk ? 16 : 16.w,
              fontWeight: FontWeight.w600,
              color: CustomColors.textColor,
            ),
          ),
          SizedBox(
            height: isDesk ? 15 : 15.w,
          ),
          Table(
            border: TableBorder(
              left: BorderSide(
                width: 1.0,
                color: Colors.grey[200]!,
              ),
              right: BorderSide(
                width: 1.0,
                color: Colors.grey[200]!,
              ),
              bottom: BorderSide(
                width: 1.0,
                color: Colors.grey[200]!,
              ),
              horizontalInside: BorderSide(
                width: 1.0,
                color: Colors.grey[200]!,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: const BoxDecoration(
                    color: CustomColors.skkuColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(isDesk ? 10 : 10.w),
                        child: Text(
                          '시간',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isDesk ? 15 : 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(isDesk ? 10 : 10.w),
                        child: Text(
                          '요금',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isDesk ? 15 : 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(isDesk ? 10 : 10.w),
                        child: Text(
                          '비고',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isDesk ? 15 : 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ]),
              TableRow(children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '10분 미만',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '무료',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
                const TableCell(
                  child: SizedBox(),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '10분 이상 ~\n30분 미만',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '2000원',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '기본요금',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '30분 이상',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '기본요금\n+ 10분당 500원 추가\n※ 2시간 초과 시 10분당 1,000원 추가',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(
                      isDesk ? 5 : 5.w,
                    ),
                    child: Text(
                      '1일 최대요금\n(24시 이전까지)\n30,000원',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                      ),
                    ),
                  ),
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}
