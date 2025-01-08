// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/auth_provider.dart';
// import 'screens/home/home_screen.dart';
// import 'screens/home/product_grid.dart';
// import 'screens/login/login_screen.dart';
// import 'screens/login/otp_screen.dart';
// import 'screens/profile/profile_screen.dart';
// import 'screens/wishlist/wishlist_screen.dart';
// import 'screens/search/search_screen.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Product Listing App',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//       ),
//       initialRoute: '/',
//       home:  ProductListScreen(),
//       routes: {
//         // '/': (context) => const LoginScreen(),
//         // '/otp': (context) => const OTPVerificationScreen(),
//         '/home': (context) =>  ProductListScreen(),
//         '/profile': (context) => const ProfileScreen(),
//         '/wishlist': (context) => const WishlistScreen(),
//         '/search': (context) => const SearchScreen(),
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:product_listing_app/models/product.dart';
// import 'api/product_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Product Listing',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Home'),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Home'),
//               Tab(text: 'Products'),
//               Tab(text: 'Profile'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             HomeTab(),
//             ProductTab(),
//             ProfileTab(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Bar
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search products...',
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),

//               // Sliding Banner
//               CarouselSlider(
//                 items: [
//                   Image.network(
//                     'https://via.placeholder.com/800x200.png?text=Banner+1',
//                     fit: BoxFit.cover,
//                   ),
//                   Image.network(
//                     'https://via.placeholder.com/800x200.png?text=Banner+2',
//                     fit: BoxFit.cover,
//                   ),
//                   Image.network(
//                     'https://via.placeholder.com/800x200.png?text=Banner+3',
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//                 options: CarouselOptions(
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 16 / 9,
//                   viewportFraction: 1.0,
//                 ),
//               ),

//               // Product Grid Header
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//                 child: Text(
//                   'Products',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),]
//           )
//               // Product Grid
//               ListView(
//                 children: [
//               FutureBuilder<List<Product>>(
//                 future: ProductService().fetchProducts(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Failed to load products'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No products available'));
//                   } else {
//                     List<Product> products = snapshot.data!;
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GridView.builder(
//                         physics: NeverScrollableScrollPhysics(), // Prevent grid from scrolling
//                         shrinkWrap: true, // Allow GridView inside SingleChildScrollView
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                           childAspectRatio: 0.75,
//                         ),
//                         itemCount: products.length,
//                         itemBuilder: (context, index) {
//                           Product product = products[index];
//                           return ProductCard(product: product);
//                         },
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProductTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Product>>(
//       future: ProductService().fetchProducts(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Failed to load products'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No products available'));
//         } else {
//           List<Product> products = snapshot.data!;
//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               Product product = products[index];
//               return ProductCard(product: product);
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class ProfileTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Example Profile
//     String userName = "John Doe";
//     String phoneNumber = "123-456-7890";

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ListView(
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Name: $userName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 10),
//           Text('Phone Number: $phoneNumber', style: TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Product product;

//   ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(product.imageUrl, fit: BoxFit.cover, height: 150, width: double.infinity),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   product.description,
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '₹${product.salePrice}',
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
//                     ),
//                     Text(
//                       '₹${product.mrp}',
//                       style: TextStyle(fontSize: 12, color: Colors.red, decoration: TextDecoration.lineThrough),
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.favorite_border, color: Colors.red),
//                   onPressed: () {
//                     // Add to wishlist functionality
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/product_grid.dart';
import 'screens/profile/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Listing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ProductListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'WishList'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
