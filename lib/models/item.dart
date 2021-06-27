class Item {
  Item({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.previousPrice,
    this.porcentageDiscount,
  });

  final String name;
  final String description;
  final String image;
  final double price;
  final double? previousPrice;
  final double? porcentageDiscount;
}
