class InvoiceModel {
  String? invoiceNO;
  String? date;
  String? modeOfPayment;
  String? total;
  String? totalInWords;
  List<ItemModel>? item;
  BuyerDetails? buyerDetails;
  SellerDetails? sellerDetails;

  InvoiceModel({
    this.invoiceNO,
    this.date,
    this.modeOfPayment,
    this.total,
    this.buyerDetails,
    this.sellerDetails,
    this.item,
    this.totalInWords,
  });

  Map<String, dynamic> toJson() {
    return {
      'invoiceNO': invoiceNO,
      'date': date,
      'modeOfPayment': modeOfPayment,
      'total': total,
      'totalInWords': totalInWords,
      'item': item?.map((e) => e.toJson()).toList(),
      'buyerDetails': buyerDetails?.toJson(),
      'sellerDetails': sellerDetails?.toJson(),
    };
  }
}

class ItemModel {
  String? particulars;
  String? gst;
  String? rate;
  String? per;
  String? amount;

  ItemModel({
    this.particulars,
    this.gst,
    this.rate,
    this.per,
    this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'particulars': particulars,
      'gst': gst,
      'rate': rate,
      'per': per,
      'amount': amount,
    };
  }
}

class BuyerDetails {
  String? name;
  String? address;
  String? gstNo;

  BuyerDetails({
    this.name,
    this.address,
    this.gstNo,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'gstNo': gstNo,
    };
  }
}

class SellerDetails {
  String? name;
  String? address;
  String? gstNo;

  SellerDetails({
    this.name,
    this.address,
    this.gstNo,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'gstNo': gstNo,
    };
  }
}
