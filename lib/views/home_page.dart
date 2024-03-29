import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          const ProfileAnimation(),
          buildHomePersonalInfo(size, ref),
          Constants.sizedBox(height: 25.0),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size, ref)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size, ref)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size, WidgetRef ref) {
    final socialButtons = <String>[
      AppAssets.gmail,
      AppAssets.zap,
      AppAssets.linkedIn,
      AppAssets.github,
      AppAssets.insta,
    ];
    final socialLinks = <String>[
      'https://mail.google.com/mail/?view=cm&fs=1&to=contato.gabrielmeireles@gmail.com',
      'https://wa.me/5535999631097',
      AppAssets.linkedIn,
      AppAssets.github,
      AppAssets.insta,
    ];
    int? socialBI;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            ref.watch(languageProvider) == 'en_US'
                ? 'Hello! I\'m'
                : 'Olá! Meu nome é',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Gabriel Meireles',
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 36),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                ref.watch(languageProvider) == 'en_US'
                    ? 'And I\'m a '
                    : 'E eu sou um ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.grey),
                  ),
                  TyperAnimatedText(
                    'Python Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.grey),
                  ),
                  TyperAnimatedText(
                    'Mobile Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.grey),
                  ),
                  TyperAnimatedText(
                    'Web Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.grey),
                  ),
                  TyperAnimatedText(
                    'Desktop Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.grey),
                  ),
                  TyperAnimatedText(
                    'Game Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.grey),
                  ),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Expanded(
            child: Text(
              ref.watch(languageProvider) == 'en_US'
                  ? 'Thoughtfully developed projects that reflect my commitment in every line of code. Together, let\'s build solid and innovative solutions!'
                  : 'Projetos cuidadosamente desenvolvidos que refletem meu comprometimento em cada linha de código. Juntos, vamos construir soluções sólidas e inovadoras!',
              style: AppTextStyles.normalStyle(),
            ),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  onHover: (value) {
                    if (value) {
                      socialBI = index;
                    } else {
                      socialBI = null;
                    }
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                      asset: socialButtons[index],
                      hover: socialBI == index ? true : false,
                      link: socialLinks[0]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Ink buildSocialButton(
      {required String asset, required bool hover, required String link}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: InkWell(
        onTap: () async {
          String url = link;
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Image.asset(
          asset,
          width: 10,
          height: 12,
          color: hover ? AppColors.bgColor : AppColors.themeColor,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
