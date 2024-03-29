import 'package:flutter/material.dart';
import 'package:flutter_dish/models/order.dart';

import '../helpers/cart_helper.dart';
import '../helpers/ordered_helper.dart';
import '../models/ordered.dart';
import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Order>? cart;

  const CartScreen({this.cart, Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Order>? _cart;

  @override
  void initState() {
    super.initState();
    _cart = widget.cart;
  }

  @override
  Widget build(BuildContext context) {
    // double totalPrice = 0;
    // widget.cart!.forEach((Order thisOrder) {
    //   totalPrice += thisOrder.quantity! * thisOrder.food!.price!;
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Cart(${widget.cart!.length})',
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index < widget.cart!.length) {
            Order order = widget.cart![index];
            return _buildCartItem(context, order);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Estimated Delivery Time:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '20 min',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Total Cost:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      // '\$${totalPrice.toStringAsFixed(2)}',
                      '45',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 85.0),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: widget.cart!.length + 1,
      ),
      bottomSheet: Container(
        height: 80.0,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            // You can also set other properties such as text color, padding, etc.
          ),
          onPressed: () async {
            // Delete all items from the cart

            await CartHelper.instance.deleteAll();
            for (var item in _cart!) {
              Ordered order = Ordered(
                  foodId: item.foodId, date: DateTime.now(), quantity: 1);
              await OrderedHelper.instance.insert(order);
            }
            // Show success message popup
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: Text('Your checkout was successful.'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        // Navigate to the home screen and remove all the previous routes
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            'CHECKOUT',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      height: 170.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(order.food!.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    order.food!.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Text(
                  //   order.restaurant!.name!,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: const TextStyle(
                  //     fontSize: 16.0,
                  //     fontWeight: FontWeight.w600,
                  //     letterSpacing: 1.2,
                  //   ),
                  // ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Text(
                          order.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '\$${order.food!.price}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
