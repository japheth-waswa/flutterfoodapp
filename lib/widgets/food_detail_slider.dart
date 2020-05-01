import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/food_model.dart';
import '../models/data_collection.dart';
import '../config/config.dart';

class FooddetailSlider extends StatefulWidget {
  @override
  _FooddetailSliderState createState() => _FooddetailSliderState();
}

class _FooddetailSliderState extends State<FooddetailSlider> {
  PageController _pageController;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _buildPageNavs() {
    List<Widget> pageNavs = [];
    for (int i = 0; i < foodSliderItems.length; i++) {
      pageNavs.add(
        Padding(
          padding: EdgeInsets.only(
            right: _selectedPageIndex == i ? 0.0 : 3.0,
          ),
          child: GestureDetector(
            onTap: () {
              _pageController.jumpToPage(i);
            },
            child: Icon(
              _selectedPageIndex == i
                  ? Icons.fiber_manual_record
                  : FontAwesomeIcons.circle,
              color: Colors.white,
              size: _selectedPageIndex == i ? fontSizeH5 : fontSizeH8,
            ),
          ),
        ),
      );
    }
    return pageNavs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          PageView.builder(
            physics: BouncingScrollPhysics(),
            onPageChanged: (int pageIndex) {
              setState(() {
                _selectedPageIndex = pageIndex;
              });
            },
            controller: _pageController,
            itemCount: foodSliderItems.length,
            itemBuilder: (BuildContext context, int index) {
              Food food = foodSliderItems[index];
              return Stack(
                children: <Widget>[
                  Image(
                    width: double.infinity,
                    height: double.infinity,
                    image: AssetImage(food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                    ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 40.0,
            // right: 20.0,
            child: Row(
              children: _buildPageNavs(),
            ),
          ),
        ],
      ),
    );
  }
}
