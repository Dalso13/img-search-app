class PixaBayImgModel {
  String imageUrl, tags;

//<editor-fold desc="Data Methods">
  PixaBayImgModel({
    required this.imageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PixaBayImgModel &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'PixaBayImgModel{' + ' imageUrl: $imageUrl,' + ' tags: $tags,' + '}';
  }

  PixaBayImgModel copyWith({
    String? imageUrl,
    String? tags,
  }) {
    return PixaBayImgModel(
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
      'tags': this.tags,
    };
  }

  factory PixaBayImgModel.fromMap(Map<String, dynamic> map) {
    return PixaBayImgModel(
      imageUrl: map['imageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}