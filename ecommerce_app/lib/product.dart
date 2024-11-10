import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/bluewhite.jpeg', // replace with your image path
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 8, color: Colors.grey[400]),
                  const SizedBox(width: 8),
                  Icon(Icons.circle, size: 8, color: Colors.grey[400]),
                  const SizedBox(width: 8),
                  const Icon(Icons.circle, size: 8, color: Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Axel Arigato',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Clean 90 Triple Sneakers',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text(
                  '4.5',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  ' (270 Review)',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [39, 39.5, 40, 40.5, 41].map((size) {
                return ChoiceChip(
                  label: Text(size.toString()),
                  selected: size == 41, // default selected size
                  onSelected: (selected) {},
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Engineered to crush any movement-based workout, these '
              'sneakers enhance the label\'s original Cloud sneaker '
              'with cutting-edge technologies for a pair.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  '\$245.00',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(), // Spacer to push the button to the right
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      SizedBox(width: 8), // Space between icon and text
                      Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
