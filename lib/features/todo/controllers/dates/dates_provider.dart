import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dates_provider.g.dart';

@riverpod
class DateState extends _$DateState {
  @override
  String build() {
    return '';
  }

  void setDate(String newState) {
    state = newState;
  }
}

@riverpod
class StartTimeState extends _$StartTimeState {
  @override
  String build() {
    return '';
  }

  void setStart(String newState) {
    state = newState;
  }

  List<int> dates(DateTime startDate) {
    DateTime now = DateTime.now();

    Duration difference = startDate.difference(now);

    int days = difference.inDays;
    int hrs = difference.inHours % 24;
    int mins = difference.inMinutes % 60;
    int sec = difference.inSeconds % 60;

    return [days, hrs, mins, sec];
  }
}

@riverpod
class FinishTimeState extends _$FinishTimeState {
  @override
  String build() {
    return '';
  }

  void setEnd(String newState) {
    state = newState;
  }
}
