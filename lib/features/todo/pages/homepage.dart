import 'package:advanced_flutter_todo_app/common/widgets/appstyle.dart';
import 'package:advanced_flutter_todo_app/common/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
