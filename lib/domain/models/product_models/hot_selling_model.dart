class HotSellingModel {
  HotSellingModel({
    this.message,
    this.status,
    this.data,
  });

  final String? message;
  static const String messageKey = "message";

  final bool? status;
  static const String statusKey = "status";

  final HotSellingData? data;
  static const String dataKey = "data";

  HotSellingModel copyWith({
    String? message,
    bool? status,
    HotSellingData? data,
  }) {
    return HotSellingModel(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory HotSellingModel.fromJson(Map<String, dynamic> json) {
    return HotSellingModel(
      message: json["message"] ?? "",
      status: json["status"] ?? false,
      data: json["data"] == null ? null : HotSellingData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };

  @override
  String toString() {
    return "$message, $status, $data, ";
  }
}

class HotSellingData {
  HotSellingData({
    required this.products,
  });

  final List<HotSellingProduct> products;
  static const String productsKey = "products";

  HotSellingData copyWith({
    List<HotSellingProduct>? products,
  }) {
    return HotSellingData(
      products: products ?? this.products,
    );
  }

  factory HotSellingData.fromJson(Map<String, dynamic> json) {
    return HotSellingData(
      products: json["products"] == null
          ? []
          : List<HotSellingProduct>.from(
              json["products"]!.map((x) => HotSellingProduct.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "products": products.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$products, ";
  }
}

class HotSellingProduct {
  HotSellingProduct({
    required this.product,
  });

  final OneHotProduct? product;
  static const String productKey = "product";

  HotSellingProduct copyWith({
    OneHotProduct? product,
  }) {
    return HotSellingProduct(
      product: product ?? this.product,
    );
  }

  factory HotSellingProduct.fromJson(Map<String, dynamic> json) {
    return HotSellingProduct(
      product: json["product"] == null
          ? null
          : OneHotProduct.fromJson(json["product"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
      };

  @override
  String toString() {
    return "$product, ";
  }
}

class OneHotProduct {
  OneHotProduct({
    required this.name,
    required this.descreption,
    required this.mainCategorie,
    required this.productClass,
    required this.offers,
    required this.mainImage,
  });

  final String name;
  static const String nameKey = "name";

  final String descreption;
  static const String descreptionKey = "descreption";

  final String mainCategorie;
  static const String mainCategorieKey = "mainCategorie";

  final List<HotProClassification> productClass;
  static const String productClassKey = "Class";

  final List<HotSellingProductOffer> offers;
  static const String offersKey = "offers";

  final String mainImage;
  static const String mainImageKey = "mainImage";

  OneHotProduct copyWith({
    String? name,
    String? descreption,
    String? mainCategorie,
    List<HotProClassification>? productClass,
    List<HotSellingProductOffer>? offers,
    String? mainImage,
  }) {
    return OneHotProduct(
      name: name ?? this.name,
      descreption: descreption ?? this.descreption,
      mainCategorie: mainCategorie ?? this.mainCategorie,
      productClass: productClass ?? this.productClass,
      offers: offers ?? this.offers,
      mainImage: mainImage ?? this.mainImage,
    );
  }

  factory OneHotProduct.fromJson(Map<String, dynamic> json) {
    return OneHotProduct(
      name: json["name"] ?? "",
      descreption: json["descreption"] ?? "",
      mainCategorie: json["mainCategorie"] ?? "",
      productClass: json["Class"] == null
          ? []
          : List<HotProClassification>.from(
              json["Class"]!.map((x) => HotProClassification.fromJson(x))),
      offers: json["offers"] == null
          ? []
          : List<HotSellingProductOffer>.from(
              json["offers"]!.map((x) => HotSellingProductOffer.fromJson(x))),
      mainImage: json["mainImage"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "descreption": descreption,
        "mainCategorie": mainCategorie,
        "Class": productClass.map((x) => x?.toJson()).toList(),
        "offers": offers.map((x) => x?.toJson()).toList(),
        "mainImage": mainImage,
      };

  @override
  String toString() {
    return "$name, $descreption, $mainCategorie, $productClass, $offers, $mainImage, ";
  }
}

class HotSellingProductOffer {
  HotSellingProductOffer({
    required this.valueOfOffer,
    required this.typeOfOffer,
    required this.startDateOfOffers,
    required this.endDateOfOffers,
    required this.activeUser,
    required this.id,
  });

  final int valueOfOffer;
  static const String valueOfOfferKey = "valueOfOffer";

  final String typeOfOffer;
  static const String typeOfOfferKey = "typeOfOffer";

  final DateTime? startDateOfOffers;
  static const String startDateOfOffersKey = "startDateOfOffers";

  final DateTime? endDateOfOffers;
  static const String endDateOfOffersKey = "endDateOfOffers";

  final bool activeUser;
  static const String activeUserKey = "ActiveUser";

  final String id;
  static const String idKey = "_id";

  HotSellingProductOffer copyWith({
    int? valueOfOffer,
    String? typeOfOffer,
    DateTime? startDateOfOffers,
    DateTime? endDateOfOffers,
    bool? activeUser,
    String? id,
  }) {
    return HotSellingProductOffer(
      valueOfOffer: valueOfOffer ?? this.valueOfOffer,
      typeOfOffer: typeOfOffer ?? this.typeOfOffer,
      startDateOfOffers: startDateOfOffers ?? this.startDateOfOffers,
      endDateOfOffers: endDateOfOffers ?? this.endDateOfOffers,
      activeUser: activeUser ?? this.activeUser,
      id: id ?? this.id,
    );
  }

  factory HotSellingProductOffer.fromJson(Map<String, dynamic> json) {
    return HotSellingProductOffer(
      valueOfOffer: json["valueOfOffer"] ?? 0,
      typeOfOffer: json["typeOfOffer"] ?? "",
      startDateOfOffers: DateTime.tryParse(json["startDateOfOffers"] ?? ""),
      endDateOfOffers: DateTime.tryParse(json["endDateOfOffers"] ?? ""),
      activeUser: json["ActiveUser"] ?? false,
      id: json["_id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "valueOfOffer": valueOfOffer,
        "typeOfOffer": typeOfOffer,
        "startDateOfOffers": startDateOfOffers?.toIso8601String(),
        "endDateOfOffers": endDateOfOffers?.toIso8601String(),
        "ActiveUser": activeUser,
        "_id": id,
      };

  @override
  String toString() {
    return "$valueOfOffer, $typeOfOffer, $startDateOfOffers, $endDateOfOffers, $activeUser, $id, ";
  }
}

class HotProClassification {
  HotProClassification({
    required this.size,
    required this.length,
    required this.width,
    required this.price,
    required this.sallableInPoints,
    required this.group,
    required this.id,
    required this.priceAfterDiscount,
  });

  final String size;
  static const String sizeKey = "size";

  final int length;
  static const String lengthKey = "length";

  final int width;
  static const String widthKey = "width";

  final int price;
  static const String priceKey = "price";

  final bool sallableInPoints;
  static const String sallableInPointsKey = "sallableInPoints";

  final List<HotSellingProGroup> group;
  static const String groupKey = "group";

  final String id;
  static const String idKey = "_id";

  final int priceAfterDiscount;
  static const String priceAfterDiscountKey = "priceAfterDiscount";

  HotProClassification copyWith({
    String? size,
    int? length,
    int? width,
    int? price,
    bool? sallableInPoints,
    List<HotSellingProGroup>? group,
    String? id,
    int? priceAfterDiscount,
  }) {
    return HotProClassification(
      size: size ?? this.size,
      length: length ?? this.length,
      width: width ?? this.width,
      price: price ?? this.price,
      sallableInPoints: sallableInPoints ?? this.sallableInPoints,
      group: group ?? this.group,
      id: id ?? this.id,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    );
  }

  factory HotProClassification.fromJson(Map<String, dynamic> json) {
    return HotProClassification(
      size: json["size"] ?? "",
      length: json["length"] ?? 0,
      width: json["width"] ?? 0,
      price: json["price"] ?? 0,
      sallableInPoints: json["sallableInPoints"] ?? false,
      group: json["group"] == null
          ? []
          : List<HotSellingProGroup>.from(
              json["group"]!.map((x) => HotSellingProGroup.fromJson(x))),
      id: json["_id"] ?? "",
      priceAfterDiscount: json["priceAfterDiscount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "size": size,
        "length": length,
        "width": width,
        "price": price,
        "sallableInPoints": sallableInPoints,
        "group": group.map((x) => x?.toJson()).toList(),
        "_id": id,
        "priceAfterDiscount": priceAfterDiscount,
      };

  @override
  String toString() {
    return "$size, $length, $width, $price, $sallableInPoints, $group, $id, $priceAfterDiscount, ";
  }
}

class HotSellingProGroup {
  HotSellingProGroup({
    required this.color,
    required this.quantity,
    required this.id,
  });

  final String color;
  static const String colorKey = "color";

  final int quantity;
  static const String quantityKey = "quantity";

  final String id;
  static const String idKey = "_id";

  HotSellingProGroup copyWith({
    String? color,
    int? quantity,
    String? id,
  }) {
    return HotSellingProGroup(
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }

  factory HotSellingProGroup.fromJson(Map<String, dynamic> json) {
    return HotSellingProGroup(
      color: json["color"] ?? "",
      quantity: json["quantity"] ?? 0,
      id: json["_id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "color": color,
        "quantity": quantity,
        "_id": id,
      };

  @override
  String toString() {
    return "$color, $quantity, $id, ";
  }
}
