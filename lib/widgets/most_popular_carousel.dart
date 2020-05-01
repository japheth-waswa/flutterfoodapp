import 'package:flutter/material.dart';
import 'package:foodappui/screens/restaurant_screen.dart';
import '../models/data_collection.dart';
import '../models/restaurant_model.dart';
import 'package:transparent_image/transparent_image.dart';
import '../config/config.dart';

class MostpopularCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Most Popular',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeH8,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.teal[200],
                    fontSize: fontSizeH8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 0.0,
          ),
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          height: 160.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: mostPopularRestaurants.length,
            itemBuilder: (BuildContext context, int index) {
              Restaurant restaurant = mostPopularRestaurants[index];
              return GestureDetector(
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return RestaurantScreen(restaurant);
                })),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(
                            5.0,
                          ),
                        ),
                        child: Hero(
                          tag: restaurant.id,
                                                  child: restaurant.isRemoteImage == 0
                              ? Image(
                                  height: 80.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: AssetImage(restaurant.imageUrl),
                                )
                              : FadeInImage.memoryNetwork(
                                  height: 80.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: restaurant.imageUrl,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          top: 5.0,
                          right: 5.0,
                        ),
                        child: Text(
                          restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          top: 5.0,
                          right: 5.0,
                        ),
                        child: Text(
                          restaurant.address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: defaultFontSize,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          top: 5.0,
                          right: 5.0,
                        ),
                        child: Text(
                          restaurant.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: miniDefaultFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
