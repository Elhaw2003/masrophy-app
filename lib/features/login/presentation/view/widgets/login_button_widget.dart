import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/routing/app_routes.dart';
import 'package:masrophy_app/core/theme/size/app_icon_size.dart';
import 'package:masrophy_app/core/widgets/custom_button_widget.dart';
import 'package:masrophy_app/features/login/presentation/cubit/cubit/login_with_google_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginWithGoogleCubit, LoginWithGoogleState>(
      listener: (context, state) {
        if (state is LoginWithGoogleSuccessState) {
          context.go(AppRoutes.home);
        } else if (state is LoginWithGoogleFailureState) {
          context.messenger.showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: "التسجيل من خلال جوجل",
          variant: ButtonVariant.outlined,
          onPressed: state is LoginWithGoogleLoadingState
              ? null
              : () {
                  context.read<LoginWithGoogleCubit>().loginWithGoogle();
                },
          icon: state is LoginWithGoogleLoadingState
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : FaIcon(FontAwesomeIcons.google, size: AppIconSize.md),
          textStyle: context.textTheme.titleMedium,
        );
      },
    );
  }
}
