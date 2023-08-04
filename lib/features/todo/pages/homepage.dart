import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/width_spacer.dart';
import 'package:advanced_flutter_todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:advanced_flutter_todo_app/features/todo/pages/add_todo.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/completed_tasks.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/day_after_tomoorow.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/today_task_list.dart';
import 'package:advanced_flutter_todo_app/features/todo/widgets/tommorow_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  final TextEditingController _search = TextEditingController();

  late final TabController tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseableText(
                      text: 'Dashboard',
                      style: appstyle(
                        18,
                        AppConst.kLight,
                        FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const AddTask();
                            }),
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppConst.kBKDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(height: 20),
              CustomTextField(
                controller: _search,
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: AppConst.kGreyLight,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppConst.kGreyLight,
                ),
              ),
              const HeightSpacer(height: 15),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              const HeightSpacer(height: 25),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConst.kLight,
                  ),
                  const WidthSpacer(width: 10),
                  ReuseableText(
                    text: 'Today\'s Task',
                    style: appstyle(
                      18,
                      AppConst.kLight,
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const HeightSpacer(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConst.kRadius),
                  ),
                ),
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                    color: AppConst.kGreyLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppConst.kRadius),
                    ),
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConst.kBlueLight,
                  labelStyle: appstyle(
                    24,
                    AppConst.kBlueLight,
                    FontWeight.w700,
                  ),
                  unselectedLabelColor: AppConst.kLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReuseableText(
                            text: 'Pending',
                            style: appstyle(
                              16,
                              AppConst.kBKDark,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReuseableText(
                            text: 'Completed',
                            style: appstyle(
                              16,
                              AppConst.kBKDark,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(height: 20),
              SizedBox(
                height: AppConst.kHeight * 0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConst.kRadius),
                  ),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        height: AppConst.kHeight * 0.3,
                        color: AppConst.kBkLight,
                        child: const TodayTasks(),
                      ),
                      Container(
                        height: AppConst.kHeight * 0.3,
                        color: AppConst.kBkLight,
                        child: const CompletedTasks(),
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              const TommorowTasks(),
              const HeightSpacer(height: 20),
              const DayAfterTomorrow(),
            ],
          ),
        ),
      ),
    );
  }
}
