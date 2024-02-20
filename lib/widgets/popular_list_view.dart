import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app2/data/popular_item_data.dart';
import 'package:test_app2/pages/item_page.dart';
import 'package:test_app2/utility/assets_strings.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  //! Build Method

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: popularItemData.length,
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, ItemPage.tag);
          },
          child: Card(
            color: const Color(0xFFFFFFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _popularFoodImages(index),
                _popularItemText(index),
                _rightArrowIconButton(
                  color: const Color(0xFFFECE00),
                )
              ],
            ),
          ),
        );
      },
    );
  }

//! Widget Methods

  Widget _svgImage(String path) => SvgPicture.asset(path);

  Widget _popularFoodImages(int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 50,
              spreadRadius: -33,
              offset: Offset(5, 30),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: SizedBox(
          width: 120,
          height: 120,
          child: Image.asset(
            popularItemData[index].itemAssetPath,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _popularItemText(int index) => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: popularItemData[index].itemName,
              style: const TextStyle(
                color: Color(0xFF061737),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: "\n ${popularItemData[index].itemSubText}",
              style: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 12,
              ),
            )
          ],
        ),
      );

  Widget _rightArrowIconButton({Color? color, VoidCallback? onClick}) =>
      IconButton(
        iconSize: 17,
        onPressed: onClick,
        icon: _svgImage(AssetsStrings.rightArrowIcon),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
      );
}
