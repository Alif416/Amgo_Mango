import 'package:get/get.dart';
import 'package:myapp/data/repositories/banners_repository.dart';
import 'package:myapp/features/shop/models/banner_model.dart';
import 'package:myapp/utils/helpers/loaders.dart';

class BannerController extends GetxController {

  ///variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  ///update page navigational dots
  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }

  ///fetch banners
  Future<void> fetchBanners() async {
    try{
      //show loader while loading categories
      isLoading.value = true;

      //fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //assign banners
      this.banners.assignAll(banners);

    } catch (e) {
      MLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }finally{
      //remove loader
      isLoading.value = false;
    }
  }
}