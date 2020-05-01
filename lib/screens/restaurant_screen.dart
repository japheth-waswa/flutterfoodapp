import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodappui/models/food_model.dart';
import 'package:foodappui/models/restaurant_model.dart';
import 'package:transparent_image/transparent_image.dart';
import '../config/helpers.dart';
import '../config/config.dart';
import 'food_screen.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen(this.restaurant);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐️ ';
    }
    return stars.trim();
  }

  _buildMenuListItem(food) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        padding: const EdgeInsets.all(
          10.0,
        ),
        width: double.infinity,
        height: 120.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
              child: food.imageIsRemote == 1
                  ? FadeInImage.memoryNetwork(
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: food.imageUrl,
                    )
                  : Image(
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      image: AssetImage(food.imageUrl),
                    ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 120.0,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          food.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: fontSizeH8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        _buildStars(food.rating),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '4AM to 10PM',
                      style: TextStyle(
                        fontSize: defaultFontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.restaurant.address,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: defaultFontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.restaurant.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: defaultFontSize,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.bookmark,
                        color: Colors.blue[300],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 300.0,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Hero(
                  tag: widget.restaurant.id,
                  child: widget.restaurant.isRemoteImage == 0
                      ? Image(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage(widget.restaurant.imageUrl),
                        )
                      : FadeInImage.memoryNetwork(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image: widget.restaurant.imageUrl,
                        ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                  ),
                ),
                Positioned(
                  top: 40.0,
                  right: 20.0,
                  left: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Helpers.platformIcon(context, 'arrowBack'),
                          size: fontSizeH4,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          size: fontSizeH4,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.restaurant.name,
                  style: TextStyle(
                    fontSize: fontSizeH4,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${widget.restaurant.menu.length} Menu Items',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: fontSizeH6,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.sortAlphaDownAlt,
                    color: Colors.blue[300],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.restaurant.menu.length,
              itemBuilder: (BuildContext context, int index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuListItem(food);
              },
            ),
          ),
        ],
      ),
    );
  }
}
