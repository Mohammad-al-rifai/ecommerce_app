class MerchantProductsModel {
  MerchantProductsModel({
    this.message,
    this.status,
    this.data,
  });

  final String? message;
  final bool? status;
  final MerchantProductsData? data;

  MerchantProductsModel copyWith({
    String? message,
    bool? status,
    MerchantProductsData? data,
  }) {
    return MerchantProductsModel(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory MerchantProductsModel.fromJson(Map<String, dynamic> json) {
    return MerchantProductsModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? null
          : MerchantProductsData.fromJson(json["data"]),
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

class MerchantProductsData {
  MerchantProductsData({
    required this.products,
  });

  final List<MerchantProduct> products;

  MerchantProductsData copyWith({
    List<MerchantProduct>? products,
  }) {
    return MerchantProductsData(
      products: products ?? this.products,
    );
  }

  factory MerchantProductsData.fromJson(Map<String, dynamic> json) {
    return MerchantProductsData(
      products: json["products"] == null
          ? []
          : List<MerchantProduct>.from(
              json["products"]!.map((x) => MerchantProduct.fromJson(x))),
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

class MerchantProduct {
  MerchantProduct({
    required this.id,
    required this.name,
    required this.mainCategorie,
    required this.productClass,
    required this.guarantee,
    required this.manufacturingMaterial,
    required this.mainImage,
  });

  final String? id;
  final String? name;
  final String? mainCategorie;
  final List<MerchantProductClass> productClass;
  final int? guarantee;
  final String? manufacturingMaterial;
  final String? mainImage;

  MerchantProduct copyWith({
    String? id,
    String? name,
    String? mainCategorie,
    List<MerchantProductClass>? productClass,
    int? guarantee,
    String? manufacturingMaterial,
    String? mainImage,
  }) {
    return MerchantProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      mainCategorie: mainCategorie ?? this.mainCategorie,
      productClass: productClass ?? this.productClass,
      guarantee: guarantee ?? this.guarantee,
      manufacturingMaterial:
          manufacturingMaterial ?? this.manufacturingMaterial,
      mainImage: mainImage ?? this.mainImage,
    );
  }

  factory MerchantProduct.fromJson(Map<String, dynamic> json) {
    return MerchantProduct(
      id: json["_id"],
      name: json["name"],
      mainCategorie: json["mainCategorie"],
      productClass: json["Class"] == null
          ? []
          : List<MerchantProductClass>.from(
              json["Class"]!.map((x) => MerchantProductClass.fromJson(x))),
      guarantee: json["Guarantee"],
      manufacturingMaterial: json["manufacturingMaterial"],
      mainImage: json["mainImage"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "mainCategorie": mainCategorie,
        "Class": productClass.map((x) => x?.toJson()).toList(),
        "Guarantee": guarantee,
        "manufacturingMaterial": manufacturingMaterial,
        "mainImage": mainImage,
      };

  @override
  String toString() {
    return "$id, $name, $mainCategorie, $productClass, $guarantee, $manufacturingMaterial, $mainImage, ";
  }
}

class MerchantProductClass {
  MerchantProductClass({
    required this.size,
    required this.length,
    required this.width,
    required this.price,
    required this.sallableInPoints,
    required this.group,
    required this.id,
    required this.priceAfterDiscount,
  });

  final String? size;
  final int? length;
  final int? width;
  final int? price;
  final bool? sallableInPoints;
  final List<MerchantProductGroup> group;
  final String? id;
  final int? priceAfterDiscount;

  MerchantProductClass copyWith({
    String? size,
    int? length,
    int? width,
    int? price,
    bool? sallableInPoints,
    List<MerchantProductGroup>? group,
    String? id,
    int? priceAfterDiscount,
  }) {
    return MerchantProductClass(
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

  factory MerchantProductClass.fromJson(Map<String, dynamic> json) {
    return MerchantProductClass(
      size: json["size"],
      length: json["length"],
      width: json["width"],
      price: json["price"],
      sallableInPoints: json["sallableInPoints"],
      group: json["group"] == null
          ? []
          : List<MerchantProductGroup>.from(
              json["group"]!.map((x) => MerchantProductGroup.fromJson(x))),
      id: json["_id"],
      priceAfterDiscount: json["priceAfterDiscount"],
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

class MerchantProductGroup {
  MerchantProductGroup({
    required this.color,
    required this.quantity,
    required this.id,
  });

  final String? color;
  final int? quantity;
  final String? id;

  MerchantProductGroup copyWith({
    String? color,
    int? quantity,
    String? id,
  }) {
    return MerchantProductGroup(
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }

  factory MerchantProductGroup.fromJson(Map<String, dynamic> json) {
    return MerchantProductGroup(
      color: json["color"],
      quantity: json["quantity"],
      id: json["_id"],
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
