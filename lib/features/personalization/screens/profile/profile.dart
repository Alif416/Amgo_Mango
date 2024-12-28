import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/images/circular_image.dart';
import 'package:myapp/common/widgets/loaders/shimmer.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/features/personalization/controllers/user_controller.dart';
import 'package:myapp/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:myapp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const MAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      ///--body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : MImages.user;
                      return controller.imageUploading.value
                          ? const MShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : MCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change profile picture'))
                  ],
                ),
              ),

              ///details
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),

              ///heading profile info
              const MSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems),

              MProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              MProfileMenu(
                  title: 'UserName',
                  value: controller.user.value.username,
                  onPressed: () {}),

              const SizedBox(height: MSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),

              ///Heading personal info
              const MSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems),

              MProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {}),
              MProfileMenu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onPressed: () {}),
              MProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              MProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              MProfileMenu(
                  title: 'Date of Birth',
                  value: '25 Mar, 2002',
                  onPressed: () {}),

              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}