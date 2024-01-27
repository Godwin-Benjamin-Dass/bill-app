import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String siNo;

  final TextEditingController productNameController;
  final TextEditingController gstController;
  final TextEditingController rateController;
  final TextEditingController perAmountController;
  final TextEditingController noOfPerson;
  final VoidCallback onRemove;

  const ProductItem({
    super.key,
    required this.productNameController,
    required this.gstController,
    required this.rateController,
    required this.perAmountController,
    required this.onRemove,
    required this.siNo,
    required this.noOfPerson,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(siNo),
                const Spacer(),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            TextFormField(
              controller: productNameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            // TextFormField(
            //   keyboardType: TextInputType.number,
            //   controller: gstController,
            //   decoration: const InputDecoration(labelText: 'GST'),
            // ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: noOfPerson,
              decoration: const InputDecoration(labelText: 'no of person'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: rateController,
              decoration: const InputDecoration(labelText: 'Rate'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: perAmountController,
              decoration: const InputDecoration(labelText: 'No of days'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
