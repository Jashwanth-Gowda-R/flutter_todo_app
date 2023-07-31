import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/custom_text.dart';
import 'package:advanced_flutter_todo_app/common/widgets/height_spacer.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        onTap: () {},
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
      body: Center(
        child: ReuseableText(
          text: 'Shani Todo',
          style: appstyle(
            26,
            Colors.blue,
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
