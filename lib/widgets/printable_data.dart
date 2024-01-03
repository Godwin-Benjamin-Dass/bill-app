import 'package:bill_app/models/invoice_model.dart';
import 'package:pdf/widgets.dart' as pw;

buildPrintableData(
  InvoiceModel im,
) {
  return pw.Column(
    children: [
      pw.Container(
        // color: Colors.white,
        child: pw.Padding(
          padding: const pw.EdgeInsets.all(16.0),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  'Tax Invoice',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.SizedBox(
                    width: 100,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(im.sellerDetails!.name!),
                        pw.Text(im.sellerDetails!.address!),
                        pw.Text(im.sellerDetails!.gstNo!),
                        // pw.Text("State Name:Tamil Nadu,Code:33"),
                      ],
                    ),
                  ),
                  pw.SizedBox(
                    width: 100,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Invoice No: ${im.invoiceNO}"),
                      ],
                    ),
                  ),
                  pw.SizedBox(
                    width: 100,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Date:${im.date!.substring(0, 10)}"),
                        pw.Text("Mode of payment"),
                        pw.Text(im.modeOfPayment!),
                      ],
                    ),
                  )
                ],
              ),
              pw.Divider(),
              pw.Text("Buyer(Bill To)"),
              pw.Text(im.buyerDetails!.name!),
              pw.Text(im.buyerDetails!.address!),
              pw.Text("GST NO:${im.buyerDetails!.gstNo}"),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("SiNo"),
                  pw.Text('Particular'),
                  pw.Text('GST'),
                  pw.Text('Rate'),
                  pw.Text('No of Days'),
                  pw.Text('Amount')
                ],
              ),
              pw.Divider(),

              pw.ListView.builder(
                  itemCount: im.item!.length,
                  itemBuilder: (ctx, i) {
                    ItemModel item = im.item![i];
                    return pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.SizedBox(
                          width: 75,
                          child: pw.Text((i + 1).toString()),
                        ),
                        pw.SizedBox(
                          width: 95,
                          child: pw.Text(item.particulars!),
                        ),
                        pw.SizedBox(
                          width: 70,
                          child: pw.Text(item.gst!),
                        ),
                        pw.SizedBox(
                          width: 90,
                          child: pw.Text(item.rate!),
                        ),
                        pw.SizedBox(
                          width: 85,
                          child: pw.Text(item.per!),
                        ),
                        pw.Container(
                          width: 90,
                          child: pw.Text(item.amount!),
                        ),
                      ],
                    );
                  }),

              // Text('Invoice Date: ${DateTime.now().toString()}'),
              // SizedBox(height: 10),
              // Text(
              //     'Due Date: ${DateTime.now().add(Duration(days: 30)).toString()}'),
              // SizedBox(height: 20),
              // pw.DataTable(
              //   columns: [
              //     const DataColumn(label: Text('SiNo')),
              //     const DataColumn(label: Text('Particular')),
              //     const DataColumn(label: Text('GST')),
              //     const DataColumn(label: Text('Rate')),
              //     const DataColumn(label: Text('Per')),
              //     const DataColumn(label: Text('Amount')),
              //   ],
              //   rows: invoiceItems.map((item) {
              //     return DataRow(
              //       cells: [
              //         DataCell(Text(item.itemName)),
              //         DataCell(Center(child: Text(item.quantity.toString()))),
              //         DataCell(Center(
              //             child: Text('₹${item.unitPrice.toString()}'))),
              //         DataCell(Center(
              //             child: Text('₹${item.unitPrice.toString()}'))),
              //         DataCell(Center(
              //             child: Text('₹${item.unitPrice.toString()}'))),
              //         DataCell(
              //           Center(
              //             child: Text(
              //                 '₹${(item.quantity * item.unitPrice).toString()}'),
              //           ),
              //         ),
              //       ],
              //     );
              //   }).toList(),
              // ),
              pw.Divider(),
              pw.Center(
                child: pw.Text(
                  'Total: Rs ${im.total}',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.Divider(),
              pw.Row(
                children: [
                  pw.Text("Amount Chargeable in words"),
                  pw.Spacer(),
                  pw.Text("E. & O.E")
                ],
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(
                    width: 250,
                    child: pw.Text("${im.totalInWords!} Only"),
                  ),
                  pw.Spacer(),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("for V.R. Venkatesh(Park Regency)"),
                      pw.Text("Authorised Signature"),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Center(child: pw.Text("Generated Invoice"))
            ],
          ),
        ),
      ),
    ],
  );
}
   
   


// pw.Padding(
//       padding: const pw.EdgeInsets.all(25.00),
//       child: pw.Column(children: [
//         pw.Text("vijaycreations",
//             style:
//                 pw.TextStyle(fontSize: 25.00, fontWeight: pw.FontWeight.bold)),
//         pw.SizedBox(height: 10.00),
//         pw.Divider(),
//         pw.Align(
//           alignment: pw.Alignment.topRight,
//           child: pw.Image(
//             image,
//             width: 250,
//             height: 250,
//           ),
//         ),
//         pw.Column(
//           children: [
//             pw.Row(
//               crossAxisAlignment: pw.CrossAxisAlignment.end,
//               children: [
//                 pw.SizedBox(width: 5.5),
//                 pw.Text(
//                   "Invoice",
//                   style: pw.TextStyle(
//                       fontSize: 23.00, fontWeight: pw.FontWeight.bold),
//                 )
//               ],
//             ),
//             pw.SizedBox(height: 10.00),
//             pw.Container(
//               color: const PdfColor(0.5, 1, 0.5, 0.7),
//               width: double.infinity,
//               height: 36.00,
//               child: pw.Center(
//                 child: pw.Text(
//                   "Approvals",
//                   style: pw.TextStyle(
//                       color: const PdfColor(0.2, 0.6, 0.2, 0.7),
//                       fontSize: 20.00,
//                       fontWeight: pw.FontWeight.bold),
//                 ),
//               ),
//             ),
//             for (var i = 0; i < 3; i++)
//               pw.Container(
//                 color: i % 2 != 0
//                     ? const PdfColor(0.9, 0.9, 0.9, 0.6)
//                     : const PdfColor(1, 1, 1, 0.1),
//                 width: double.infinity,
//                 height: 36.00,
//                 child: pw.Padding(
//                   padding: const pw.EdgeInsets.symmetric(horizontal: 25.0),
//                   child: pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     children: [
//                       i == 2
//                           ? pw.Text(
//                               "Tax",
//                               style: pw.TextStyle(
//                                   fontSize: 18.00,
//                                   fontWeight: pw.FontWeight.bold),
//                             )
//                           : pw.Text(
//                               "Item ${i + 1}",
//                               style: pw.TextStyle(
//                                   fontSize: 18.00,
//                                   fontWeight: pw.FontWeight.bold),
//                             ),
//                       i == 2
//                           ? pw.Text(
//                               "\$ 2.50",
//                               style: pw.TextStyle(
//                                   fontSize: 18.00,
//                                   fontWeight: pw.FontWeight.normal),
//                             )
//                           : pw.Text(
//                               "\$ ${(i + 1) * 7}.00",
//                               style: pw.TextStyle(
//                                   fontSize: 18.00,
//                                   fontWeight: pw.FontWeight.normal),
//                             ),
//                     ],
//                   ),
//                 ),
//               ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.symmetric(horizontal: 25.0),
//               child: pw.Container(
//                 width: double.infinity,
//                 height: 36.00,
//                 child: pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.end,
//                   children: [
//                     pw.Text(
//                       "\$ 23.50",
//                       style: pw.TextStyle(
//                         fontSize: 22.00,
//                         fontWeight: pw.FontWeight.bold,
//                         color: const PdfColor(0.2, 0.6, 0.2, 0.7),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             pw.SizedBox(height: 15.00),
//             pw.Text(
//               "Thanks for choosing our service!",
//               style: const pw.TextStyle(
//                   color: PdfColor(0.5, 0.5, 0.5, 0.5), fontSize: 15.00),
//             ),
//             pw.SizedBox(height: 5.00),
//             pw.Text(
//               "Contact the branch for any clarifications.",
//               style: const pw.TextStyle(
//                   color: PdfColor(0.5, 0.5, 0.5, 0.5), fontSize: 15.00),
//             ),
//             pw.SizedBox(height: 15.00),
//           ],
//         )
//       ]),
//     );
