import 'package:flutter/material.dart';
import 'package:foodappui/models/food_model.dart';
import 'package:foodappui/screens/food_screen.dart';
import '../models/data_collection.dart';
import '../models/restaurant_model.dart';
import 'package:transparent_image/transparent_image.dart';
import '../config/config.dart';

class RelatedfoodCarousel extends StatelessWidget {
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
                'Related Foods',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeH8,
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
          height: 180.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: relatedFoods.length,
            itemBuilder: (BuildContext context, int index) {
              Food food = relatedFoods[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                width: 200,
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
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                      child: food.imageIsRemote == 1
                          ? FadeInImage.memoryNetwork(
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image: food.imageUrl,
                            )
                          : Image(
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image: AssetImage(food.imageUrl),
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
                      bottom: 20.0,
                      left: 10.0,
                      right: 5.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.yellow[300],
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            food.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSizeH8,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            food.thumbsUp.toString() + ' places',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: defaultFontSize,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
