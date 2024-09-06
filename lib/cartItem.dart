class CartItem {

  final String name;
  final String color;
  final String size;
  final int price;
  final String imageAsset;
  int quantity ;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.imageAsset,
    this.quantity = 0,
  });
}