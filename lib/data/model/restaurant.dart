import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating ;
  final dynamic menus;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<dynamic, dynamic> item) => Restaurant(
    id: item['id'],
    name: item['name'],
    description: item['description'],
    pictureId: item['pictureId'],
    city: item['city'],
    rating: item['rating'],
    menus: item['menus'],
  );
}

List<Restaurant> getRestaurants(response) {
  if (response == null) {
    return [];
  }

  final List<dynamic>parsed = jsonDecode(response)['restaurants'];

  return parsed.map((item) => Restaurant.fromJson(item)).toList();
}