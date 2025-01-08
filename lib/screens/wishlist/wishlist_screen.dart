// import 'package:product_listing_app/models/product.dart';

// class WishlistManager {
//   static List<Product> wishlistProducts = [];

//   static void addToWishlist(Product product) {
//     if (!wishlistProducts.contains(product)) {
//       wishlistProducts.add(product);
//     }
//   }

//   static void removeFromWishlist(Product product) {
//     wishlistProducts.remove(product);
//   }

//   static bool isInWishlist(Product product) {
//     return wishlistProducts.contains(product);
//   }
// }

// import '../../models/product.dart';

// class WishlistManager {
//   static List<Product> wishlistProducts = [];

//   static void toggleWishlist(Product product) {
//     product.inWishlist = !product.inWishlist;
//     if (product.inWishlist) {
//       if (!wishlistProducts.contains(product)) {
//         wishlistProducts.add(product);
//       }
//     } else {
//       wishlistProducts.remove(product);
//     }
//   }
// }


import '../../models/product.dart';

class WishlistManager {
  static List<Product> wishlistProducts = [];
  static Set<int> wishlistProductIds = {}; // Keep track of product IDs in wishlist

  static void toggleWishlist(Product product) {
    if (wishlistProductIds.contains(product.id)) {
      // Remove from wishlist
      product.inWishlist = false;
      wishlistProducts.removeWhere((p) => p.id == product.id);
      wishlistProductIds.remove(product.id);
    } else {
      // Add to wishlist
      product.inWishlist = true;
      wishlistProducts.add(product);
      wishlistProductIds.add(product.id);
    }
  }

  static bool isInWishlist(int productId) {
    return wishlistProductIds.contains(productId);
  }
}