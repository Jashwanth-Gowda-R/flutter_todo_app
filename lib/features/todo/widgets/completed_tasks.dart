import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompletedTasks extends ConsumerWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listData = ref.watch(todoStateProvider);
    var lastMonth = ref.read(todoStateProvider.notifier).getLast30Days();
    var completedList = listData
        .where((task) =>
            task.isCompleted == 1 ||
            lastMonth.contains(
              task.date!.substring(0, 10),
            ))
        .toList();

    return ListView.builder(
      itemCount: completedList.length,
      itemBuilder: (context, index) {
        final data = completedList[index];

        dynamic color = ref.watch(todoStateProvider.notifier).getRandomColor();

        return TodoTile(
          color: color,
          title: data.title,
          description: data.desc,
          start: data.startTime,
          end: data.endTime,
          switcher: const Icon(
            AntDesign.checkcircle,
            color: AppConst.kGreen,
          ),
          delete: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
        );
      },
    );
  }
}
