import 'package:flutter/foundation.dart';

enum DrinkKind { shai, turkishCoffee, hibiscusTea }

@immutable
class Order {
  final String id;
  final String customer;
  final DrinkKind drink;
  final String note;
  final bool isServed;

  const Order({
    required this.id,
    required this.customer,
    required this.drink,
    this.note = '',
    this.isServed = false,
  });

  Order copyWith({
    String? id,
    String? customer,
    DrinkKind? drink,
    String? note,
    bool? isServed,
  }) {
    return Order(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      drink: drink ?? this.drink,
      note: note ?? this.note,
      isServed: isServed ?? this.isServed,
    );
  }
}

extension DrinkKindLabel on DrinkKind {
  String get label {
    switch (this) {
      case DrinkKind.shai:
        return 'Shai';
      case DrinkKind.turkishCoffee:
        return 'Turkish Coffee';
      case DrinkKind.hibiscusTea:
        return 'Hibiscus Tea';
    }
  }
}
