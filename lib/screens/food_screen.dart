import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodappui/config/config.dart';
import 'package:foodappui/config/helpers.dart';
import 'package:foodappui/models/food_model.dart';
import 'package:foodappui/widgets/food_detail_slider.dart';
import 'package:foodappui/widgets/related_food_carousel.dart';

class FoodScreen extends StatefulWidget {
  final Food food;

  FoodScreen(this.food);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    // LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
    //   return Container(
    //       height: 500.0,
    //       width: double.infinity,
    //       child: Stack(
    //         children: <Widget>[
    //           FooddetailSlider(),
    //           Positioned(
    //             top: 380.0,
    //             child: Container(
    //               height: 300.0,
    //               width: 120.0,
    //               decoration: BoxDecoration(
    //                 color: Colors.red,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    // },);
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 600.0,
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: widget.food.id,
                          child: FooddetailSlider(),
                        ),
                        Positioned(
                          top: 50.0,
                          left: 10.0,
                          right: 10.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Helpers.platformIcon(
                                    context,
                                    'arrowBack',
                                  ),
                                  color: Colors.white,
                                  size: fontSizeH3,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.share,
                                      size: fontSizeH3,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.more_vert,
                                      size: fontSizeH3,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 370.0,
                          child: Container(
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    left: 30.0,
                                    right: 30.0,
                                    bottom: 20.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.food.name,
                                        style: TextStyle(
                                          fontSize: fontSizeH5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            size: fontSizeH7,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Text(
                                            '03 James Manors Apt. 77',
                                            style: TextStyle(
                                              fontSize: fontSizeH8,
                                              color: Colors.grey,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 3.0,
                                              horizontal: 3.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.blue[300],
                                              borderRadius:
                                                  BorderRadius.circular(
                                                30.0,
                                              ),
                                            ),
                                            child: Text(
                                              'Free Delivery',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: defaultFontSize,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              '33 min',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              '27 miles',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                  ),
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.grey[300],
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            right: 10.0,
                                            left: 10.0,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: const EdgeInsets.all(
                                                  10.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '${widget.food.rating}.0',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: fontSizeH9,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Ratings',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: defaultFontSize,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            right: 10.0,
                                            left: 10.0,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: const EdgeInsets.all(
                                                  10.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Icon(
                                                  Icons.bookmark,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '137K',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: fontSizeH9,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Bookmark',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: defaultFontSize,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            right: 10.0,
                                            left: 10.0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    10.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: Icon(
                                                    Icons.photo,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: 10.0),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '346',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: fontSizeH9,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Photo',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize:
                                                            defaultFontSize,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RelatedfoodCarousel(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
