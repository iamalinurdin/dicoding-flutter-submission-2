import 'package:flutter/material.dart';
import 'package:submission_2_restaurant_app/data/model/restaurant.dart';
import 'package:submission_2_restaurant_app/ui/restaurant_detail.dart';
import 'package:submission_2_restaurant_app/ui/restaurant_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RestaurantList(),
      initialRoute: RestaurantList.routeName,
      routes: {
        RestaurantList.routeName: (context) => const RestaurantList(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}