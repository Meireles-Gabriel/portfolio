import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/views/about_me.dart';
import 'package:my_portfolio/views/contact_us.dart';
import 'package:my_portfolio/views/home_page.dart';
import 'package:my_portfolio/views/my_portfolio.dart';
import 'package:my_portfolio/views/my_skills.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

// ignore: must_be_immutable
class MainDashBoard extends ConsumerWidget {
  MainDashBoard({super.key});

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);

  final screensList = <Widget>[
    HomePage(),
    MySkills(),
    MyPortfolio(),
    AboutMe(),
    ContactUs(),
  ];

  Future scrollTo({required int index, required WidgetRef ref}) async {
    itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      ref.read(menuIndexProvider.notifier).state = index;
    });
  }

  final yourScrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List menuItems = ref.watch(languageProvider) == 'en_US'
        ? <String>[
            'Home',
            'Skills',
            'Portfolio',
            'About Me',
            'Contact',
          ]
        : <String>[
            'Início',
            'Qualificações',
            'Portfólio',
            'Sobre Mim',
            'Contato',
          ];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      InkWell(
                        child: Image.asset(
                          ref.watch(languageProvider) == 'pt_BR'
                              ? 'assets/en_US.png'
                              : 'assets/pt_BR.png',
                          color: Colors.white,
                          height: 30,
                        ),
                        onTap: () {
                          ref.watch(languageProvider) == 'pt_BR'
                              ? ref.read(languageProvider.notifier).state =
                                  'en_US'
                              : ref.read(languageProvider.notifier).state =
                                  'pt_BR';
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  Spacer(),
                  
                  PopupMenuButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: AppColors.white,
                    ),
                    color: AppColors.bgColor2,
                    position: PopupMenuPosition.under,
                    constraints:
                        BoxConstraints.tightFor(width: size.width * 0.4),
                    itemBuilder: (BuildContext context) => menuItems
                        .asMap()
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                            textStyle: AppTextStyles.headerTextStyle(),
                            onTap: () {
                              scrollTo(index: e.key, ref: ref);
                            },
                            child: Center(
                              child: Text(
                                e.value,
                                style: AppTextStyles.montserratStyle(
                                        color: Colors.white)
                                    .copyWith(fontSize: 18),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Image.asset(
                      ref.watch(languageProvider) == 'pt_BR'
                          ? 'assets/en_US.png'
                          : 'assets/pt_BR.png',
                      color: Colors.white,
                      height: 30,
                    ),
                    onTap: () {
                      ref.watch(languageProvider) == 'pt_BR'
                          ? ref.read(languageProvider.notifier).state = 'en_US'
                          : ref.read(languageProvider.notifier).state = 'pt_BR';
                    },
                  ),
                  const Spacer(),
                  
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, child) =>
                          Constants.sizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            scrollTo(index: index, ref: ref);
                          },
                          borderRadius: BorderRadius.circular(100),
                          onHover: (value) {
                            if (value) {
                              ref.read(menuIndexProvider.notifier).state =
                                  index;
                            } else {
                              ref.read(menuIndexProvider.notifier).state = -1;
                            }
                          },
                          child: buildNavBarAnimatedContainer(
                              index,
                              ref.watch(menuIndexProvider) == index
                                  ? true
                                  : false,
                              ref),
                        );
                      },
                    ),
                  ),
                  Constants.sizedBox(width: 30),
                ],
              );
            }
          },
        ),
      ),
      body: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 8,
        interactive: true,
        controller: yourScrollController,
        child: ScrollablePositionedList.builder(
          itemCount: screensList.length,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          scrollOffsetListener: scrollOffsetListener,
          itemBuilder: (context, index) {
            return screensList[index];
          },
        ),
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(
      int index, bool hover, WidgetRef ref) {
    List menuItems = ref.watch(languageProvider) == 'en_US'
        ? <String>[
            'Home',
            'Skills',
            'Portfolio',
            'About Me',
            'Contact',
          ]
        : <String>[
            'Início',
            'Qualificações',
            'Portfólio',
            'Sobre Mim',
            'Contato',
          ];
    return AnimatedContainer(
      alignment: Alignment.center,
      width: 120,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle(
            color: hover ? AppColors.themeColor : AppColors.white),
      ),
    );
  }
}
