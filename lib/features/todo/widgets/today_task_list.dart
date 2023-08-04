import 'package:advanced_flutter_todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayTasks extends ConsumerWidget {
  const TodayTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listData = ref.watch(todoStateProvider);
    var today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where(
          (task) => task.isCompleted == 0 && task.date!.contains(today),
        )
        .toList();

    return ListView.builder(
      itemCount: todayList.length,
      itemBuilder: (context, index) {
        final data = todayList[index];
        bool isCompleted =
            ref.watch(todoStateProvider.notifier).getStatus(data);

        dynamic color = ref.watch(todoStateProvider.notifier).getRandomColor();

        return TodoTile(
          color: color,
          title: data.title,
          description: data.desc,
          start: data.startTime,
          end: data.endTime,
          switcher: Switch(
            value: isCompleted,
            onChanged: (val) {
              ref.read(todoStateProvider.notifier).markAsCompleted(
                    data.id ?? 0,
                    data.title.toString(),
                    data.desc.toString(),
                    data.date.toString(),
                    data.startTime.toString(),
                    data.endTime.toString(),
                    1,
                  );
            },
          ),
          delete: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
          editWidget: GestureDetector(
            onTap: () {},
            child: const Icon(
              MaterialCommunityIcons.circle_edit_outline,
            ),
          ),
        );
      },
    );
  }
}
