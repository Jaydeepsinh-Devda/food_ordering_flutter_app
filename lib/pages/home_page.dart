import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app2/data/popular_item_data.dart';
import 'package:test_app2/utility/assets_strings.dart';
import 'package:test_app2/utility/strings.dart';
import 'package:test_app2/widgets/category_list_view.dart';
import 'package:test_app2/widgets/custom_app_bar.dart';
import 'package:test_app2/widgets/page_background_image.dart';
import 'package:test_app2/widgets/popular_grid_view.dart';
import 'package:test_app2/widgets/popular_list_view.dart';

class HomePage extends StatefulWidget {
  static String tag = "/home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = popularItemData;

  List<Widget> viewFormat = const <Widget>[
    Icon(Icons.format_list_bulleted),
    Icon(Icons.grid_view_rounded)
  ];

  int _selectedFormat = 0;

  //! Build Method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageBackgroundImage(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                _sliverBoxAdapter(),
                _space(),
                _popularSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //! Widget Methods

  Widget _popularSection() =>
      _selectedFormat == 0 ? const PopularListView() : const PopularGridView();

  Widget _space() => const SliverPadding(
        padding: EdgeInsets.symmetric(vertical: 25),
      );

  Widget _gap({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
      );

  Widget _svgImage(String path) => SvgPicture.asset(path);

  Widget _sliverBoxAdapter() => SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            _gap(height: 26),
            _headlineText(),
            _gap(height: 21),
            const CategoryListView(),
            _gap(height: 37),
            _popularSectionHeading(),
          ],
        ),
      );

  Widget _appBar() => CustomAppBar(
        leading: _menuIcon(),
        middle: _appBarMiddleText(),
        trailing: const Icon(Icons.mic_none),
      );

  Widget _menuIcon() => _svgImage(AssetsStrings.menuIcon);

  Widget _appBarMiddleText() => Row(
        children: [
          _svgImage(AssetsStrings.locationIcon),
          _gap(width: 5),
          _titleText(),
          _gap(width: 3),
          _svgImage(AssetsStrings.downArrowIcon),
        ],
      );

  Widget _titleText() => Text(
        Strings.kPVRJabalpur,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFF5F5F5),
          fontSize: 14,
        ),
      );

  Widget _headlineText() => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Strings.kGetYourFood,
              style: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: "\n${Strings.kDelivered}",
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );

  Widget _popularSectionHeading() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _popularHeading(),
          _toggleListAndGridView(),
        ],
      );

  Widget _popularHeading() => Text(
        Strings.kPopularNow,
        style: const TextStyle(
            fontSize: 24,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w600),
      );

  Widget _toggleListAndGridView() => SizedBox(
        height: 30,
        child: ToggleButtons(
          onPressed: (int index) {
            setState(() {
              _selectedFormat = index;
            });
          },
          borderRadius: BorderRadius.circular(150),
          borderColor: const Color(0xFFFECE00),
          selectedBorderColor: const Color(0xFFFFFFFF),
          selectedColor: Colors.white,
          color: const Color(0xFFFECE00),
          fillColor: const Color(0xFFFECE00),
          isSelected: [
            for (int i = 0; i < viewFormat.length; i++) i == _selectedFormat
          ],
          children: viewFormat,
        ),
      );
}
