import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import '../globals/app_text_styles.dart';

class AboutMe extends ConsumerWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(ref),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: buildAboutMeContents(ref),
          ),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: buildAboutMeContents(ref),
          ),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  Column buildAboutMeContents(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: ref.watch(languageProvider) == 'en_US'
                    ? 'About '
                    : 'Sobre ',
                style: AppTextStyles.montserratStyle(
                    fontSize: 30.0, color: Colors.white),
                children: [
                  TextSpan(
                    text:
                        ref.watch(languageProvider) == 'en_US' ? 'Me' : 'Mim',
                    style: AppTextStyles.montserratStyle(
                        fontSize: 30, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            '',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            ref.watch(languageProvider) == 'en_US'
                ? 'With a solid practical experience, accumulated from challenging projects, I bring a wealth of learnings. In these challenges, I have been constantly driven to innovate, enhance my skills self-taughtly, and above all, nurture my passion for technology. My approach is centered on creating elegant and efficient solutions that not only meet but exceed my client\'s expectations. I am committed to ensuring that each project not only achieves but surpasses its business objectives, providing quality and effectiveness at every stage of the process.'
                : 'Com uma sólida experiência prática, acumulada em projetos desafiadores, trago uma bagagem repleta de aprendizados. Nestes desafios, fui constantemente impulsionado a inovar, aprimorar minhas habilidades de forma autodidata e, acima de tudo, a nutrir minha paixão pela tecnologia. Minha abordagem é centrada na criação de soluções elegantes e eficientes, que não só atendam, mas superem as expectativas dos meus clientes. Estou comprometido em assegurar que cada projeto não apenas alcance, mas exceda seus objetivos de negócio, proporcionando qualidade e eficácia em cada etapa do processo.',
            style: AppTextStyles.normalStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
