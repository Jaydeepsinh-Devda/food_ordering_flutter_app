import 'package:test_app2/model/category_list_model.dart';

class PopularItemModel {
  final String itemName;
  final String itemAssetPath;
  final String itemSubText;
  final Category category;

  const PopularItemModel(
    this.itemName,
    this.itemAssetPath,
    this.itemSubText,
    this.category
  );
}
