import 'package:flutter/material.dart';
import 'package:submission_2_restaurant_app/data/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static String routeName = '/restaurant_detail';
  final Restaurant restaurant;

  const RestaurantDetailPage({
    super.key, 
    required this.restaurant
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(restaurant.pictureId),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 30
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(restaurant.city)
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5),
                Text(restaurant.description),
                const SizedBox(height: 10),
                const Text(
                  'Foods',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: restaurant.menus['foods'].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 10),
                        constraints: const BoxConstraints(minWidth: 200),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('images/food.jpg'),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        // width: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [               
                            Text(
                              restaurant.menus['foods'][index]['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            const Text(
                              'IDR 25.000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white
                              ),
                            ),
                          ],
                        )
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Beverages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: restaurant.menus['drinks'].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 10),
                        constraints: const BoxConstraints(minWidth: 200),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('images/beverages.jpg'),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        // width: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [               
                            Text(
                              restaurant.menus['drinks'][index]['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            const Text(
                              'IDR 15.000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white
                              ),
                            ),
                          ],
                        )
                      );
                    },
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}