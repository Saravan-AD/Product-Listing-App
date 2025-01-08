
class BannerApiModel {
  final int id;
  final String name;
  final String image;
  final int showingOrder;
  final bool isActive;
  final ProductBanner? product;

  BannerApiModel({
    required this.id,
    required this.name,
    required this.image,
    required this.showingOrder,
    required this.isActive,
    this.product,
  });

  factory BannerApiModel.fromJson(Map<String, dynamic> json) {
    return BannerApiModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      showingOrder: json['showing_order'] ?? 0,
      isActive: json['is_active'] ?? false,
      product: json['product'] != null
          ? ProductBanner.fromJson(json['product'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'showing_order': showingOrder,
      'is_active': isActive,
      'product': product?.toJson(),
    };
  }
}

class ProductBanner {
  final int id;
  final String name;
  final String description;
  final String caption;
  final String featuredImage;
  final List<String> images;
  final bool inWishlist;
  final double avgRating;
  final double salePrice;
  final double mrp;
  final double discount;
  final int stock;
  final String productType;
  final int category;
  final int taxRate;
  final bool isActive;
  final bool available;
  final String availableFrom;
  final String availableTo;
  final List<Addon> addons;

  ProductBanner({
    required this.id,
    required this.name,
    required this.description,
    required this.caption,
    required this.featuredImage,
    required this.images,
    required this.inWishlist,
    required this.avgRating,
    required this.salePrice,
    required this.mrp,
    required this.discount,
    required this.stock,
    required this.productType,
    required this.category,
    required this.taxRate,
    required this.isActive,
    required this.available,
    required this.availableFrom,
    required this.availableTo,
    required this.addons,
  });

  factory ProductBanner.fromJson(Map<String, dynamic> json) {
    var images = json['images'] != null
        ? List<String>.from(json['images'])
        : [];
    var addons = json['addons'] != null
        ? (json['addons'] as List)
            .map((addon) => Addon.fromJson(addon))
            .toList()
        : [];
    return ProductBanner(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      caption: json['caption'],
      featuredImage: json['featured_image'],
      images: images[0],
      inWishlist: json['in_wishlist'],
      avgRating: json['avg_rating'].toDouble(),
      salePrice: json['sale_price'].toDouble(),
      mrp: json['mrp'].toDouble(),
      discount: double.tryParse(json['discount'].toString()) ?? 0.0,
      stock: json['stock'],
      productType: json['product_type'],
      category: json['category'],
      taxRate: json['tax_rate'],
      isActive: json['is_active'],
      available: json['available'] ?? false,
      availableFrom: json['available_from'],
      availableTo: json['available_to'],
      addons: addons[0],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'caption': caption,
      'featured_image': featuredImage,
      'images': images,
      'in_wishlist': inWishlist,
      'avg_rating': avgRating,
      'sale_price': salePrice,
      'mrp': mrp,
      'discount': discount,
      'stock': stock,
      'product_type': productType,
      'category': category,
      'tax_rate': taxRate,
      'is_active': isActive,
      'available': available,
      'available_from': availableFrom,
      'available_to': availableTo,
      'addons': addons.map((addon) => addon.toJson()).toList(),
    };
  }
}

class Addon {
  final int id;
  final String name;
  final String description;
  final String featuredImage;
  final double price;
  final int stock;
  final bool isActive;
  final int taxRate;

  Addon({
    required this.id,
    required this.name,
    required this.description,
    required this.featuredImage,
    required this.price,
    required this.stock,
    required this.isActive,
    required this.taxRate,
  });

  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      featuredImage: json['featured_image'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      isActive: json['is_active'],
      taxRate: json['tax_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'featured_image': featuredImage,
      'price': price,
      'stock': stock,
      'is_active': isActive,
      'tax_rate': taxRate,
    };
  }
}
