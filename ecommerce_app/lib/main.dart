import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'product.dart'; // Import the ProductPage file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcommerceScreen(),
    );
  }
}

class EcommerceScreen extends StatefulWidget {
  const EcommerceScreen({super.key});

  @override
  State<EcommerceScreen> createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen> {
  int _currentPage = 0;
  final List<Map<String, dynamic>> imgList = [
    {
      "title": "50% Off",
      "subtitle": "On everything today",
      "description": "ALISIRAJ",
    },
    {
      "title": "70% Off",
      "subtitle": "On everything today",
      "description": "ALISIRAJ",
    },
  ];

  // List of bottom navigation items
  final List<TabData> tabs = [
    const TabData(
      iconData: Icons.home_outlined,
      title: "Home",
      tabColor: Colors.black,
    ),
    const TabData(
      iconData: Icons.shopping_cart_checkout_rounded,
      title: "Cart",
      tabColor: Colors.black,
    ),
    const TabData(
      iconData: Icons.notifications_none,
      title: "Notification",
      tabColor: Colors.black,
    ),
    const TabData(
      iconData: Icons.person_3_outlined,
      title: "Profile",
      tabColor: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.view_module_sharp, color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: CubertoBottomBar(
        key: const Key("BottomBar"),
        inactiveIconColor: Colors.black,
        tabStyle: CubertoTabStyle.styleFadedBackground,
        selectedTab: _currentPage,
        tabs: tabs
            .map(
              (value) => TabData(
                key: Key(value.title),
                iconData: value.iconData,
                tabColor: value.tabColor,
                title: _currentPage == tabs.indexOf(value) ? value.title : "",
              ),
            )
            .toList(),
        onTabChangedListener: (position, title, color) {
          setState(() {
            _currentPage = position;
          });
        },
        barBackgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promotions Section
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 7,
                  viewportFraction: 0.6,
                  autoPlay: true,
                ),
                items: imgList
                    .map((item) => _buildPromotionCard(
                          item["title"],
                          item["subtitle"],
                          item["description"],
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              // New Arrivals Section
              _buildSectionHeader("New Arrivals"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCard(
                    imageUrl: 'assets/images/blackleatherbag.jpeg',
                    title: "The Marc Jacobs",
                    subtitle: "Traveler Tote",
                    price: "\$195.00",
                    context: context,
                  ),
                  const SizedBox(width: 20),
                  _buildProductCard(
                    imageUrl: 'assets/images/bluewhite.jpeg',
                    title: "Axel Arigato",
                    subtitle: "Clean 90 Triple Sneakers",
                    price: "\$245.00",
                    context: context,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Popular Section
              _buildSectionHeader("Popular"),
              const SizedBox(height: 10),
              _buildPopularProductCard(
                imageUrl: "assets/images/sandal1.jpeg",
                title: "Gia Borghini",
                subtitle: "FW Rosie Sandals",
                price: "\$740.00",
                rating: 4.6,
              ),
              _buildPopularProductCard(
                imageUrl: "assets/images/briefcase.jpg",
                title: "Dolce & Gabbana",
                subtitle: "Leather Bag",
                price: "\$1000.00",
                rating: 5.0,
              ),
              _buildPopularProductCard(
                imageUrl: "assets/images/lipstick.jpeg",
                title: "Leaf Sea",
                subtitle: "Lipstick",
                price: "\$200.00",
                rating: 2.6,
              ),
              _buildPopularProductCard(
                imageUrl: "assets/images/earring.jpg",
                title: "AS Jewellers",
                subtitle: "Earrings",
                price: "\$400.00",
                rating: 4.3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionCard(String title, String description, String code) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: -70,
              child: Image.asset(
                "assets/images/baghanging.jpeg",
                height: 250,
                width: MediaQuery.of(context).size.width / 1.0,
              ),
            ),
            Positioned(
              top: 12,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "With code: $code",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Define the button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 22,
                        ),
                      ),
                      child: const Text(
                        'Get Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          "View All",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        if (title == "Axel Arigato") { // Condition to navigate only for this product
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductPage()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width / 2.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularProductCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
    required double rating,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
