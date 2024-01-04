import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:img_search_app/view_model/result/main_event.dart';
import 'package:img_search_app/view_model/result/result.dart';

import '../model/pixabay_modal.dart';
import '../model/repository/pixabay_img_repository.dart';

class MainViewModel extends ChangeNotifier {
  final PixaBayImgRepository repository;
  List<PixaBayImgModel>? searchData;
  bool isSearch = true;
  final _eventController = StreamController<MainEvent>();

  MainViewModel({
    required this.repository,
  });

  Stream<MainEvent> get eventStream => _eventController.stream;

  Future<void> getImgModel(String data) async {
    isSearch = false;
    notifyListeners();
    final result = await repository.getImgModel(data);
    switch (result)  {
      case Success<List<PixaBayImgModel>>() :
        searchData = result.data;
        _eventController.add(MainEvent.showSnackBar('성공'));
            break;
      case Error<List<PixaBayImgModel>>() :
        _eventController.add(MainEvent.showDialog('연결 오류'));
    }
    isSearch = true;
    notifyListeners();
  }

}