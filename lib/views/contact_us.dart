import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

class ContactUs extends ConsumerWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildContactText(ref),
          Constants.sizedBox(height: 40.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.montserratStyle(color: Colors.white,).copyWith(fontWeight: FontWeight.w100),
              decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Full Name' : 'Nome Completo'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.montserratStyle(color: Colors.white).copyWith(fontWeight: FontWeight.w100)
                  ,
              decoration: buildInputDecoration(hintText: 'Email'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.montserratStyle(color: Colors.white)
                  .copyWith(fontWeight: FontWeight.w100),
              decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Mobile Number': 'Número de celular'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.montserratStyle(color: Colors.white)
                  .copyWith(fontWeight: FontWeight.w100),
              decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Subject' : 'Assunto'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextField(
              maxLines: 15,
              cursorColor: AppColors.white,
              style: AppTextStyles.montserratStyle(color: Colors.white)
                  .copyWith(fontWeight: FontWeight.w100),
              decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Your Message' : 'Sua Mensagem'),
            ),
          ),
          Constants.sizedBox(height: 40.0),
          AppButtons.buildMaterialButton(
              buttonName: ref.watch(languageProvider) == 'en_US'
              ? 'Send Message' : 'Enviar Mensagem', onTap: () {}),
          Constants.sizedBox(height: 30.0),
        ],
      ),
      tablet: buildForm(ref),
      desktop: buildForm(ref),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildForm(ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(ref),
        Constants.sizedBox(height: 40.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  cursorColor: AppColors.white,
                  style: AppTextStyles.montserratStyle(color: Colors.white).copyWith(fontWeight: FontWeight.w100),
                  decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Full Name' : 'Nome Completo'),
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
                  cursorColor: AppColors.white,
                  style: AppTextStyles.montserratStyle(color: Colors.white).copyWith(fontWeight: FontWeight.w100),
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
                  cursorColor: AppColors.white,
                  style: AppTextStyles.montserratStyle(color: Colors.white)
                      .copyWith(fontWeight: FontWeight.w100),
                  decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Mobile Number' : 'Número de celular'),
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
                  cursorColor: AppColors.white,
                  style: AppTextStyles.montserratStyle(color: Colors.white)
                      .copyWith(fontWeight: FontWeight.w100),
                  decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Subject' : 'Assunto'),
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
            
            maxLines: 15,
            cursorColor: AppColors.white,
            style: AppTextStyles.montserratStyle(color: Colors.white)
                .copyWith(fontWeight: FontWeight.w100),
            decoration: buildInputDecoration(hintText: ref.watch(languageProvider) == 'en_US'
              ? 'Your Message': 'Sua Mensagem'),
          ),
        ),
        Constants.sizedBox(height: 40.0),
        AppButtons.buildMaterialButton(
            buttonName: ref.watch(languageProvider) == 'en_US'
              ? 'Send Message' : 'Enviar Mensagem', onTap: () {}),
        Constants.sizedBox(height: 30.0),
      ],
    );
  }

  FadeInDown buildContactText(WidgetRef ref) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: ref.watch(languageProvider) == 'en_US'
              ? 'Contact ' : 'Entre em ',
          style: AppTextStyles.montserratStyle(fontSize: 30.0, color: Colors.white),
          children: [
            TextSpan(
              text: ref.watch(languageProvider) == 'en_US'
              ? 'Me!' : 'Contato!',
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
        hintText: hintText,
        hintStyle: AppTextStyles.comfortaaStyle(),
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
