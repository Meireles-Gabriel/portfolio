import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';

import '../globals/app_text_styles.dart';

// ignore: must_be_immutable
class MyServices extends ConsumerWidget {
  MyServices({super.key});

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(ref),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              ref.read(isAppProvider.notifier).state = value;
            },
            child: buildAnimatedContainer(
              title: ref.watch(languageProvider) == 'en_US'
                  ? 'Front-End Development'
                  : 'Desenvolvimento\nFront-End',
              info: ref.watch(languageProvider) == 'en_US'
                  ? '''with Flutter:\n\nCreating beautiful, functional, and responsive apps that deliver an exceptional user experience across multiple platforms.'''
                  : '''com Flutter:\n\nCriação de aplicativos belos, funcionais e responsivos que oferecem uma experiência de usuário excepcional em múltiplas plataformas.''',
              asset: AppAssets.brush,
              hover: ref.watch(isAppProvider),
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              ref.read(isGraphicProvider.notifier).state = value;
            },
            child: buildAnimatedContainer(
              title: ref.watch(languageProvider) == 'en_US'
                  ? 'Back-End Development'
                  : 'Desenvolvimento\nBack-End',
              asset: AppAssets.code,
              info: ref.watch(languageProvider) == 'en_US'
                  ? '''with Python:\n\nBuilding robust APIs, task automation, data processing, and system integration with clean and efficient code.'''
                  : '''com Python:\n\nConstrução de APIs robustas, automação de tarefas, processamento de dados e integração de sistemas com código limpo e eficiente.''',
              hover: ref.watch(isGraphicProvider),
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              ref.read(isDataAnalystProvider.notifier).state = value;
            },
            child: buildAnimatedContainer(
              title: ref.watch(languageProvider) == 'en_US'
                  ? 'Robust Database'
                  : 'Base de Dados Robusta',
              asset: AppAssets.analyst,
              info: ref.watch(languageProvider) == 'en_US'
                  ? '''with MySQL and Firebase:\n\nCreating and managing robust database solutions, using MySQL for systems with high transaction volumes and Firebase for applications requiring real-time data synchronization and automatic scalability.'''
                  : '''com MySQL e Firebase:\n\nCriação e gestão de soluções de banco de dados robustas, utilizando MySQL para sistemas com grande volume de transações e Firebase para aplicações que requerem sincronização de dados em tempo real e escalabilidade automática.''',
              hover: ref.watch(isDataAnalystProvider),
            ),
          )
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(ref),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  ref.read(isAppProvider.notifier).state = value;
                },
                child: buildAnimatedContainer(
                  title: ref.watch(languageProvider) == 'en_US'
                      ? 'Front-End Development'
                      : 'Desenvolvimento\nFront-End',
                  info: ref.watch(languageProvider) == 'en_US'
                      ? '''with Flutter:\n\nCreating beautiful, functional, and responsive apps that deliver an exceptional user experience across multiple platforms.'''
                      : '''com Flutter:\n\nCriação de aplicativos belos, funcionais e responsivos que oferecem uma experiência de usuário excepcional em múltiplas plataformas.''',
                  asset: AppAssets.brush,
                  hover: ref.watch(isAppProvider),
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  ref.read(isGraphicProvider.notifier).state = value;
                },
                child: buildAnimatedContainer(
                  title: ref.watch(languageProvider) == 'en_US'
                      ? 'Back-End Development'
                      : 'Desenvolvimento\nBack-End',
                  asset: AppAssets.code,
                  info: ref.watch(languageProvider) == 'en_US'
                      ? '''with Python:\n\nBuilding robust APIs, task automation, data processing, and system integration with clean and efficient code.'''
                      : '''com Python:\n\nConstrução de APIs robustas, automação de tarefas, processamento de dados e integração de sistemas com código limpo e eficiente.''',
                  hover: ref.watch(isGraphicProvider),
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              ref.read(isDataAnalystProvider.notifier).state = value;
            },
            child: buildAnimatedContainer(
              title: ref.watch(languageProvider) == 'en_US'
                  ? 'Robust Database'
                  : 'Base de Dados Robusta',
              asset: AppAssets.analyst,
              info: ref.watch(languageProvider) == 'en_US'
                  ? '''with MySQL and Firebase:\n\nCreating and managing robust database solutions, using MySQL for systems with high transaction volumes and Firebase for applications requiring real-time data synchronization and automatic scalability.'''
                  : '''com MySQL e Firebase:\n\nCriação e gestão de soluções de banco de dados robustas, utilizando MySQL para sistemas com grande volume de transações e Firebase para aplicações que requerem sincronização de dados em tempo real e escalabilidade automática.''',
              hover: ref.watch(isDataAnalystProvider),
              width: 725.0,
              hoverWidth: 735.0,
            ),
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(ref),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  ref.read(isAppProvider.notifier).state = value;
                },
                child: buildAnimatedContainer(
                  title: ref.watch(languageProvider) == 'en_US'
                      ? 'Front-End Development'
                      : 'Desenvolvimento\nFront-End',
                  info: ref.watch(languageProvider) == 'en_US'
                      ? '''with Flutter:\n\nCreating beautiful, functional, and responsive apps that deliver an exceptional user experience across multiple platforms.'''
                      : '''com Flutter:\n\nCriação de aplicativos belos, funcionais e responsivos que oferecem uma experiência de usuário excepcional em múltiplas plataformas.''',
                  asset: AppAssets.brush,
                  hover: ref.watch(isAppProvider),
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  ref.read(isGraphicProvider.notifier).state = value;
                },
                child: buildAnimatedContainer(
                  title: ref.watch(languageProvider) == 'en_US'
                      ? 'Back-End Development'
                      : 'Desenvolvimento\nBack-End',
                  asset: AppAssets.code,
                  info: ref.watch(languageProvider) == 'en_US'
                      ? '''with Python:\n\nBuilding robust APIs, task automation, data processing, and system integration with clean and efficient code.'''
                      : '''com Python:\n\nConstrução de APIs robustas, automação de tarefas, processamento de dados e integração de sistemas com código limpo e eficiente.''',
                  hover: ref.watch(isGraphicProvider),
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  ref.read(isDataAnalystProvider.notifier).state = value;
                },
                child: buildAnimatedContainer(
                  title: ref.watch(languageProvider) == 'en_US'
                      ? 'Robust Database'
                      : 'Base de Dados Robusta',
                  asset: AppAssets.analyst,
                  info:
                      '''with MySQL and Firebase:\n\nCreating and managing robust database solutions, using MySQL for systems with high transaction volumes and Firebase for applications requiring real-time data synchronization and automatic scalability.''',
                  hover: ref.watch(isDataAnalystProvider),
                ),
              )
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText(WidgetRef ref) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: ref.watch(languageProvider) == 'en_US'
              ? 'My ' : 'Minhas ',
          style: AppTextStyles.montserratStyle(
              fontSize: 30.0, color: Colors.white),
          children: [
            TextSpan(
              text: ref.watch(languageProvider) == 'en_US'
              ? 'Skills' : 'Habilidades',
              style: AppTextStyles.montserratStyle(
                  fontSize: 30.0, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required String info,
    required bool hover,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border:
            hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            info,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
