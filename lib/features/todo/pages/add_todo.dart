import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_otn_btn.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(height: 20),
            CustomTextField(
              controller: titleController,
              hintText: 'Add Title',
              hintStyle: appstyle(
                16,
                AppConst.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(height: 20),
            CustomTextField(
              controller: descController,
              hintText: 'Add Description',
              hintStyle: appstyle(
                16,
                AppConst.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(height: 20),
            CustomOtlnBtn(
              height: 52.h,
              width: AppConst.kWidth,
              text: 'Add Date',
              color: AppConst.kLight,
              color2: AppConst.kBlueLight,
              onTap: () {},
            ),
            const HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlnBtn(
                  height: 52.h,
                  width: AppConst.kWidth * 0.4,
                  text: 'Start Time',
                  color: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  onTap: () {},
                ),
                CustomOtlnBtn(
                  height: 52.h,
                  width: AppConst.kWidth * 0.4,
                  text: 'End Time',
                  color: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  onTap: () {},
                ),
              ],
            ),
            const HeightSpacer(height: 20),
            CustomOtlnBtn(
              height: 52.h,
              width: AppConst.kWidth,
              text: 'Add Task',
              color: AppConst.kLight,
              color2: AppConst.kGreen,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
