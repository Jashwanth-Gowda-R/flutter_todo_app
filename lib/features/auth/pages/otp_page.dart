import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pinController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(height: AppConst.kHeight * 0.11),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  'assets/images/todo.png',
                  width: AppConst.kWidth * 0.5,
                ),
              ),
              const HeightSpacer(height: 26),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReuseableText(
                  text: 'Please enter your Otp code',
                  style: appstyle(
                    17,
                    AppConst.kLight,
                    FontWeight.w500,
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              Pinput(
                controller: pinController,
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
