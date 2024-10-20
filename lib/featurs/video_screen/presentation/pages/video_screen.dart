import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/app_consts.dart';
import '../widgets/list_of_videos_widgets.dart';

class GetVideosScreen extends StatelessWidget {
  const GetVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('  ', style: K.blackLargeBoldTextStyle),
            K.sizedBoxH10,
            const Text('WELCOME TO ZEINA\'S TASK 🫣',
                style: TextStyle(color: Colors.grey)),
            Divider(
              color: Colors.grey.shade300,
            ),
            K.sizedBoxH10,
            const ReelsPageView(),
          ],
        )

        );
  }
}
