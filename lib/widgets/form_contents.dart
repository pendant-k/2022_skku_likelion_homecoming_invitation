import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_colors.dart';

class FormContents extends StatefulWidget {
  const FormContents({super.key});

  @override
  State<FormContents> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContents> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _thFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();
  final _db = FirebaseFirestore.instance.collection('forms');

  // data to save
  String _name = "";
  String _th = "";
  String _phone = "";
  bool _parking = false;
  bool _submitted = false;
  bool _submitError = false;

  _submit() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      try {
        await _db.doc().set({
          "이름": _name,
          "기수": _th,
          "휴대전화번호": _phone,
          "주차권 발권": _parking,
        }).then((value) {
          setState(() {
            _submitted = true;
          });
        });
      } catch (e) {
        print(e);
        setState(() {
          _submitted = true;
          _submitError = true;
        });
      }
    }
  }

  @override
  void initState() {
    _nameFocusNode.addListener(() {
      setState(() {});
    });
    _thFocusNode.addListener(() {
      setState(() {});
    });
    _phoneFocusNode.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesk = MediaQuery.of(context).size.width >= 520;

    return _submitted
        ? Center(
            child: Text(
              _submitError
                  ? '일시적인 오류가 발생했어요 ㅠㅠ'
                  : '신청해주셔서 감사합니다!\n건강한 모습으로 뵙겠습니다🔥',
              style: TextStyle(
                fontSize: isDesk ? 20 : 20.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '값을 입력해주세요.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _name = value;
                    }
                  },
                  focusNode: _nameFocusNode,
                  cursorColor: CustomColors.skkuColor,
                  style: TextStyle(
                    fontSize: isDesk ? 15 : 15.sp,
                    color: CustomColors.textColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      isDesk ? 10 : 10.w,
                    ),
                    suffixText: "(이름 입력)",
                    suffixStyle: TextStyle(
                      fontSize: isDesk ? 14 : 14.sp,
                      color: CustomColors.gray88,
                    ),
                    labelText: '이름',
                    labelStyle: TextStyle(
                      fontSize: isDesk ? 15 : 15.sp,
                      color: _nameFocusNode.hasFocus
                          ? CustomColors.skkuColor
                          : CustomColors.gray88,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: CustomColors.grayE8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: CustomColors.skkuColor,
                      ),
                    ),
                    errorStyle: TextStyle(
                      fontSize: isDesk ? 12 : 12.sp,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: isDesk ? 25 : 25.w,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '값을 입력해주세요.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _th = value;
                    }
                  },
                  focusNode: _thFocusNode,
                  cursorColor: CustomColors.skkuColor,
                  style: TextStyle(
                    fontSize: isDesk ? 15 : 15.sp,
                    color: CustomColors.textColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      isDesk ? 10 : 10.w,
                    ),
                    suffixText: "(숫자 입력)",
                    suffixStyle: TextStyle(
                      fontSize: isDesk ? 14 : 14.sp,
                      color: CustomColors.gray88,
                    ),
                    labelText: '기수',
                    labelStyle: TextStyle(
                      fontSize: isDesk ? 15 : 15.sp,
                      color: _thFocusNode.hasFocus
                          ? CustomColors.skkuColor
                          : CustomColors.gray88,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: CustomColors.grayE8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: CustomColors.skkuColor,
                      ),
                    ),
                    errorStyle: TextStyle(
                      fontSize: isDesk ? 12 : 12.sp,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: isDesk ? 25 : 25.w,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '값을 입력해주세요.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _phone = value;
                    }
                  },
                  focusNode: _phoneFocusNode,
                  cursorColor: CustomColors.skkuColor,
                  style: TextStyle(
                    fontSize: isDesk ? 15 : 15.sp,
                    color: CustomColors.textColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      isDesk ? 10 : 10.w,
                    ),
                    suffixText: "('-'제외 숫자입력)",
                    suffixStyle: TextStyle(
                      fontSize: isDesk ? 14 : 14.sp,
                      color: CustomColors.gray88,
                    ),
                    labelText: '휴대전화번호',
                    labelStyle: TextStyle(
                      fontSize: isDesk ? 15 : 15.sp,
                      color: _phoneFocusNode.hasFocus
                          ? CustomColors.skkuColor
                          : CustomColors.gray88,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: CustomColors.grayE8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: CustomColors.skkuColor,
                      ),
                    ),
                    errorStyle: TextStyle(
                      fontSize: isDesk ? 12 : 12.sp,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: isDesk ? 25 : 25.w,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: CustomColors.skkuColor,
                        value: _parking,
                        onChanged: (value) {
                          setState(() {
                            _parking = value!;
                          });
                        }),
                    Text(
                      '주차권 신청 여부',
                      style: TextStyle(
                        fontSize: isDesk ? 15 : 15.sp,
                        color: CustomColors.textColor,
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: isDesk ? 10 : 10.w,
                    ),
                    child: Text(
                      '주차권 발행이 필요하시면 반드시 체크해주세요!',
                      style: TextStyle(
                        fontSize: isDesk ? 12 : 12.sp,
                        color: CustomColors.gray88,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: isDesk ? 80 : 80.w,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.skkuColor,
                      padding: EdgeInsets.symmetric(
                        vertical: isDesk ? 20 : 20.w,
                      ),
                    ),
                    onPressed: _submit,
                    child: Text(
                      '신청하기',
                      style: TextStyle(
                        fontSize: isDesk ? 16 : 16.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
