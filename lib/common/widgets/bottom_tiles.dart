// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advanced_flutter_todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/width_spacer.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({
    Key? key,
    required this.text,
    required this.text2,
    this.clr,
  }) : super(key: key);

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                dynamic color =
                    ref.read(todoStateProvider.notifier).getRandomColor();
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppConst.kRadius),
                    ),
                    color: color,
                  ),
                );
              },
            ),
            const WidthSpacer(width: 15),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    text: text,
                    style: appstyle(
                      24,
                      AppConst.kLight,
                      FontWeight.bold,
                    ),
                  ),
                  const HeightSpacer(height: 10),
                  ReuseableText(
                    text: text2,
                    style: appstyle(
                      12,
                      AppConst.kLight,
                      FontWeight.normal,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
