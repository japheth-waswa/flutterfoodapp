import 'food_model.dart';

class Restaurant {
  final String id;
  final String imageUrl;
  final String name;
  final String address;
  final String location;
  final String description;
  final int isRemoteImage;
  final int rating;
  final List<Food> menu;

  Restaurant({
    this.id,
    this.imageUrl,
    this.name,
    this.address,
    this.location,
    this.description,
    this.isRemoteImage,
    this.rating,
    this.menu,
  });
}
