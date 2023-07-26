import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBKDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset('assets/images/todo.png'),
          ),
          const HeightSpacer(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReuseableText(
                text: 'ToDo with Shani',
                style: appstyle(
                  30,
                  AppConst.kLight,
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'Welcome! Do you want to create task fast and ease?',
                  textAlign: TextAlign.center,
                  style: appstyle(
                    16,
                    AppConst.kGreyLight,
                    FontWeight.normal,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
