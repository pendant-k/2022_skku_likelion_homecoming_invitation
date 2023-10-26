// packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:likelion_2022_invitation/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// firebase init
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// widgets

import 'custom_colors.dart';
import 'widgets/form_contents.dart';
import 'widgets/load_item.dart';
import 'widgets/load_item_with_table.dart';
import 'widgets/card_title.dart';
import 'widgets/contact_btn.dart';
import 'widgets/date_place_column.dart';

void main() async {
  // firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(500, double.infinity),
      builder: (ctx, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: CustomColors.mainColor,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final bool isDesk = MediaQuery.of(context).size.width >= 520;
    Future<void> _openUri(Uri url) async {
      if (!await launchUrl(url)) {
        throw 'Could not launch';
      }
    }

    return Title(
      color: CustomColors.textColor,
      title: '2023 멋사(SKKU) 홈커밍 데이',
      child: Scaffold(
        backgroundColor: CustomColors.skkuColor,
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.white.withAlpha(250),
              constraints: const BoxConstraints(
                maxWidth: 520,
              ),
              padding: EdgeInsets.all(
                isDesk ? 20 : 20.w,
              ),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: isDesk ? 220 : 220.w,
                      child: Image.asset(
                        'assets/mark2.png',
                      ),
                    ),
                    SizedBox(
                      height: isDesk ? 20 : 20.w,
                    ),
                    Text(
                      '🎉멋쟁이 사자처럼 ${Constants.year}주년 홈커밍 데이에 초대합니다!🎉',
                      style: TextStyle(
                        fontSize: isDesk ? 20 : 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff50a27f),
                      ),
                    ),
                    SizedBox(
                      height: isDesk ? 20 : 20.w,
                    ),
                    Text(
                      '저희 멋쟁이 사자처럼 후배들이 선배님들을 초대합니다!!\n멋쟁이 사자처럼 후배와 선배들의 좋은 추억을 위해,\n멋쟁이 사자처럼 ${Constants.year}주년 홈커밍 데이 초대장을 보냅니다.\n멋쟁이 사자처럼 홈커밍 데이를 빛내주실 여러분의 참가 기다리겠습니다!',
                      style: TextStyle(
                        fontSize: isDesk ? 15 : 15.sp,
                        color: const Color(0xff8d968c),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: isDesk ? 20 : 20.w,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesk ? 12.0 : 12.w,
                          vertical: isDesk ? 20 : 20.w,
                        ),
                        child: Column(
                          children: [
                            const CardTitle(title: '회장단 연락처'),
                            SizedBox(
                              height: isDesk ? 20 : 20.w,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: isDesk ? 10 : 25.w,
                                ),
                                ContactBtn(
                                    title: "${Constants.presidentName} 회장",
                                    onTap: () {
                                      _openUri(Uri.parse(Constants.presidentPhone));
                                    }),
                                ContactBtn(
                                  title: "${Constants.viceName} 부회장",
                                  onTap: () {
                                    _openUri(Uri.parse(Constants.vicePhone));
                                  },
                                  isCenter: true,
                                ),
                                ContactBtn(
                                    icon: Icons.chat_bubble,
                                    title: ' 카카오채널 ',
                                    onTap: () {
                                      _openUri(Uri.parse(Constants.kakaoUrl));
                                    }),
                                SizedBox(
                                  width: isDesk ? 10 : 25.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isDesk ? 20 : 20.w,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesk ? 12.0 : 12.w,
                          vertical: isDesk ? 20 : 20.w,
                        ),
                        child: const DatePlaceColumn(),
                      ),
                    ),
                    SizedBox(
                      height: isDesk ? 20 : 20.w,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesk ? 12.0 : 12.w,
                          vertical: isDesk ? 20 : 20.w,
                        ),
                        child: Column(
                          children: [
                            const CardTitle(title: '오시는 길'),
                            SizedBox(
                              height: isDesk ? 20 : 20.w,
                            ),
                            SizedBox(
                              height: isDesk ? 20 : 20.w,
                            ),
                            const LoadItem(
                              title: '🚃지하철',
                              body: '4호선 혜화역 4번 출구 하차 후 도보 이용',
                            ),
                            SizedBox(
                              height: isDesk ? 20 : 20.w,
                            ),
                            const LoadItem(
                              title: '🚌버스',
                              body:
                                  '102, 104, 106, 107, 108,109, 140, 143, 149, 150, 151, 160\n162, 171, 172, 272, 273, 301, 2112',
                            ),
                            SizedBox(
                              height: isDesk ? 20 : 20.w,
                            ),
                            const LoadItemWithTable()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isDesk ? 20 : 20.w,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesk ? 12.0 : 12.w,
                          vertical: isDesk ? 20 : 20.w,
                        ),
                        child: Column(
                          children: [
                            const CardTitle(
                              title: '참가 신청서 작성',
                            ),
                            SizedBox(
                              height: isDesk ? 20 : 20.w,
                            ),
                            const FormContents()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isDesk ? 150 : 150.w,
                    ),
                    Text(
                      '© Copyright 2022, 11th LikeLion(SKKU). All rights reserved',
                      style: TextStyle(
                        fontSize: isDesk ? 14 : 14.sp,
                        color: CustomColors.textColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
