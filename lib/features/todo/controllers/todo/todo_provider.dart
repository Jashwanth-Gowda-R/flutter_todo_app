import 'dart:math';

import 'package:advanced_flutter_todo_app/common/helpers/db_helper.dart';
import 'package:advanced_flutter_todo_app/common/models/task_models.dart';
import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<TaskModel> build() {
    return [];
  }

  void refresh() async {
    final data = await DBHelper.getItems();
    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  void addItem(TaskModel task) async {
    final data = await DBHelper.createItem(task);
    refresh();
  }

  void updateItem(int id, String title, String desc, String date,
      String startTime, String endTime, int isCompleted) async {
    final data = await DBHelper.updateItem(
        id, title, desc, date, startTime, endTime, isCompleted);
    refresh();
  }

  Future<void> deleteTodo(int id) async {
    final data = await DBHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(int id, String title, String desc, String date,
      String startTime, String endTime, int isCompleted) async {
    final data =
        await DBHelper.updateItem(id, title, desc, date, startTime, endTime, 1);
    refresh();
  }

  String getToday() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  String getTommorow() {
    DateTime tommorow = DateTime.now().add(
      const Duration(days: 1),
    );
    return tommorow.toString().substring(0, 10);
  }

  String getDayAfter() {
    DateTime tommorow = DateTime.now().add(
      const Duration(days: 2),
    );
    return tommorow.toString().substring(0, 10);
  }

  List<String> getLast30Days() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(
      const Duration(days: 30),
    );
    List<String> dates = [];
    for (var i = 0; i < 30; i++) {
      DateTime date = oneMonthAgo.add(
        Duration(days: i),
      );
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(TaskModel data) {
    bool? isCompleted;

    if (data.isCompleted == 0) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    return isCompleted;
  }

  dynamic getRandomColor() {
    Random random = Random();
    int randomIndex = random.nextInt(colors.length);
    return colors[randomIndex];
  }
}
