import 'package:bill_app/models/invoice_model.dart';
import 'package:bill_app/services/save_user.dart';
import 'package:flutter/material.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({super.key});

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final TextEditingController _sellerNameController = TextEditingController();
  final TextEditingController _sellerAddressController =
      TextEditingController();
  final TextEditingController _sellerGSTController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set up your details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextFormField(
            controller: _sellerNameController,
            decoration: const InputDecoration(labelText: 'Seller Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the seller name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _sellerAddressController,
            decoration: const InputDecoration(labelText: 'Seller Address'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the seller address';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _sellerGSTController,
            decoration: const InputDecoration(labelText: 'Seller GST'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the seller GST';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                UserDb.saveUserData(UserDetails(
                        address: _sellerAddressController.text,
                        gstNo: _sellerGSTController.text,
                        name: _sellerNameController.text))
                    .then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text("Save data"))
        ]),
      ),
    );
  }
}
