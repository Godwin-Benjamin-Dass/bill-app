import 'package:bill_app/models/invoice_model.dart';
import 'package:pdf/widgets.dart' as pw;

buildPrintableData(
  InvoiceModel im,
) {
  return pw.Column(
    children: [
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
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
                        pw.Text("GST NO:${im.sellerDetails!.gstNo}"),
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
                          width: 80,
                          child: pw.Text(item.per!),
                        ),
                        pw.Container(
                          width: 90,
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(item.amount!),
                        ),
                      ],
                    );
                  }),
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
                height: 10,
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
                      pw.Text("for ${im.sellerDetails!.name}"),
                      pw.Text("Authorised Signature"),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Center(child: pw.Text("Generated by Bill App"))
            ],
          ),
        ),
      ),
    ],
  );
}
