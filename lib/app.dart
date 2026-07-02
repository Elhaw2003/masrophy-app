import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/theme/app_theme.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/generated/locale_keys.g.dart';

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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // You can use the library anywhere in the app even in theme
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            theme: AppTheme.light,
            home: Scaffold(
              appBar: AppBar(title: Text(LocaleKeys.appName.tr())),
              body: Center(
                child: Column(
                  children: [
                    Text("LocaleKeys.home.tr()"),
                    SizedBox(height: AppSpacing.lg),
                    Text("LocaleKeys.app_name.tr()"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
