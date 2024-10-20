
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_reels_app/core/util/app_assets.dart';


Widget noDataWidget({text}) {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.pngIconsNoData,
            width: 125.w,
            height: 125.h,
          ),
          Text(
            text?? '',
          ),
        ],
      ));
}