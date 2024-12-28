import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/bindings/general_bindings.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme:  MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      ///show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen
      home: const Scaffold(backgroundColor: MColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}