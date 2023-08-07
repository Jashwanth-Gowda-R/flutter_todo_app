import 'package:advanced_flutter_todo_app/common/helpers/notification_helper.dart';
import 'package:advanced_flutter_todo_app/common/models/task_models.dart';
import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_otn_btn.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/showDialog.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/dates/dates_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask({
    super.key,
    required this.id,
  });

  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {
  TextEditingController titleController = TextEditingController(text: titles);
  TextEditingController descController = TextEditingController(text: descs);

  late NotificationsHelper notificationsHelper;
  late NotificationsHelper controller;

  List<int> notification = [];

  @override
  void initState() {
    super.initState();
    notificationsHelper = NotificationsHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0), () {
      controller = NotificationsHelper(ref: ref);
    });
    notificationsHelper.initializeNotification();
  }

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
                        onTap: () {},
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
              onTap: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    startTime.isNotEmpty &&
                    endTime.isNotEmpty) {
                  TaskModel task = TaskModel(
                    title: titleController.text,
                    desc: descController.text,
                    isCompleted: 0,
                    date: scheduleDate.substring(0, 10),
                    startTime: startTime.substring(10, 16),
                    endTime: endTime.substring(10, 16),
                    remaind: 0,
                    repeat: 'yes',
                  );

                  ref.read(todoStateProvider.notifier).updateItem(
                        widget.id,
                        titleController.text,
                        descController.text,
                        scheduleDate.substring(0, 10),
                        startTime.substring(10, 16),
                        endTime.substring(10, 16),
                        0,
                      );
                  notificationsHelper.scheduledNotification(
                    notification[0],
                    notification[1],
                    notification[2],
                    notification[3],
                    task,
                  );
                  // ref.read(startTimeStateProvider.notifier).setStart('');
                  // ref.read(finishTimeStateProvider.notifier).setEnd('');
                  // ref.read(dateStateProvider.notifier).setDate('');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }),
                  );
                } else {
                  debugPrint('failed to add task');
                  showAlertDialog(
                    context: context,
                    message: 'failed to add task',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
