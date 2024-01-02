import 'package:flutter/cupertino.dart';

import '../model/pixabay_modal.dart';
import '../model/repository/pixabay_img_repository.dart';

class MainViewModel extends ChangeNotifier {
  final PixaBayImgRepository repository;
  List<PixaBayImgModel>? searchData;
  bool isSearch = true;

  MainViewModel({
    required this.repository,
  });

  Future<void> getImgModel(String data) async {
    isSearch = false;
    notifyListeners();
    searchData = await repository.getImgModel(data);
    isSearch = true;
    notifyListeners();
  }

}