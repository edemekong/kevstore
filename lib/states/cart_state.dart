import 'package:flutter/material.dart';
import 'package:kevshop/models/cart_item.dart';
import 'package:kevshop/models/product.dart';

class CartState extends ChangeNotifier {
  List<CartItem> cartItems = [];

  int get totalCartQuantity {
    if (cartItems.isEmpty) return 0;
    return cartItems.map((e) => e.quantity).reduce((value, element) => value + element);
  }

  int getQuantityFromCartItem(String id) {
    try {
      return cartItems.firstWhere((element) => element.productId == id).quantity;
    } catch (e) {
      return 0;
    }
  }

  addToCart(Product product) {
    final productAlreadyInCart = cartItems.map((e) => e.productId).contains(product.id);
    if (productAlreadyInCart) {
      final oldItem = cartItems.firstWhere((element) => element.productId == product.id);
      cartItems.removeWhere((element) => element.productId == product.id);

      final newItem = oldItem.copyWith(
        quantity: oldItem.quantity + 1,
        product: product,
      );
      print(newItem.quantity);
      cartItems.add(newItem);
      notifyListeners();

      return;
    }
    final newCartItem = CartItem(
      productId: product.id,
      quantity: 1,
      product: product,
    );

    cartItems.add(newCartItem);

    notifyListeners();
  }
}
