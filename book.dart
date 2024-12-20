import 'package:flutter/material.dart';


void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce Amo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerImages = [
    'assets/banner.avif',
    'assets/banner.avif',
    'assets/banner.avif',
    'assets/banner.avif',
    'assets/banner.avif',
  ];

  int _currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce Amo'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Banner Images Section (Horizontal Scroll with PageView)
          SizedBox(
            height: 150,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  itemCount: bannerImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentBannerIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(bannerImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(bannerImages.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentBannerIndex == index
                            ? Colors.white
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          // Categories Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          // Categories Row - Men, Women, Books, Children
          CategoryRow(
            categoryImages: [
              'assets/fibo e 3.jpg', // Image for Men
              'assets/femal.jpg', // Image for Women
              'assets/store.jpg', // Image for Books
              'assets/fibo e 4.jpg', // Image for Children
            ],
            categoryNames: ['Men', 'Women', 'Books', 'Children'],
            categoryDescriptions: [
              'Fashion for Men', // Description for Men
              'Trendy Styles for Women', // Description for Women
              'Explore the Best Books', // Description for Books
              'Toys & Clothes for Kids', // Description for Children
            ],
          ),
          // Fashion Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Fashion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          // Fashion Row - Jackets, Shoes, Dresses, Bags
          CategoryRow(
            categoryImages: [
              'assets/jacket.webp', // Image for Jackets
              'assets/jacket.webp', // Image for Shoes
              'assets/fibo e .jpg', // Image for Dresses
              'assets/bags.jpg', // Image for Bags
            ],
            categoryNames: ['Jackets', 'Shoes', 'Dresses', 'Bags'],
            categoryDescriptions: [
              'Warm and Stylish Jackets', // Description for Jackets
              'Comfortable & Trendy Shoes', // Description for Shoes
              'Dresses Every Occasion', // Description for Dresses
              ' Bags for Your Style', // Description for Bags
            ],
            backgroundColor: Colors.black // Grey background for the Fashion section
          ),
        ],
      ),
    );
  }
}

class CategoryRow extends StatelessWidget {
  final List<String> categoryImages;
  final List<String> categoryNames;
  final List<String> categoryDescriptions;
  final Color? backgroundColor;

  const CategoryRow({
    required this.categoryImages,
    required this.categoryNames,
    required this.categoryDescriptions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: backgroundColor ?? Colors.transparent,
        child: Column(
          children: [
            // Categories Container
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemsPage(category: categoryNames[index])),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 125,
                              height: 115,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(categoryImages[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              categoryNames[index],
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              categoryDescriptions[index],
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10), // Space between rows
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemsPage(category: categoryNames[index + 2])),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 125,
                              height: 115,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(categoryImages[index + 2]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              categoryNames[index + 2],
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              categoryDescriptions[index + 2],
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ItemsPage extends StatelessWidget {
  final String category;

  ItemsPage({required this.category});

  final Map<String, List<Map<String, String>>> items = {
    'Men': [
      {'name': 'Shirt', 'description': 'Casual Cotton Shirt', 'image': 'assets/men.jpg', 'price': '50'},
      {'name': 'Pant', 'description': 'Comfortable Jeans', 'image': 'assets/raj prakrash.jpg', 'price': '70'},
      {'name': 'Jacket', 'description': 'Stylish Jacket', 'image': 'assets/men.jpg', 'price': '100'},
      {'name': 'Shoes', 'description': 'Running Shoes', 'image': 'assets/men.jpg', 'price': '80'},
    ],
    'Women': [
      {'name': 'Dress', 'description': 'Elegant Evening Dress', 'image': 'assets/jacket.webp', 'price': '120'},
      {'name': 'Skirt', 'description': 'Floral Skirt', 'image': 'assets/jacket.webp', 'price': '45'},
      {'name': 'Blouse', 'description': 'Silk Blouse', 'image': 'assets/dress.webp', 'price': '60'},
      {'name': 'Handbag', 'description': 'Leather Handbag', 'image': 'assets/dress.webp', 'price': '95'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category'),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 1,
          mainAxisSpacing: 16,
        ),
        itemCount: items[category]?.length ?? 0,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[category]![index],
            onAddToCart: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    itemName: items[category]![index]['name']!,
                    itemPrice: double.parse(items[category]![index]['price']!),
                    itemImage: items[category]![index]['image']!,
                    deliveryDate: '2024-11-15',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Map<String, String> item;
  final VoidCallback onAddToCart;

  const ItemCard({required this.item, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item['name']!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['description']!,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: onAddToCart,
            child: Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
class CartPage extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final String itemImage;
  final String deliveryDate;

  CartPage({
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.black,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cart Item Details
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  // Item Image
                  Image.asset(
                    itemImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  // Item Name and Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$$itemPrice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Order Summary
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Price: \$${itemPrice}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Delivery Date: $deliveryDate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Total Cost
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${itemPrice}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Checkout Button
            ElevatedButton(
              onPressed: () {
                // Handle Checkout
              },
              child: Text('Proceed to Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}