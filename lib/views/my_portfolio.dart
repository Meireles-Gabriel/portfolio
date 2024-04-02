import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

// ignore: must_be_immutable
class MyPortfolio extends ConsumerWidget {
  MyPortfolio({super.key});

  final onH0verEffect = Matrix4.identity()..scale(1.0);

  // ignore: prefer_typing_uninitialized_variables
  var hoveredIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.sizeOf(context);
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(ref),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1, ref: ref)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(ref),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2, ref: ref)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(ref),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3, ref: ref),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  GridView buildProjectGridView(
      {required int crossAxisCount, required WidgetRef ref}) {
    List projectsNames = <String>[
      ref.watch(languageProvider) == 'en_US' ? 'AutoTrade' : 'AutoTrade',
      ref.watch(languageProvider) == 'en_US' ? 'FideLit' : 'FideLit',
    ];

    List projectsDescriptions = <String>[
      ref.watch(languageProvider) == 'en_US'
          ? 'Automation system that executes Binary Options signals sent by professional traders on Telegram. It also integrates with ChatGPT to analyze the chart and generate its own signals. I used Flutter for the front-end and Python for the back-end, with libraries including Flask, Selenium, Pillow, Telethon, OpenAI, among others.'
          : 'Sistema de automação que executa sinais de Opções Binárias enviados por traders profissionais no Telegram. Também possui uma integração com o CHATGPT para analisar o gráfico e gerar seus próprios sinais. Utilizei Flutter para o front-end e Python no back-end, com as bibliotecas Flask, Selenium, Pillow, Telethon, OpenAI, entre outras.',
      ref.watch(languageProvider) == 'en_US'
          ? 
              'Barbershop management application. In addition to scheduling appointments, it also includes customer registration and a points/rewards system similar to a loyalty program. I used Flutter for the front-end and Firebase for the database, storing scheduled appointments, customer information, and service history.'

          : 'Aplicativo para gerenciamento de uma barbearia. Além do agendamento de horários, também possui cadastro de clientes e um sistema de pontuação/recompensa no estilo programa de fidelidade. Utilizei Flutter para o front-end e Firebase para a base de dados, armazenando os horários agendados, informações dos clientes e histórico de atendimento.',
    ];

    List images = <String>[
      AppAssets.autotrade,
      AppAssets.fidelit,
    ];

    List links = <String>[
      'https://www.upwork.com/freelancers/~0149a9148ca3ef3387?p=1774078610146238464',
      'https://www.upwork.com/freelancers/~0149a9148ca3ef3387?p=1774077277750841344'
    ];

    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var image = images[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () async {
              String url = links[index];
                await launchUrl(Uri.parse(url));
            },
            onHover: (value) {
              if (value) {
                ref.read(hoveredIndexProvider.notifier).state = index;
              } else {
                ref.read(hoveredIndexProvider.notifier).state = null;
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill),
                  ),
                ),
                Visibility(
                  visible: index == ref.watch(hoveredIndexProvider),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == ref.watch(hoveredIndexProvider)
                        ? onH0verEffect
                        : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.themeColor.withOpacity(1.0),
                            AppColors.themeColor.withOpacity(0.9),
                            AppColors.themeColor.withOpacity(0.8),
                            AppColors.themeColor.withOpacity(0.7),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              projectsNames[index],
                              style: AppTextStyles.montserratStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                            Constants.sizedBox(height: 12.0),
                            SizedBox(
                              width: 320,
                              child: Text(
                                projectsDescriptions[index],
                                style: AppTextStyles.normalStyle(
                                        color: const Color.fromARGB(221, 8, 7, 7))
                                    .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                              ),
                            ),
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText(WidgetRef ref) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: ref.watch(languageProvider) == 'en_US' ? 'Latest ' : 'Últimos ',
          style: AppTextStyles.montserratStyle(
              fontSize: 30.0, color: Colors.white),
          children: [
            TextSpan(
              text: ref.watch(languageProvider) == 'en_US'
                  ? 'Projects'
                  : 'Projetos',
              style: AppTextStyles.montserratStyle(
                  fontSize: 30, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
