
import 'package:myapp/features/shop/models/banner_model.dart';
import 'package:myapp/features/shop/models/category_model.dart';
import 'package:myapp/routes/routes.dart';
import 'package:myapp/utils/constants/image_strings.dart';



class TDummyData {
  /// -- list of all banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: MImages.promoBanner1, active: false, targetScreen: MRoutes.order),
    BannerModel(imageUrl: MImages.promoBanner2, active: true, targetScreen: MRoutes.cart),
    BannerModel(imageUrl: MImages.promoBanner3, active: true, targetScreen: MRoutes.favorites),
    BannerModel(imageUrl: MImages.promoBanner4, active: true, targetScreen: MRoutes.search),
    BannerModel(imageUrl: MImages.promoBanner5, active: true, targetScreen: MRoutes.settings),
    BannerModel(imageUrl: MImages.promoBanner6, active: true, targetScreen: MRoutes.userAddress),
    BannerModel(imageUrl: MImages.promoBanner8, active: true, targetScreen: MRoutes.checkout),
  ];

  ///-- list of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: MImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: MImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: MImages.smartphoneIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: MImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: MImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: MImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: MImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: MImages.jewelryIcon, name: 'Jewelry', isFeatured: true),

    //sub categories
    CategoryModel(id: '8', image: MImages.sportIcon, name: 'Sports Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: MImages.sportIcon, name: 'Track Suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: MImages.sportIcon, name: 'Sports Equipment', parentId: '1', isFeatured: false),

    //furniture
    CategoryModel(id: '11', image: MImages.furnitureIcon, name: 'Bedroom Furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: MImages.furnitureIcon, name: 'Kitchen Furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: MImages.furnitureIcon, name: 'Office Furniture', parentId: '5', isFeatured: false),

    //electronics
    CategoryModel(id: '14', image: MImages.smartphoneIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: MImages.smartphoneIcon, name: 'mobile', parentId: '2', isFeatured: false),

    CategoryModel(id: '16', image: MImages.clothIcon, name: 'Clothes', parentId: '3', isFeatured: false),
  ];
}