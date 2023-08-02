import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_otn_btn.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/dates/dates_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

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
    var scheduleDate = ref.watch(dateStateProvider);
    var startTime = ref.watch(startTimeStateProvider);
    var endTime = ref.watch(finishTimeStateProvider);

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
              text: scheduleDate == ''
                  ? 'Add Date'
                  : scheduleDate.substring(0, 10),
              color: AppConst.kLight,
              color2: AppConst.kBlueLight,
              onTap: () {
                picker.DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2023, 8, 1),
                  maxTime: DateTime(2080, 8, 1),
                  theme: const picker.DatePickerTheme(
                    doneStyle: TextStyle(
                      color: AppConst.kGreen,
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (date) {
                    print('confirm $date');
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  },
                  currentTime: DateTime.now(),
                  locale: picker.LocaleType.en,
                );
              },
            ),
            const HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlnBtn(
                  height: 52.h,
                  width: AppConst.kWidth * 0.4,
                  text: startTime == ''
                      ? 'Start Time'
                      : startTime.toString().substring(11, 16),
                  color: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        // minTime: DateTime(2020, 5, 5, 20, 50),
                        // maxTime: DateTime(2020, 6, 7, 05, 09),
                        onConfirm: (date) {
                      print('confirm $date');
                      ref
                          .read(startTimeStateProvider.notifier)
                          .setStart(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                ),
                startTime == ''
                    ? CustomOtlnBtn(
                        height: 52.h,
                        width: AppConst.kWidth * 0.4,
                        text: endTime == ''
                            ? 'End Time'
                            : endTime.toString().substring(11, 16),
                        color: AppConst.kLight,
                        color2: AppConst.kGreyDk,
                        onTap: () {
                          // picker.DatePicker.showDateTimePicker(context,
                          //     showTitleActions: true,
                          //     minTime: end, onConfirm: (date) {
                          //   print('confirm $date');
                          //   ref
                          //       .read(finishTimeStateProvider.notifier)
                          //       .setEnd(date.toString());
                          // }, locale: picker.LocaleType.en);
                        },
                      )
                    : CustomOtlnBtn(
                        height: 52.h,
                        width: AppConst.kWidth * 0.4,
                        text: endTime == ''
                            ? 'End Time'
                            : endTime.toString().substring(11, 16),
                        color: AppConst.kLight,
                        color2: AppConst.kBlueLight,
                        onTap: () {
                          picker.DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.parse(startTime),
                              onConfirm: (date) {
                            print('confirm $date');
                            ref
                                .read(finishTimeStateProvider.notifier)
                                .setEnd(date.toString());
                          }, locale: picker.LocaleType.en);
                        },
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
