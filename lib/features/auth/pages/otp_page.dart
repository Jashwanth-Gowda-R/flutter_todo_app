// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advanced_flutter_todo_app/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';

class OtpPage extends ConsumerWidget {
  final String smsCodeId;
  final String phone;
  const OtpPage({
    Key? key,
    required this.smsCodeId,
    required this.phone,
  }) : super(key: key);

  void verifyOtpCode(
    BuildContext context,
    WidgetRef ref,
    String smsCode,
  ) {
    ref.read(authControllerProvider).verifyOtp(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onChanged: (value) {
                  print(value);
                },
                onCompleted: (value) {
                  if (value.length == 6) {
                    return verifyOtpCode(context, ref, value);
                  }
                },
                onSubmitted: (value) {
                  if (value.length == 6) {
                    return verifyOtpCode(context, ref, value);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
