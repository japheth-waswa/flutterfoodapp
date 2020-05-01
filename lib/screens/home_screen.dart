import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodappui/widgets/homepage_carousel_slider.dart';
import 'package:foodappui/widgets/meal_deal_carousel.dart';
import 'package:foodappui/widgets/most_popular_carousel.dart';
import '../config/config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  List<IconData> bottomNavIcons = [
    Icons.home,
    Icons.location_on,
    Icons.favorite,
    FontAwesomeIcons.user
  ];
  List<BottomNavigationBarItem> _bottomNavigationBarItems = [];

  _processBottomNavigationItems() {
    for (int i = 0; i < bottomNavIcons.length; i++) {
      print(i);
      if (bottomNavIcons[i] != null) {
        _bottomNavigationBarItems.add(
          BottomNavigationBarItem(
            icon: Icon(
              bottomNavIcons[i],
              color: Colors.black54,
            ),
            title: SizedBox.shrink(),
          ),
        );
      }
    }
    // bottomNavIcons.forEach((IconData icon) {
    //   _bottomNavigationBarItems.add(
    //     BottomNavigationBarItem(
    //       icon: Icon(icon,color: Colors.black54,),
    //       title: SizedBox.shrink(),
    //     ),
    //   );
    // });

    return _bottomNavigationBarItems;
  }

  @override
  Widget build(BuildContext context) {
    var contextTheme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    labelText: 'Search for restaurants and foods',
                    labelStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              HomepageCarouselslider(),
              MostpopularCarousel(),
              MealdealCarousel(),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentTab == 0 ? Colors.yellow[700] : Colors.black38,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.mapMarkerAlt,
              color: _currentTab == 1 ? Colors.yellow[700] : Colors.black38,
              size: navigationBarFontAwesomeIconSize,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heart,
              color: _currentTab == 2 ? Colors.yellow[700] : Colors.black38,
              size: navigationBarFontAwesomeIconSize,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
              color: _currentTab == 3 ? Colors.yellow[700] : Colors.black38,
              size: navigationBarFontAwesomeIconSize,
            ),
            title: SizedBox.shrink(),
          ),
        ],
        selectedItemColor: contextTheme.primaryColor,
      ),
    );
  }
}
