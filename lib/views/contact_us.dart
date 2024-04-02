import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

class ContactUs extends ConsumerWidget {
  ContactUs({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.sizeOf(context);
    return HelperClass(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildContactText(ref),
          Constants.sizedBox(height: 40.0),
          buildHomePersonalInfo(MediaQuery.of(context).size, ref),
          Constants.sizedBox(height: 5),
          Text('contato.gabrielmeireles@gmail.com',
              style: AppTextStyles.normalStyle()),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              controller: nameController,
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(color: Colors.white)
                  .copyWith(fontSize: 18),
              decoration: buildInputDecoration(
                  hintText: ref.watch(languageProvider) == 'en_US'
                      ? 'Name'
                      : 'Nome'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              controller: emailController,
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(color: Colors.white)
                  .copyWith(fontSize: 18),
              decoration: buildInputDecoration(hintText: 'Email'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              controller: numberController,
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(color: Colors.white)
                  .copyWith(fontSize: 18),
              decoration: buildInputDecoration(
                  hintText: ref.watch(languageProvider) == 'en_US'
                      ? 'Phone Number'
                      : 'Número de telefone'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              controller: subjectController,
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(color: Colors.white)
                  .copyWith(fontSize: 18),
              decoration: buildInputDecoration(
                  hintText: ref.watch(languageProvider) == 'en_US'
                      ? 'Subject'
                      : 'Assunto'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              controller: messageController,
              maxLines: null,
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(color: Colors.white)
                  .copyWith(fontSize: 18),
              decoration: buildInputDecoration(
                  hintText: ref.watch(languageProvider) == 'en_US'
                      ? 'Your Message'
                      : 'Sua Mensagem'),
            ),
          ),
          Constants.sizedBox(height: 40.0),
          AppButtons.buildMaterialButton(
              buttonName: ref.watch(languageProvider) == 'en_US'
                  ? 'Send Message'
                  : 'Enviar Mensagem',
              onTap: () async {
                if (subjectController.text != '' &&
                    numberController.text != '' &&
                    messageController.text != '' &&
                    emailController.text != '' &&
                    nameController.text != '') {
                  String url =
                      '''https://mail.google.com/mail/?view=cm&fs=1&to=contato.gabrielmeireles@gmail.com&su=${subjectController.text.replaceAll(' ', '%20')}&body=${nameController.text.replaceAll(' ', '%20')}%0A${emailController.text.replaceAll(' ', '%20')}%0A${numberController.text.replaceAll(' ', '%20')}%0A%0A${messageController.text.replaceAll(' ', '%20')}''';
                  await launchUrl(Uri.parse(url));
                  nameController.text = '';
                  emailController.text = '';
                  numberController.text = '';
                  subjectController.text = '';
                  messageController.text = '';
                  ref.read(sendConfirmationProvider.notifier).state = '';
                } else {
                  ref.read(sendConfirmationProvider.notifier).state =
                      ref.watch(languageProvider) == 'en_US'
                          ? 'Fill in all entry fields!'
                          : 'Preencha todos os campos!';
                }
              }),
          Constants.sizedBox(height: 10),
          Text(
            ref.watch(sendConfirmationProvider),
            style: AppTextStyles.normalStyle(),
          ),
          Constants.sizedBox(height: 30.0),
        ],
      ),
      tablet: buildForm(ref, context),
      desktop: buildForm(ref, context),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildForm(ref, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(ref),
        Constants.sizedBox(height: 40.0),
        buildHomePersonalInfo(MediaQuery.of(context).size, ref),
        Constants.sizedBox(height: 5),
        Text('contato.gabrielmeireles@gmail.com',
            style: AppTextStyles.normalStyle()),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: nameController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(color: Colors.white)
                      .copyWith(fontSize: 18),
                  decoration: buildInputDecoration(
                      hintText: ref.watch(languageProvider) == 'en_US'
                          ? 'Name'
                          : 'Nome'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: emailController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(color: Colors.white)
                      .copyWith(fontSize: 18),
                  decoration: buildInputDecoration(hintText: 'Email'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: numberController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(color: Colors.white)
                      .copyWith(fontSize: 18),
                  decoration: buildInputDecoration(
                      hintText: ref.watch(languageProvider) == 'en_US'
                          ? 'Phone Number'
                          : 'Número de telefone'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: subjectController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(color: Colors.white)
                      .copyWith(fontSize: 18),
                  decoration: buildInputDecoration(
                      hintText: ref.watch(languageProvider) == 'en_US'
                          ? 'Subject'
                          : 'Assunto'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          elevation: 8,
          child: TextField(
            controller: messageController,
            maxLines: null,
            cursorColor: AppColors.white,
            style: AppTextStyles.normalStyle(color: Colors.white)
                .copyWith(fontSize: 18),
            decoration: buildInputDecoration(
                hintText: ref.watch(languageProvider) == 'en_US'
                    ? 'Your Message'
                    : 'Sua Mensagem'),
          ),
        ),
        Constants.sizedBox(height: 40.0),
        AppButtons.buildMaterialButton(
            buttonName: ref.watch(languageProvider) == 'en_US'
                ? 'Send Message'
                : 'Enviar Mensagem',
            onTap: () async {
              if (subjectController.text != '' &&
                  numberController.text != '' &&
                  messageController.text != '' &&
                  emailController.text != '' &&
                  nameController.text != '') {
                String url =
                    '''https://mail.google.com/mail/?view=cm&fs=1&to=contato.gabrielmeireles@gmail.com&su=${subjectController.text.replaceAll(' ', '%20')}&body=${nameController.text.replaceAll(' ', '%20')}%0A${emailController.text.replaceAll(' ', '%20')}%0A${numberController.text.replaceAll(' ', '%20')}%0A%0A${messageController.text.replaceAll(' ', '%20')}''';
                await launchUrl(Uri.parse(url));
                nameController.text = '';
                emailController.text = '';
                numberController.text = '';
                subjectController.text = '';
                messageController.text = '';
                ref.read(sendConfirmationProvider.notifier).state = '';
              } else {
                ref.read(sendConfirmationProvider.notifier).state =
                    ref.watch(languageProvider) == 'en_US'
                        ? 'Fill in all entry fields!'
                        : 'Preencha todos os campos!';
              }
            }),
        Constants.sizedBox(height: 10),
        Text(
          ref.watch(sendConfirmationProvider),
          style: AppTextStyles.normalStyle(),
        ),
        Constants.sizedBox(height: 30.0),
      ],
    );
  }

  FadeInUp buildHomePersonalInfo(Size size, WidgetRef ref) {
    final socialButtons = <String>[
      AppAssets.zap,
      AppAssets.linkedIn,
      AppAssets.github,
    ];
    final socialLinks = <String>[
      'https://wa.me/5535999631097',
      'https://www.linkedin.com/in/developer-gabriel-meireles/',
      'https://github.com/Meireles-Gabriel',
    ];
    int? socialBI;
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: SizedBox(
        height: 48,
        child: ListView.separated(
          itemCount: socialButtons.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, child) => Constants.sizedBox(width: 8.0),
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
                  link: socialLinks[index]),
            );
          },
        ),
      ),
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
          await launchUrl(Uri.parse(url));
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

  FadeInDown buildContactText(WidgetRef ref) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text:
              ref.watch(languageProvider) == 'en_US' ? 'Contact ' : 'Entre em ',
          style: AppTextStyles.montserratStyle(
              fontSize: 30.0, color: Colors.white),
          children: [
            TextSpan(
              text: ref.watch(languageProvider) == 'en_US' ? 'Me!' : 'Contato!',
              style: AppTextStyles.montserratStyle(
                  fontSize: 30, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
        labelText: hintText,
        labelStyle: AppTextStyles.comfortaaStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColors.bgColor2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16));
  }
}
