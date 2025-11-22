import 'package:news_app/gen/assets.gen.dart';

enum CategoryEnum {
  general(name: 'General'),
  business(name: 'business'),
  entertainment(name: 'entertainment');

  final String name;

  const CategoryEnum({required this.name});

  String get imagePath {
    switch (this) {
      case general:
        return Assets.images.generalDesign.path;
      case CategoryEnum.business:
        return Assets.images.busniessDesign.path;
      case CategoryEnum.entertainment:
        return Assets.images.entertainmentDesign.path;
    }
  }
}
