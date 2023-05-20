import 'package:flutter/material.dart';
import 'package:submission_2_restaurant_app/data/model/restaurant.dart';
import 'package:submission_2_restaurant_app/ui/restaurant_detail.dart';

class RestaurantList extends StatelessWidget {
  static String routeName = '/restaurant_list';

  const RestaurantList({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Restaurant Apps'),
      // ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('data/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = getRestaurants(snapshot.data);

          // print(snapshot.data);

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              print(restaurants[index].menus['foods']);
              return itemRestaurant(context, restaurants[index]);
            },
          );
        }
      )
    );
  }

  Widget itemRestaurant(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName, arguments: restaurant);
      },
    );
  }
}