import 'package:flutter/material.dart';
import 'package:test_app2/data/popular_item_data.dart';
import 'package:test_app2/pages/item_page.dart';

class PopularGridView extends StatefulWidget {
  const PopularGridView({super.key});

  @override
  State<PopularGridView> createState() => _PopularGridViewState();
}

class _PopularGridViewState extends State<PopularGridView> {
//! Build Method
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: popularItemData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: MediaQuery.of(context).size.height > 900 ? 0 : 25,
        ),
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              debugPrint("Height : ${MediaQuery.of(context).size.height}");
              debugPrint("Width : ${MediaQuery.of(context).size.width}");
              Navigator.pushReplacementNamed(context, ItemPage.tag);
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                _popularGridViewCard(index),
                _popularGridViewImage(index)
              ],
            ),
          );
        });
  }

//! Widget Methods
  Widget _popularGridViewCard(int index) => SizedBox(
        width: MediaQuery.of(context).size.width > 400 ? 350 : 164,
        height: MediaQuery.of(context).size.height > 900 ? 350 : 164,
        child: Card(
          color: const Color(0xFFFFFFFF),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: _popularGridViewCardText(index),
        ),
      );

  Widget _popularGridViewCardText(int index) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: _popularItemText(index),
        ),
      );

  Widget _popularGridViewImage(int index) => Positioned(
        top: -50,
        child: _popularFoodImages(index),
      );

  Widget _popularItemText(int index) => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: popularItemData[index].itemName,
              style: TextStyle(
                color: const Color(0xFF061737),
                fontSize: MediaQuery.of(context).size.width > 400 ? 30 : 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: "\n ${popularItemData[index].itemSubText}",
              style: TextStyle(
                color: const Color(0xFF9E9E9E),
                fontSize: MediaQuery.of(context).size.width > 400 ? 25 : 12,
              ),
            )
          ],
        ),
      );

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
          width: MediaQuery.of(context).size.width > 400 ? 200 : 120,
          height: MediaQuery.of(context).size.height > 900 ? 200 : 120,
          child: Image.asset(
            popularItemData[index].itemAssetPath,
            fit: BoxFit.cover,
          ),
        ),
      );
}
