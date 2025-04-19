import 'package:flutter/material.dart';

class LandlordListingPage extends StatelessWidget {
  const LandlordListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Landlord Listings')),
      body: const Center(
        child: Text('Landlord Listings will appear here.', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
