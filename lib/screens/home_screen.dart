import 'package:bill_app/screens/order_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  (MaterialPageRoute(builder: (context) => const OrderForm())));
            },
            child: const Text("Create bill")),
      ),
    );
  }
}
