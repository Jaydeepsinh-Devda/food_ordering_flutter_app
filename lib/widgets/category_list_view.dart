import 'package:flutter/material.dart';
import 'package:test_app2/data/category_list_data.dart';
import 'package:test_app2/utility/assets_strings.dart';
import 'package:test_app2/utility/strings.dart';
import 'package:test_app2/widgets/svg_image.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int _selectedCategoryListIndex = -1;

  //! Build Method

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _categorySectionHeading(),
        _gap(height: 16),
        _categoryListView()
      ],
    );
  }

//! Widget Methods

  Widget _gap({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
      );

  Widget _categorySectionHeading() => Text(
        Strings.kCategories,
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _categoryListView() => SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryListData.length,
          itemBuilder: (ctx, index) {
            return _categoryCard(index);
          },
        ),
      );

  Widget _categoryCard(int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: _shadowEffectOnCategoryList(index),
        ),
        child: Card(
          color: _selectedCategoryListIndex == index
              ? const Color(0xFFFECE00)
              : const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: _clickAbleCard(index),
        ),
      );

  Widget _clickAbleCard(int index) => InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onCardClick(index),
        child: SizedBox(
          width: 110,
          height: 170,
          child: _categoryCardItems(index),
        ),
      );

  Widget _categoryCardItems(int index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgImage(
            path: categoryListData[index].itemAssetPath,
            width: 40,
            height: 40,
          ),
          _gap(height: 8),
          _itemNameText(index),
          _gap(height: 8),
          _rightArrowIconButton(index)
        ],
      );

  Widget _itemNameText(int index) => Text(
        categoryListData[index].itemName,
        style: const TextStyle(fontWeight: FontWeight.w600),
      );

  Widget _rightArrowIconButton(int index) => IconButton(
        iconSize: 17,
        onPressed: onCardClick(index),
        icon: SvgImage(path: AssetsStrings.rightArrowIcon),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            _selectedCategoryListIndex == index
                ? const Color(0xFFFFFFFF)
                : const Color(0xFFFECE00),
          ),
        ),
      );

//! Function

  VoidCallback onCardClick(int index) {
    return () {
      setState(() {
        _selectedCategoryListIndex = index;
      });
    };
  }

  List<BoxShadow> _shadowEffectOnCategoryList(int index) {
    return [
      _selectedCategoryListIndex == index
          ? BoxShadow(
              color: const Color(0xFFEAEAEA).withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
              blurStyle: BlurStyle.inner,
              offset: const Offset(0, 2),
            )
          : const BoxShadow()
    ];
  }
}
