import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_otn_btn.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  'assets/images/todo.png',
                  width: 300,
                ),
              ),
              const HeightSpacer(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReuseableText(
                  text: 'Please enter your Phone Number',
                  style: appstyle(
                    17,
                    AppConst.kLight,
                    FontWeight.w500,
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              Center(
                child: CustomTextField(
                  controller: phone,
                  // prefixIcon: Container(
                  //   padding: const EdgeInsets.all(4.0),
                  //   child: GestureDetector(
                  //     onTap: () {},
                  //   ),
                  // ),
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter Phone Number',
                  hintStyle: appstyle(
                    16,
                    AppConst.kBKDark,
                    FontWeight.w600,
                  ),
                ),
              ),
              const HeightSpacer(
                height: 20,
              ),
              CustomOtlnBtn(
                onTap: () {},
                width: AppConst.kWidth * 0.9,
                height: AppConst.kHeight * 0.07,
                color: AppConst.kBKDark,
                color2: AppConst.kLight,
                text: 'Send Otp',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
