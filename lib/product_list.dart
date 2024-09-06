
import 'package:flutter/material.dart';
import 'package:ostad_assignment/cartItem.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  List<CartItem> items = [
    CartItem(
        name: 'PullOver',
        color: 'Black',
        size: "L",
        price: 51,
        imageAsset: 'asset/images/tshirt.jpg'),
    CartItem(
        name: 'T-Shirt',
        color: 'Gray',
        size: "L",
        price: 30,
        imageAsset: 'asset/images/tshirt.jpg'),
    CartItem(
        name: 'Sport Dress',
        color: 'Black',
        size: "M",
        price: 43,
        imageAsset: 'asset/images/tshirt.jpg')
  ];

  double total = 0;

  @override
  void initState() {
    super.initState();
    _totalAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bag',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Image.asset(
              item.imageAsset,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item.name, style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            subtitle: Row(
              children: [
                Text("Color: ${item.color}", style: const TextStyle(
                  color: Colors.grey,
                ),),
                const SizedBox(width: 8),
                Text('Size: ${item.size}', style: const TextStyle(
                  color: Colors.grey,
                ),),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    if (item.quantity > 1) {
                      _updateQuantity(index, item.quantity - 1);
                    }
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('${item.quantity}'),
                IconButton(
                  onPressed: () {
                    _updateQuantity(index, item.quantity + 1);
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
                Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.grey[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total amount:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Congratulations'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text(
                  'CHECK OUT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateQuantity(int index, int quantity) {
    setState(() {
      items[index].quantity = quantity;
      _totalAmount();
    });
  }

  void _totalAmount() {
    double tempTotal = 0;
    for (CartItem t in items) {
      tempTotal += t.price * t.quantity;
    }
    setState(() {
      total = tempTotal;
    });
  }
}
