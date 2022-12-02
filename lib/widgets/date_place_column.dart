import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// google map
import 'dart:html';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

import '../custom_colors.dart';
import 'card_title.dart';
import 'content_block.dart';

class DatePlaceColumn extends StatefulWidget {
  const DatePlaceColumn({super.key});

  @override
  State<DatePlaceColumn> createState() => _DatePlaceColumnState();
}

class _DatePlaceColumnState extends State<DatePlaceColumn> {
  // google map
  Widget getMap() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(37.588901, 126.991644);

      final mapOptions = MapOptions()
        ..zoom = 17
        ..center = LatLng(37.588901, 126.991644)
        ..zoomControl = false
        ..maxZoom = 17
        ..minZoom = 17
        ..streetViewControl = false
        ..disableDoubleClickZoom = true
        ..clickableIcons = false
        ..keyboardShortcuts = false
        ..mapTypeControl = false
        ..scaleControl = false;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = '성균관대학교 퇴계인문관');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesk = MediaQuery.of(context).size.width >= 520;
    return Column(
      children: [
        const CardTitle(title: '안내'),
        SizedBox(
          height: isDesk ? 20 : 20.w,
        ),
        const ContentBlock(
          title: '📆일시',
          body: '2022년 10월 29일 토요일 오후 3시',
        ),
        SizedBox(
          height: isDesk ? 25 : 25.w,
        ),
        const ContentBlock(
          title: '📍장소',
          body: '성균관대학교 퇴계인문관 4층 31403',
        ),
        SizedBox(
          height: isDesk ? 25 : 25.w,
        ),
        const ContentBlock(
          title: '👕드레스 코드',
          body: '후드티',
        ),
        SizedBox(
          height: isDesk ? 20 : 20.w,
        ),
        SizedBox(
          width: double.infinity,
          height: isDesk ? 250 : 250.w,
          child: getMap(),
        )
      ],
    );
  }
}
