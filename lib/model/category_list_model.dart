enum Category {
  pizza,
  burger,
  all,
}

class CategoryListModel {
  final String itemName;
  final String itemAssetPath;
  final Category category;

  const CategoryListModel(
    this.itemName,
    this.itemAssetPath,
    this.category
  );
}
