import 'package:flutter/material.dart';
import 'package:test_app2/pages/home_page.dart';
import 'package:test_app2/utility/assets_strings.dart';
import 'package:test_app2/utility/strings.dart';
import 'package:test_app2/widgets/custom_app_bar.dart';
import 'package:test_app2/widgets/custom_scroll_widget.dart';
import 'package:test_app2/widgets/page_background_image.dart';
import 'package:test_app2/widgets/space.dart';
import 'package:test_app2/widgets/svg_image.dart';

class ItemPage extends StatefulWidget {
  static String tag = "/item-Page";
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool _isFavoriteIconClicked = true;

  List<bool> isSelected = [false, true, false];
  int sizeNumberSelected = 1;
  int quantity = 1;

  //! Build Method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageBackgroundImage(
        child: SafeArea(
          child: CustomScrollWidget(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _appBar(),
                  const Space(height: 10),
                  _itemNameAndPriceText(),
                  const Space(height: 15),
                  _sizeChartAndItemImage(),
                  _quantityText(),
                  const Space(height: 10),
                  _quantitySelector(),
                  const Space(height: 20),
                  _foodRatingCalorieTimeStats(),
                  const Space(height: 15),
                  _detailsHeadingText(),
                  const Space(height: 14),
                  _itemDescriptionText(),
                  const Space(height: 25),
                  _addToCartButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //! Function

  void _onClickTrailing() => setState(() {
        _isFavoriteIconClicked = !_isFavoriteIconClicked;
      });

  //! Widget Methods

  Widget _appBar() => CustomAppBar(
      leading: _leading(),
      trailing: _trailing(),
      trailingIconBackgroundColor: const Color(0xFFFECE00),
      onClick: _onClickTrailing);

  Widget _leading() => InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.pushReplacementNamed(context, HomePage.tag);
        },
        child: SvgImage(path: AssetsStrings.leftArrowIcon),
      );

  Widget _trailing() => _isFavoriteIconClicked
      ? const Icon(Icons.favorite)
      : const Icon(Icons.favorite_border);

  Widget _itemNameAndPriceText() => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Strings.kMargheritaPizza,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: "\n${Strings.kRs1250}",
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      );

  Widget _itemSizeButton(String letter, int number) => Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: sizeNumberSelected == number
              ? Colors.amber
              : const Color(0xFFEAEAEA),
        ),
        child: Center(
          child: Text(
            letter,
            style: const TextStyle(
              color: Color(0xFF061737),
            ),
          ),
        ),
      );

  Widget _sizeChartAndItemImage() => SizedBox(
        height: 200,
        width: 350,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 6,
              child: _sizeText(),
            ),
            Positioned(
              bottom: -60,
              child: _sizeToggleButtonAndImage(),
            )
          ],
        ),
      );

  Widget _sizeText() => Text(
        Strings.kSize,
        style: const TextStyle(
          color: Color(0xFf9E9E9E),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _sizeToggleButtonAndImage() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _sizeChartToggleButton(),
          _itemImage(),
        ],
      );

  Widget _sizeChartToggleButton() => ToggleButtons(
          borderColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,
          splashColor: Colors.transparent,
          fillColor: Colors.transparent,
          onPressed: (int index) {
            setState(() {
              sizeNumberSelected = index;
              debugPrint("$isSelected");
            });
          },
          direction: Axis.vertical,
          isSelected: isSelected,
          children: [
            _itemSizeButton("S", 0),
            _itemSizeButton("M", 1),
            _itemSizeButton("L", 2),
          ]);

  Widget _itemImage() => Image.asset(
        AssetsStrings.pizzaImage,
        width: 350,
        height: 300,
      );

  Widget _quantityChangingButton({
    required IconData icon,
    required VoidCallback onClick,
    Color color = const Color(0xFFF5F5F5),
  }) =>
      SizedBox(
        height: 32,
        width: 32,
        child: IconButton(
          padding: const EdgeInsets.all(0.0),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(color),
          ),
          onPressed: onClick,
          icon: Icon(
            icon,
            color: const Color(0xFF061737),
          ),
        ),
      );

  Widget _quantitySelector() => SizedBox(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _decreaseQuantityButton(),
            _quantityNumber(),
            _increaseQuantityButton()
          ],
        ),
      );

  Widget _decreaseQuantityButton() => _quantityChangingButton(
        icon: Icons.remove,
        onClick: () {
          setState(() {
            if (quantity > 1) quantity--;
          });
        },
      );

  Widget _quantityNumber() => Text(
        "$quantity",
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
        ),
      );

  Widget _increaseQuantityButton() => _quantityChangingButton(
        icon: Icons.add,
        onClick: () {
          setState(() {
            quantity++;
          });
        },
        color: const Color(0xFFFECE00),
      );

  Widget _quantityText() => Text(
        Strings.kQuantity,
        style: const TextStyle(
          color: Color(0xFF9E9E9E),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _foodRatingCalorieTimeStats() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _foodRating(),
          _foodCalorie(),
          _foodMakingTime(),
        ],
      );

  Widget _foodRating() => Row(
        children: [
          SvgImage(
            path: AssetsStrings.starIcon,
            height: 20,
            width: 20,
          ),
          const Space(width: 7),
          const Text(
            "4.9",
            style: TextStyle(color: Color(0xFF9E9E9E)),
          )
        ],
      );

  Widget _foodCalorie() => Row(
        children: [
          SvgImage(
            path: AssetsStrings.fireIcon,
            height: 20,
            width: 20,
          ),
          const Space(width: 7),
          Text(
            Strings.calorie145,
            style: const TextStyle(color: Color(0xFF9E9E9E)),
          )
        ],
      );

  Widget _foodMakingTime() => Row(
        children: [
          SvgImage(
            path: AssetsStrings.timeClock,
            height: 20,
            width: 20,
          ),
          const Space(width: 7),
          Text(
            Strings.minute30,
            style: const TextStyle(color: Color(0xFF9E9E9E)),
          )
        ],
      );

  Widget _detailsHeadingText() => Text(
        Strings.kDetails,
        style: const TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _itemDescriptionText() => Text(
        Strings.kItemDescription,
        style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 15),
      );

  Widget _addToCartButton() => ElevatedButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.amber),
          elevation: MaterialStateProperty.all(10),
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(54)),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFFECE00)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          Strings.kAddToCart,
          style: const TextStyle(
              color: Color(0xFf061737),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      );
}
