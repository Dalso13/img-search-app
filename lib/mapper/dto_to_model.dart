import 'package:img_search_app/dto/pixabay.dart';
import 'package:img_search_app/model/pixabay_modal.dart';

extension DtoToModel on PixaBayImg {
  PixaBayImgModel toImageItem() {
    return PixaBayImgModel(
      imageUrl: previewURL ??
          'https://www.allkpop.com/upload/2023/11/content/042257/1699153030-lsf-collage-1.jpg',
      tags: tags ?? '',
    );
  }
}