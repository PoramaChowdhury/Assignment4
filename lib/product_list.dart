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
              title: Text(item.name),
              subtitle: Row(
                children: [
                  Text('Color : ${item.color}'),
                  const SizedBox(width: 8),
                  Text('Size : ${item.size}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        _updateQuantity(index, item.quantity -  1);
                      },
                      icon: const Icon(Icons.remove_circle_outline)),
                  Text('${item.quantity}'),
                  IconButton(
                      onPressed: () {
                        _updateQuantity(index, item.quantity + 1);
                      },
                      icon: const Icon(Icons.add_circle_outline)),
                  Text('\$${item.price * item.quantity}'),
                ],
              ),
            );
          }),
        bottomSheet: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total amount:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$$total', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(height: 16),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Congratulation'))
          );
        },
          child: const Text('CHECK OUT',style: TextStyle(
            color: Colors.white,
          ),),
        ),
    );
  }

  void _updateQuantity(int index, int quantity){
    setState(() {
       items[index].quantity = quantity;
       _totalAmount();
    });
  }

  double total = 0;

  void _totalAmount(){
    setState(() {
      for(CartItem t in items){
        total += t.price * t.quantity;
      }
    });
  }

}
