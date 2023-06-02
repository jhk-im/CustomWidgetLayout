import 'package:custom_widget_layout/custom_widget_item.dart';
import 'package:custom_widget_layout/custom_widget_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widget Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  late AppBar appBar;

  @override
  Widget build(BuildContext context) {
    AppBar createAppBar() {
      appBar = AppBar(
        actions: [
          IconButton(
              onPressed: () {
                print('Add Widget');
                print(appBar.preferredSize.height);
              },
              icon: const Icon(Icons.add)),
        ],
      );
      return appBar;
    }

    return Scaffold(
      appBar: createAppBar(),
      body: const CustomWidgetLayout(),
    );
  }
}
