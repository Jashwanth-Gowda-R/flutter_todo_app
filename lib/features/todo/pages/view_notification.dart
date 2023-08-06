import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
    Key? key,
    this.payload,
  }) : super(key: key);

  final String? payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Container(
                width: AppConst.kWidth,
                height: AppConst.kHeight * 0.7,
                decoration: BoxDecoration(
                  color: AppConst.kBkLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConst.kRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(
                        text: 'Reminder',
                        style: appstyle(40, AppConst.kLight, FontWeight.bold),
                      ),
                      const HeightSpacer(height: 5),
                      Container(
                        width: AppConst.kWidth,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: AppConst.kYellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(9.h),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ReuseableText(
                              text: 'Today',
                              style: appstyle(
                                14,
                                AppConst.kBKDark,
                                FontWeight.bold,
                              ),
                            ),
                            const WidthSpacer(width: 15),
                            ReuseableText(
                              text: 'From : start To end',
                              style: appstyle(
                                14,
                                AppConst.kBKDark,
                                FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HeightSpacer(height: 10),
                      ReuseableText(
                        text: 'Title',
                        style: appstyle(
                          30,
                          AppConst.kBKDark,
                          FontWeight.bold,
                        ),
                      ),
                      const HeightSpacer(height: 10),
                      Text(
                        'DescriptionDescriptionDescription DescriptionDescriptionDescriptionDescription DescriptionDescriptionDescriptionDescription DescriptionDescriptionDescriptionDescription DescriptionDescriptionDescriptionDescription ',
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                        style: appstyle(
                          12,
                          AppConst.kLight,
                          FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: -10,
              child: Image.asset(
                'assets/images/bell.png',
                width: 70.w,
                height: 70.h,
              ),
            ),
            Positioned(
              bottom: -AppConst.kHeight * 0.142,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/notification.png',
                width: AppConst.kWidth * 0.8,
                height: AppConst.kHeight * 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
