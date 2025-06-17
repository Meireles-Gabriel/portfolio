import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio2025/localization/app_localizations.dart';
import 'package:portfolio2025/providers/providers.dart';

class ContactSection extends ConsumerStatefulWidget {
  const ContactSection({super.key});

  @override
  ConsumerState<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends ConsumerState<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: 100,
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              AppLocalizations.translate('contact', locale),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: size.width > 768 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 32),
          if (size.width <= 768)
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    icon: 'assets/images/whatsapp.png',
                    onTap: () =>
                        launchUrl(Uri.parse('https://wa.me/5535998390325')),
                  ),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: 'assets/images/linkedin.png',
                    onTap: () => launchUrl(Uri.parse(
                        'https://www.linkedin.com/in/developer-gabriel-meireles/')),
                  ),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: 'assets/images/github.png',
                    onTap: () => launchUrl(
                        Uri.parse('https://github.com/Meireles-Gabriel')),
                  ),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: 'assets/images/instagram.png',
                    onTap: () => launchUrl(
                        Uri.parse('https://www.instagram.com/bael.dev/')),
                  ),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: 'assets/images/youtube.png',
                    onTap: () => launchUrl(
                        Uri.parse('https://www.youtube.com/@BaelMeireles')),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Formulário de contato
              Expanded(
                flex: size.width > 768 ? 3 : 1,
                child: _buildContactForm(context, locale),
              ),

              if (size.width > 768) const SizedBox(width: 60),

              // Informações de contato
              if (size.width > 768)
                Expanded(
                  flex: 2,
                  child: _buildContactInfo(context, locale),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context, String locale) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: nameController,
                    label: AppLocalizations.translate('name_field', locale),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: emailController,
                    label: AppLocalizations.translate('email_field', locale),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: phoneController,
                    label: AppLocalizations.translate('phone_field', locale),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: subjectController,
                    label: AppLocalizations.translate('subject_field', locale),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: messageController,
              label: AppLocalizations.translate('message_field', locale),
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                AppLocalizations.translate('send_message', locale),
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              ref.watch(sendConfirmationProvider),
              style: GoogleFonts.montserrat(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.montserrat(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, String locale) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entre em contato',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(height: 24),

          _buildContactItem(
            icon: Icons.email,
            text: 'contato.gabrielmeireles@gmail.com',
            onTap: () => launchUrl(
                Uri.parse('mailto:contato.gabrielmeireles@gmail.com')),
          ),

          const SizedBox(height: 16),

          _buildContactItem(
            icon: Icons.phone,
            text: '+55 (35) 9 9839-0325',
            onTap: () => launchUrl(Uri.parse('tel:+5535998390325')),
          ),

          const SizedBox(height: 16),

          _buildContactItem(
            icon: Icons.location_on,
            text: 'Monte Verde, Camanducaia-MG, Brasil',
          ),

          const SizedBox(height: 32),

          // Redes sociais
          Row(
            children: [
              _buildSocialButton(
                icon: 'assets/images/whatsapp.png',
                onTap: () =>
                    launchUrl(Uri.parse('https://wa.me/5535998390325')),
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                icon: 'assets/images/linkedin.png',
                onTap: () => launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/developer-gabriel-meireles/')),
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                icon: 'assets/images/github.png',
                onTap: () =>
                    launchUrl(Uri.parse('https://github.com/Meireles-Gabriel')),
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                icon: 'assets/images/instagram.png',
                onTap: () =>
                    launchUrl(Uri.parse('https://www.instagram.com/bael.dev/')),
              ),
              const SizedBox(width: 16),
              _buildSocialButton(
                icon: 'assets/images/youtube.png',
                onTap: () => launchUrl(
                    Uri.parse('https://www.youtube.com/@BaelMeireles')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          icon,
          color: Theme.of(context).colorScheme.primary,
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  void _sendMessage() async {
    final locale = ref.watch(localeProvider);

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        subjectController.text.isEmpty ||
        messageController.text.isEmpty) {
      ref.read(sendConfirmationProvider.notifier).state =
          AppLocalizations.translate('fill_fields', locale);
      return;
    }

    String url =
        '''https://mail.google.com/mail/?view=cm&fs=1&to=contato.gabrielmeireles@gmail.com&su=${subjectController.text.replaceAll(' ', '%20')}&body=${nameController.text.replaceAll(' ', '%20')}%0A${emailController.text.replaceAll(' ', '%20')}%0A${phoneController.text.replaceAll(' ', '%20')}%0A%0A${messageController.text.replaceAll(' ', '%20')}''';

    await launchUrl(Uri.parse(url));

    // Limpar campos
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    subjectController.clear();
    messageController.clear();

    ref.read(sendConfirmationProvider.notifier).state = '';
  }
}
