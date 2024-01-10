// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:bill_app/models/invoice_model.dart';
import 'package:bill_app/widgets/printable_data.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class OrderForm extends StatefulWidget {
  const OrderForm({super.key});

  @override // State<SaveBtnBuilder>
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _buyerNameController = TextEditingController();
  final TextEditingController _buyerAddressController = TextEditingController();
  final TextEditingController _buyerGSTController = TextEditingController();
  final TextEditingController _sellerNameController = TextEditingController();
  final TextEditingController _sellerAddressController =
      TextEditingController();
  final TextEditingController _sellerGSTController = TextEditingController();
  final TextEditingController _invoiceController = TextEditingController();

  final List<Map<String, TextEditingController>> _products = [];
  String modeOfPayment = "Credit Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _invoiceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Invoice no'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the buyer address';
                  }
                  return null;
                },
              ),
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
              TextFormField(
                controller: _buyerNameController,
                decoration: const InputDecoration(labelText: 'Buyer Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the buyer name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _buyerAddressController,
                decoration: const InputDecoration(labelText: 'Buyer Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the buyer address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _buyerGSTController,
                decoration: const InputDecoration(labelText: 'Buyer GST'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the buyer GST';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Product List', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Column(
                children: _products.asMap().entries.map((entry) {
                  final index = entry.key;
                  final product = entry.value;

                  return ProductItem(
                    productNameController: product['name']!,
                    gstController: product['gst']!,
                    rateController: product['rate']!,
                    perAmountController: product['perAmount']!,
                    onRemove: () {
                      _removeProduct(index);
                    },
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: _addProduct,
                child: const Text('Add Product'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: 'Credit Card',
                items: const [
                  DropdownMenuItem(
                    value: 'Credit Card',
                    child: Text('Credit Card'),
                  ),
                  DropdownMenuItem(
                    value: 'Debit Card',
                    child: Text('Debit Card'),
                  ),
                  DropdownMenuItem(
                    value: 'Cash',
                    child: Text('Cash'),
                  ),
                  DropdownMenuItem(
                    value: 'Upi',
                    child: Text('Upi'),
                  ),
                ],
                onChanged: (value) {
                  modeOfPayment = value!;
                },
                decoration: const InputDecoration(labelText: 'Mode of Payment'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    List<ItemModel> lim = [];

                    for (var data in _products) {
                      lim.add(ItemModel(
                          amount: ((double.parse(data["rate"]!.text) *
                                      double.parse(data["perAmount"]!.text)) +
                                  ((double.parse(data["rate"]!.text) *
                                          double.parse(
                                              data["perAmount"]!.text)) *
                                      double.parse(data["gst"]!.text) /
                                      100))
                              .toString(),
                          gst: data['gst']!.text,
                          particulars: data['name']!.text,
                          rate: data["rate"]!.text,
                          per: data["perAmount"]!.text));
                    }
                    String calculateTotal() {
                      double total = 0;
                      for (var item in lim) {
                        total += double.parse(item.amount!);
                      }
                      print(total);
                      if (total.toString().contains(".")) {
                        String inString = total.toStringAsFixed(2);
                        double inDouble = double.parse(inString);
                        return inDouble.toString();
                      } else {
                        return total.toString();
                      }
                    }

                    InvoiceModel im = InvoiceModel(
                        date: DateTime.now().toString(),
                        modeOfPayment: modeOfPayment,
                        total: calculateTotal(),
                        buyerDetails: BuyerDetails(
                            address: _buyerAddressController.text,
                            gstNo: _buyerGSTController.text,
                            name: _buyerNameController.text),
                        sellerDetails: SellerDetails(
                            address: _sellerAddressController.text,
                            gstNo: _sellerGSTController.text,
                            name: _sellerNameController.text),
                        invoiceNO: _invoiceController.text,
                        totalInWords: convertNumberToWords(
                            double.parse(calculateTotal()).round()),
                        item: lim);
                    log(im.toJson().toString());
                    printDoc(im);
                  }
                },
                child: const Text('Generate invoice'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String convertNumberToWords(int number) {
    if (number < 0 || number > 10000000) {
      // Handle out-of-range numbers according to your requirements
      return 'Out of range';
    }

    if (number == 0) {
      return 'zero';
    }

    String result = '';

    List<String> units = [
      '',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
    ];
    List<String> teens = [
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];
    List<String> tens = [
      '',
      'ten',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];

    String convertBelowThousand(int num) {
      String result = '';
      if (num >= 100) {
        result += '${units[num ~/ 100]} hundred';
        num %= 100;
        if (num > 0) {
          result += ' ';
        } else {
          return result;
        }
      }
      if (num > 10 && num < 20) {
        return result + teens[num - 11];
      } else {
        result += tens[num ~/ 10];
        num %= 10;
        if (num > 0) {
          result += ' ';
        } else {
          return result;
        }
      }
      return result + units[num];
    }

    if (number >= 1000000) {
      result += '${convertBelowThousand(number ~/ 1000000)} million ';
      number %= 1000000;
    }

    if (number >= 1000) {
      result += '${convertBelowThousand(number ~/ 1000)} thousand ';
      number %= 1000;
    }

    result += convertBelowThousand(number);

    return result;
  }

  Future<void> printDoc(data) async {
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData(
            data,
          );
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  void _addProduct() {
    setState(() {
      _products.add({
        'name': TextEditingController(),
        'gst': TextEditingController(),
        'rate': TextEditingController(),
        'perAmount': TextEditingController(),
      });
    });
  }

  void _removeProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }
}

class ProductItem extends StatelessWidget {
  final TextEditingController productNameController;
  final TextEditingController gstController;
  final TextEditingController rateController;
  final TextEditingController perAmountController;
  final VoidCallback onRemove;

  const ProductItem({
    super.key,
    required this.productNameController,
    required this.gstController,
    required this.rateController,
    required this.perAmountController,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: productNameController,
          decoration: const InputDecoration(labelText: 'Product Name'),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: gstController,
          decoration: const InputDecoration(labelText: 'GST'),
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
        ElevatedButton(
          onPressed: onRemove,
          child: const Text('Remove Product'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
