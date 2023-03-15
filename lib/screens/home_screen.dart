import 'package:flutter/material.dart';
import 'package:flutter_dish/widgets/cart_button.dart';

import '../helpers/cart_helper.dart';
import '../models/order.dart';
import '/widgets/nearby_restaurants.dart';
import '/screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle_rounded),
        ),
        title: const Text('Food Delivery'),
        centerTitle: true,
        actions: [CartButton()],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear, color: Colors.grey),
                ),
                hintText: 'Search Food or Restaurants',
              ),
            ),
          ),

          // TODO: for Recent Orders
          // const RecentOrders(),

          // TODO: for Nearby Restaurants
          const NearbyRestaurants(),
        ],
      ),
    );
  }

  void navigateToCartScreen(BuildContext context, List<Order> cart) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
    );
  }
}
