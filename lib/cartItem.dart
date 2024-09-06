class CartItem {

  final String name;
  final String color;
  final String size;
  final int price;
  final String imageAsset;
  int quantity = 1;

  CartItem({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.imageAsset,
  });
}