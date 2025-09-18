import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/screens/dashboard_screen.dart';
import 'package:smart_ahwa_manager/screens/add_order_screen.dart';
import 'package:smart_ahwa_manager/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Image.asset(
                "assets/images/welcome_screen.png",
                height: 240,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to ahwa",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Manage your drink orders effortlessly and enjoy a seamless experience. "
                "Start your first order or view your dashboard.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                text: 'Start order',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }
}
