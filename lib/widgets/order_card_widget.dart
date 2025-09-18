import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/models/order.dart';
import 'package:smart_ahwa_manager/widgets/status_chip_widget.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onToggle;

  const OrderCard({super.key, required this.order, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(order.customer),
        subtitle: Text(
          '${order.drink.label} • ${order.note.isNotEmpty ? order.note : "No notes"}',
        ),
        trailing: StatusChip(isServed: order.isServed, onTap: onToggle),
        onTap: onToggle,
      ),
    );
  }
}
