import 'package:img_search_app/model/mapper/dto_to_model.dart';
import 'package:img_search_app/model/pixabay_modal.dart';

import '../api/pixabay_api.dart';

class PixaBayImgRepository {
  final _api = PixabayApi();
  
  Future<List<PixaBayImgModel>> getImgModel(String data) async {
    final dto = await _api.getApiData(data);
    
    if (dto.isNotEmpty){
      return dto.map((e) => e.toImageItem()).toList();
    } else {
      return [];
    }
  }
}