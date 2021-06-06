import 'dart:convert';

class ImageEntity {
  String url;
  int height;
  int width;
  ImageEntity({
    required this.url,
    required this.height,
    required this.width,
  });

  ImageEntity copyWith({
    String? url,
    int? height,
    int? width,
  }) {
    return ImageEntity(
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'height': height,
      'width': width,
    };
  }

  factory ImageEntity.fromMap(Map<String, dynamic> map) {
    return ImageEntity(
      url: map['url'],
      height: map['height'],
      width: map['width'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageEntity.fromJson(String source) =>
      ImageEntity.fromMap(json.decode(source));

  @override
  String toString() => 'Image(url: $url, height: $height, width: $width)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageEntity &&
        other.url == url &&
        other.height == height &&
        other.width == width;
  }

  @override
  int get hashCode => url.hashCode ^ height.hashCode ^ width.hashCode;
}
