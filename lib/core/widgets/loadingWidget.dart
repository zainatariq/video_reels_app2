import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_reels_app/core/util/app_assets.dart';
import '../../common/AppColors.dart';
import '../util/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            // 'assets/images/png_icons/rounded_Logo.png',
            Assets.pngIconsRoundedLogo,
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),

        SizedBox(
        width: 32.w,
        height: 32.h,
        child: Transform.scale(
          scale:4,
          child:   CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColorDark),
            strokeWidth: 2,
              strokeCap: StrokeCap.round
            ),
            ),
          ),
        ],
    );
  }
}
