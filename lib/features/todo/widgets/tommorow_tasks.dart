import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/expansion_tile.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/xpansion_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/pages/update_todo.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TommorowTasks extends ConsumerWidget {
  const TommorowTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(todoStateProvider);
    var tommorow = ref.read(todoStateProvider.notifier).getTommorow();
    var tommorowList = todos
        .where(
          (task) => task.isCompleted == 0 && task.date!.contains(tommorow),
        )
        .toList();

    dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();

    return XpansionTile(
      text: 'Tommorow\'s tasks',
      text2: 'nale',
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
              onTap: () {
                titles = todo.title.toString();
                descs = todo.desc.toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return UpdateTask(
                      id: todo.id ?? 0,
                    );
                  }),
                );
              },
              child: const Icon(
                MaterialCommunityIcons.circle_edit_outline,
              ),
            ),
          ),
      ],
    );
  }
}
