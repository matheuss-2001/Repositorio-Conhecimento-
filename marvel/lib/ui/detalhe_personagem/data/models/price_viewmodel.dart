class PriceViewmodel {
  final String type;
  final double price;

  PriceViewmodel({
    required this.type,
    required this.price,
  });

  factory PriceViewmodel.fromJson(Map<String, dynamic> json) {
    return PriceViewmodel(
      type: json['type'] ?? "",
      price: json['price'].toDouble() ?? 0.0,
    );
  }
}
