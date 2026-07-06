import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/routing/router_generated_config.dart';
import 'package:masrophy_app/core/theme/app_theme.dart';

class MasrophyApp extends StatelessWidget {
  const MasrophyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: Locale('ar'), // Set the default locale to Arabic
            // You can use the library anywhere in the app even in theme
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            theme: AppTheme.dark,
            routerConfig: RouterGeneratedConfig.routerGeneratedConfig(),
          );
        },
      ),
    );
  }
}
