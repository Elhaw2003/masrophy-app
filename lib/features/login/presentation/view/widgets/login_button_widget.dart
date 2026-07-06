import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/routing/app_routes.dart';
import 'package:masrophy_app/core/theme/size/app_icon_size.dart';
import 'package:masrophy_app/core/widgets/custom_button_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "التسجيل من خلال جوجل",
      variant: ButtonVariant.outlined,
      onPressed: () {
        context.go(AppRoutes.home);
      },
      icon: FaIcon(FontAwesomeIcons.google, size: AppIconSize.md),
      textStyle: context.textTheme.titleMedium,
    );
  }
}
