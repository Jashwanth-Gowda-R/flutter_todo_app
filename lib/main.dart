import 'package:advanced_flutter_todo_app/common/utils/constants.dart';
import 'package:advanced_flutter_todo_app/features/todo/pages/homepage.dart';
import 'package:advanced_flutter_todo_app/firebase_options.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// com.googleusercontent.apps.108755459227-kv3ffi68a88j06vd16daeu832vbmc5t5

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  );

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return DynamicColorBuilder(
            builder: (lightColorScheme, darkColorScheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shani Todo',
            theme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBKDark,
              colorScheme: lightColorScheme ?? defaultLightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme ?? defaultDarkColorScheme,
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
            home: const HomePage(),
          );
        });
      },
    );
  }
}
