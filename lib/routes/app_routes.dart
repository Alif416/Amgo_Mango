import 'package:get/get.dart';
import 'package:myapp/features/authentication/screens/login/login.dart';
import 'package:myapp/features/authentication/screens/onboarding/onboarding.dart';
import 'package:myapp/features/authentication/screens/password%20configuration/forget_password.dart';
import 'package:myapp/features/authentication/screens/signup/signup.dart';
import 'package:myapp/features/authentication/screens/signup/verify_email.dart';
import 'package:myapp/features/personalization/screens/adress/address.dart';
import 'package:myapp/features/personalization/screens/profile/profile.dart';
import 'package:myapp/features/personalization/screens/settings/settings.dart';
import 'package:myapp/features/shop/screens/cart/cart.dart';
import 'package:myapp/features/shop/screens/checkout/checkout.dart';
import 'package:myapp/features/shop/screens/home/home.dart';
import 'package:myapp/features/shop/screens/order/order.dart';
import 'package:myapp/features/shop/screens/products_reviews/product_reviews.dart';
import 'package:myapp/features/shop/screens/store/store.dart';
import 'package:myapp/features/shop/screens/wishlist/wishlist.dart';
import 'package:myapp/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: MRoutes.home, page: () => const HomeScreen()),
    GetPage(name: MRoutes.store, page: () => const StoreScreen()),
    GetPage(name: MRoutes.favorites, page: () => const FavouriteScreen()),
    GetPage(name: MRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: MRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: MRoutes.order, page: () => const OrderScreen()),
    GetPage(name: MRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: MRoutes.cart, page: () => const CartScreen()),
    GetPage(name: MRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: MRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: MRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: MRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: MRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: MRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: MRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}