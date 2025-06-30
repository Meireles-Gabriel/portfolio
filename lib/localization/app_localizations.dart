class AppLocalizations {
  static const Map<String, Map<String, String>> _localizedValues = {
    'pt_BR': {
      'home': 'Início',
      'qualifications': 'Qualificações',
      'projects': 'Projetos em Destaque',
      'about': 'Sobre Mim',
      'contact': 'Entre em Contato',
      'hello': 'Olá, eu sou',
      'name': 'Gabriel Meireles',
      'role': 'Desenvolvedor Flutter/Python/IA',
      'intro':
          'Projetos cuidadosamente desenvolvidos que refletem meu comprometimento em cada linha de código. Juntos, vamos construir soluções sólidas e inovadoras!',
      'qualification1_title': 'Desenvolvimento Front-End',
      'qualification1_desc':
          'Criação de aplicativos belos, funcionais e responsivos que oferecem uma experiência de usuário excepcional em múltiplas plataformas.',
      'qualification2_title': 'Desenvolvimento Back-End',
      'qualification2_desc':
          'Construção de APIs robustas, automação de tarefas, processamento de dados e integração de sistemas com código limpo e eficiente.',
      'qualification3_title': 'Inteligência Artificial',
      'qualification3_desc':
          'Aplicação prática de IA para agregar valor aos projetos por meio de automação inteligente, análise de dados e otimização de processos.',
      'about_text':
          'Fascinado por tecnologia desde que me conheço por gente. Depois de me aprofundar na área com um curso técnico integrado ao ensino médio, me aventurei brevemente no mundo de desenvolvimento de jogos e, eventualmente, acabei por explorar várias áreas da programação. Com uma sólida experiência prática, acumulada em projetos desafiadores, trago uma bagagem repleta de aprendizados. Nestes desafios, fui constantemente impulsionado a inovar, aprimorar minhas habilidades de forma autodidata e, acima de tudo, a nutrir minha paixão pela tecnologia.',
      'send_message': 'Enviar Mensagem',
      'name_field': 'Nome',
      'email_field': 'Email',
      'phone_field': 'Telefone',
      'subject_field': 'Assunto',
      'message_field': 'Sua Mensagem',
      'fill_fields': 'Preencha todos os campos!',
      'project1_title': 'Éditto Magazine',
      'project1_desc':
          'Um gerador de PDFs que utiliza inteligência artificial para buscar notícias sobre determinado tema e transformá-los em artigos e capas para revistas.',
      'project2_title': 'StockChef',
      'project2_desc':
          'Um gerenciador de estoque para cozinhas de restaurantes. Além dos itens brutos, o app gerencia preparações já produzidas e os itens necessários para o preparo delas, levando em consideração na hora de gerar listas de compras.',
      'project3_title': 'AutoTrade',
      'project3_desc':
          'Sistema de automação que aplica sinais de Opções Binárias enviados por traders profissionais no Telegram. Também possui uma integração com o ChatGPT para analisar o gráfico e gerar seus próprios sinais.',
      'stat1_label': 'Comprometimento',
      'stat2_label': 'Foco',
      'stat3_label': 'Qualidade',
    },
    'en_US': {
      'home': 'Home',
      'qualifications': 'Qualifications',
      'projects': 'Featured Projects',
      'about': 'About Me',
      'contact': 'Contact',
      'hello': 'Hello, I am',
      'name': 'Gabriel Meireles',
      'role': 'Flutter/Python/AI Developer',
      'intro':
          'Thoughtfully developed projects that reflect my commitment in every line of code. Together, let\'s build solid and innovative solutions!',
      'qualification1_title': 'Front-End Development',
      'qualification1_desc':
          'Beautiful, functional, and responsive applications that offer an exceptional user experience on multiple platforms.',
      'qualification2_title': 'Back-End Development',
      'qualification2_desc':
          'Robust APIs, task automation, data processing, and system integration with clean and efficient code.',
      'qualification3_title': 'Artificial Intelligence',
      'qualification3_desc':
          'Practical application of AI to add value to projects through intelligent automation, data analysis, and process optimization.',
      'about_text':
          'Fascinated by technology since I can remember. After delving into the field with a technical course integrated into high school, I briefly ventured into game development and eventually explored various areas of programming. With solid practical experience accumulated through challenging projects, I bring a wealth of learning. In these challenges, I was constantly driven to innovate, self-learn, and above all, nurture my passion for technology.',
      'send_message': 'Send Message',
      'name_field': 'Name',
      'email_field': 'Email',
      'phone_field': 'Phone',
      'subject_field': 'Subject',
      'message_field': 'Your Message',
      'fill_fields': 'Fill in all fields!',
      'project1_title': 'Éditto Magazine',
      'project1_desc':
          'A PDF generator that uses artificial intelligence to search for news on a specific topic and transform them into articles and magazine covers.',
      'project2_title': 'StockChef',
      'project2_desc':
          'A stock manager for restaurant kitchens. In addition to raw items, the app manages already produced preparations and the items needed for their preparation, taking this into account when generating shopping lists.',
      'project3_title': 'AutoTrade',
      'project3_desc':
          'Automation system that applies Binary Options signals sent by professional traders on Telegram. It also has an integration with ChatGPT to analyze the graph and generate its own signals.',
      'stat1_label': 'Commitment',
      'stat2_label': 'Focus',
      'stat3_label': 'Quality',
    },
  };

  static String translate(String key, String locale) {
    return _localizedValues[locale]?[key] ?? key;
  }
}
