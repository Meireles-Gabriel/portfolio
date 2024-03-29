import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
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
    
    final Size size = MediaQuery.of(context).size;
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
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount, required WidgetRef ref}) {
    List projectsNames = <String>[
      ref.watch(languageProvider) == 'en_US'
          ? 'Python Automation'
          : 'Automação Python',
      ref.watch(languageProvider) == 'en_US'
          ? 'API Search' : 'Solicitação API',
      ref.watch(languageProvider) == 'en_US'
          ? 'Landing Page' : 'Landing Page',
    ];

    List projectsDescriptions = <String>[
      ref.watch(languageProvider) == 'en_US'
          ? 'Project 3' : 'Projeto 3',
      ref.watch(languageProvider) == 'en_US' ? 'Project 2' : 'Projeto 2',
      ref.watch(languageProvider) == 'en_US' ? 'Project 1' : 'Projeto 1',
    ];

    List images = <String>[
      AppAssets.work2,
      AppAssets.work1,
      AppAssets.work2,
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
            onTap: () {},
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
                    transform: index == ref.watch(hoveredIndexProvider) ? onH0verEffect : null,
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
                            AppColors.themeColor.withOpacity(0.6),
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
                            Constants.sizedBox(height: 15.0),
                            Text(
                              projectsDescriptions[index],
                              style:
                                  AppTextStyles.normalStyle(color: Colors.black87),
                              textAlign: TextAlign.center,
                            ),
                            Constants.sizedBox(height: 30.0),
                            CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                AppAssets.share,
                                width: 25,
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                            )
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
          text: ref.watch(languageProvider) == 'en_US'
              ? 
          'Latest ' : 'Últimos ',
          style: AppTextStyles.montserratStyle(
              fontSize: 30.0, color: Colors.white),
          children: [
            TextSpan(
              text: ref.watch(languageProvider) == 'en_US'
              ? 'Projects' : 'Projetos',
              style: AppTextStyles.montserratStyle(
                  fontSize: 30, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
