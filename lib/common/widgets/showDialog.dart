import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: ReuseableText(
          text: message,
          style: appstyle(18, AppConst.kLight, FontWeight.w600),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: ReuseableText(
              text: btnText ?? 'OK',
              style: appstyle(18, AppConst.kGreyLight, FontWeight.w500),
            ),
          ),
        ],
      );
    },
  );
}
