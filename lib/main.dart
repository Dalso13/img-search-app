import 'package:flutter/material.dart';
import 'package:img_search_app/model/repository/pixabay_img_repository.dart';
import 'package:img_search_app/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import 'main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) =>
              MainViewModel(repository: PixaBayImgRepository()),
          child: MainScreen()),
    );
  }
}
