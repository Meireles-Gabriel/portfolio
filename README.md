# Portfolio2025

Um site de portfólio pessoal construído com Flutter, apresentando meus projetos, qualificações e informações de contato. Este projeto foi desenvolvido para ser responsivo, adaptando-se a vários tamanhos de tela e proporcionando uma experiência de usuário fluida.

## Funcionalidades

- **Design Responsivo**: Adapta-se perfeitamente a diferentes tamanhos de tela (desktop, tablet, mobile).
- **Alternância de Tema Claro/Escuro**: Os usuários podem alternar entre temas claro e escuro.
- **Suporte Multi-idioma**: Atualmente suporta Português (pt_BR) e Inglês (en_US).
- **Seções Animadas**: Animações suaves para várias seções para aumentar o engajamento do usuário.
- **Exibição Dinâmica de Projetos**: Apresenta projetos em destaque com descrições, tecnologias e links.
- **Formulário de Contato Interativo**: Permite que os usuários enviem mensagens diretamente.
- **Integração de Mídias Sociais**: Links para vários perfis de mídias sociais.
- **Firebase Hosting**: Implantado no Firebase Hosting para entrega confiável e rápida.

## Tecnologias Utilizadas

- Flutter: Kit de ferramentas de UI para construir aplicativos compilados nativamente para dispositivos móveis, web e desktop a partir de uma única base de código.
- Flutter Riverpod: Uma biblioteca robusta de gerenciamento de estado para Flutter.
- Google Fonts: Para fontes personalizadas.
- animate_do: Para animações fáceis de usar.
- url_launcher: Para lançar URLs (por exemplo, links de mídias sociais, e-mail).
- scroll_to_index: Para rolagem suave para seções específicas.
- floating_animation: Para belas animações de fundo flutuantes.
- lottie: Para renderizar animações do After Effects.
- Firebase Core: Para integração com Firebase.
- Firebase Hosting: Para implantação da aplicação web.

## Instalação e Configuração

Para ter uma cópia local em execução, siga estas etapas simples.

### Pré-requisitos

- Flutter SDK: [Guia de Instalação](https://flutter.dev/docs/get-started/install)
- Firebase CLI: [Guia de Instalação](https://firebase.google.com/docs/cli#install_the_firebase_cli)
- Node.js & npm: Necessário para o Firebase CLI.

### Passos

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/Meireles-Gabriel/portfolio2025.git
    cd portfolio2025
    ```

2.  **Instale as dependências do Flutter:**
    ```bash
    flutter pub get
    ```

3.  **Configuração do Firebase (se ainda não o fez):**
    - Certifique-se de ter um projeto Firebase configurado.
    - Faça login no Firebase:
      ```bash
      firebase login
      ```
    - Inicialize o Firebase em seu projeto (selecione Hosting e defina `build/web` como o diretório público):
      ```bash
      firebase init
      ```
    - Certifique-se de que seu arquivo `firebase_options.dart` seja gerado (execute `flutterfire configure` se estiver faltando).
    - Atualize seu arquivo `firebase.json` para múltiplos destinos de hospedagem, conforme mostrado na conversa anterior, se quiser implantar em vários sites.

## Uso

### Execute o aplicativo localmente

Para executar o aplicativo web Flutter localmente:

```bash
flutter run -d web
```

### Construir para Web

Para construir a versão web do aplicativo:

```bash
flutter build web
```

A saída da construção estará no diretório `build/web`.

### Implantar no Firebase Hosting

Para implantar seu aplicativo no Firebase Hosting:

```bash
firebase deploy --only hosting
```

Se você tiver vários destinos de hospedagem configurados no `firebase.json`, este comando implantará em todos eles.

## Estrutura do Projeto

```
portfolio2025/
├── lib/
│   ├── design.dart             # Dados de tema e constantes de design
│   ├── localization/           # Strings de localização da aplicação
│   │   └── app_localizations.dart
│   ├── main.dart               # Ponto de entrada principal da aplicação
│   ├── portfolio_home.dart     # Widget principal da home com navegação e seções
│   ├── providers/              # Provedores de estado do Riverpod
│   │   └── providers.dart
│   ├── sections/               # Seções individuais do portfólio
│   │   ├── about_section.dart
│   │   ├── contact_section.dart
│   │   ├── home_section.dart
│   │   ├── projects_section.dart
│   │   └── qualifications_section.dart
│   └── widgets.dart/           # Widgets personalizados
│       ├── floating_particles.dart
│       └── morphing_background.dart
├── assets/
│   ├── animations/             # Animações Lottie
│   └── images/                 # Imagens (ex: capturas de tela de projetos, ícones sociais)
├── pubspec.yaml                # Dependências e metadados do projeto
├── firebase.json               # Configuração do projeto Firebase
└── README.md                   # README do projeto
```

## Licença

Distribuído sob a Licença MIT. Veja `LICENSE` para mais informações.
