import 'package:img_search_app/model/mapper/dto_to_model.dart';
import 'package:img_search_app/model/pixabay_modal.dart';
import 'package:img_search_app/view_model/result/result.dart';

import '../api/pixabay_api.dart';

class PixaBayImgRepository {
  final _api = PixabayApi();
  
  Future<Result<List<PixaBayImgModel>>> getImgModel(String data) async {
    try {
      final dto = await _api.getApiData(data);

      if (dto.isNotEmpty){
        return Result.success(dto.map((e) => e.toImageItem()).toList());
      } else {
        return Result.success([]);
      }
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}