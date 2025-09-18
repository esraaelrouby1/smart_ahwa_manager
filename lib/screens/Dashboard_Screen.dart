import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/models/order.dart';
import 'package:smart_ahwa_manager/widgets/order_card_widget.dart';
import 'add_order_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Order> orders = [];

  void _goToAddOrder() async {
    final newOrder = await Navigator.push<Order>(
      context,
      MaterialPageRoute(builder: (_) => const AddOrderScreen()),
    );

    if (newOrder != null) {
      setState(() => orders.add(newOrder));
    }
  }

  void _toggleServed(int index) {
    setState(() {
      orders[index] = orders[index].copyWith(isServed: !orders[index].isServed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                'No orders yet.\nAdd some to get started!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCard(
                  order: order,
                  onToggle: () => _toggleServed(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6F4E37),
        onPressed: _goToAddOrder,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

//------
