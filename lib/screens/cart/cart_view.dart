import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../states/cart_state.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cartState.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartState.cartItems[index];
          return ListTile(
            leading: Image.network(
              item.product.image,
            ),
            title: Text(item.product.name),
            subtitle: Text(
              item.product.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: CircleAvatar(
              child: Text(item.quantity.toString()),
            ),
          );
        },
      ),
    );
  }
}
