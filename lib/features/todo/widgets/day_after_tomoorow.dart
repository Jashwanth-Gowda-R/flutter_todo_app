import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/expansion_tile.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/xpansion_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayAfterTomorrow extends ConsumerWidget {
  const DayAfterTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(todoStateProvider);
    var tommorow = ref.read(todoStateProvider.notifier).getDayAfter();
    var tommorowList = todos
        .where(
          (task) => task.isCompleted == 0 && task.date!.contains(tommorow),
        )
        .toList();

    dynamic color = ref.watch(todoStateProvider.notifier).getRandomColor();

    return XpansionTile(
      text: DateTime.now()
          .add(const Duration(days: 2))
          .toString()
          .substring(0, 10),
      text2: 'Later Tasks',
      onExpansionChanged: (bool expanded) {
        ref.read(xpansionStateProvider.notifier).setStart(!expanded);
      },
      trailing: Padding(
        padding: EdgeInsets.only(
          right: 12.w,
        ),
        child: ref.watch(xpansionStateProvider)
            ? const Icon(
                AntDesign.circledown,
                color: AppConst.kLight,
              )
            : const Icon(
                AntDesign.closecircleo,
                color: AppConst.kBlueLight,
              ),
      ),
      children: [
        for (var todo in tommorowList)
          TodoTile(
            color: color,
            title: todo.title,
            description: todo.desc,
            start: todo.startTime,
            end: todo.endTime,
            switcher: const SizedBox.shrink(),
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {},
              child: const Icon(
                MaterialCommunityIcons.circle_edit_outline,
              ),
            ),
          ),
      ],
    );
  }
}
