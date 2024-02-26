# Projeto Loja de Testes com API FakeStore

Este projeto é uma loja de testes desenvolvida em Flutter, utilizando a API FakeStore (https://fakestoreapi.com), uma API REST gratuita que fornece dados pseudo-reais de e-commerce. A FakeStore API é uma ferramenta valiosa para desenvolvedores que desejam testar e desenvolver aplicações de e-commerce sem a necessidade de depender de sistemas de back-end do mundo real.

A API FakeStore oferece uma variedade de endpoints que permitem buscar informações detalhadas de produtos, categorias, e dados de usuários. Isso proporciona uma experiência de desenvolvimento rica e realista, permitindo a criação de uma loja de e-commerce totalmente funcional com uma variedade de produtos e categorias.

Com a FakeStore API, este projeto demonstra como é possível criar uma loja de e-commerce robusta e funcional, utilizando as melhores práticas de desenvolvimento em Flutter e a arquitetura MVC.

# Pacotes instalados:


No projeto FakeStore, foram instalados os seguintes pacotes Flutter:

**[http](https://pub.dev/packages/http): ^1.1.0:** Este pacote fornece a maneira mais simples de buscar dados da internet. Ele fornece funções e classes de alto nível que permitem aos desenvolvedores fazer solicitações HTTP para servidores web. É uma biblioteca baseada em Future.  

**[flutter_riverpod](https://pub.dev/packages/flutter_riverpod): ^2.4.10:** Riverpod é um framework de cache reativo e vinculação de dados. É uma atualização do pacote de gerenciamento de estado Provider. Riverpod é altamente versátil, construído intencionalmente para evitar depender do Buildcontext do Flutter. Ele tem um widget que é usado para armazenar o estado de todos os seus provedores no seu aplicativo Flutter.  

**[carousel_slider](https://pub.dev/packages/carousel_slider): ^4.2.1:** Este widget de controle deslizante de carrossel suporta rolagem infinita e widget filho personalizado. Ele aceita principalmente dois parâmetros: opções e itens. Para as opções, você pode configurar o comportamento que precisa para o controle deslizante.  

**[flutter_native_splash](https://pub.dev/packages/flutter_native_splash) : ^2.3.13:** Este pacote Flutter personaliza a tela de splash nativa padrão branca do Flutter com cor de fundo e imagem de splash. Suporta modo escuro, tela cheia e muito mais.  

**[flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons): ^0.13.1:** Este pacote simplifica a tarefa de atualizar o ícone do lançador do seu aplicativo Flutter. Ele é totalmente flexível, permitindo que você escolha qual plataforma deseja atualizar o ícone do lançador e, se quiser, a opção de manter seu antigo ícone do lançador caso queira reverter em algum momento no futuro.  


Após a instalação do pacote **flutter_native_splash**, foram adicionadas as seguintes linhas de configuração ao arquivo pubspec.yaml:

```dart
flutter_native_splash:
  color: "#E73E1C"
  image: "assets/app/splash.png"
  android: true
  ios: true
  web: true
```
Estas configurações definem a cor de fundo (#E73E1C) e a imagem (assets/app/splash.png) da tela de inicialização (splash screen) do aplicativo. As opções android, ios e web indicam que a tela de inicialização será gerada para essas plataformas.

Para o pacote **flutter_launcher_icons**, foram adicionadas:  

```dart
flutter_icons:
  image_path: "assets/app/icon.png"
  ios: true
  remove_alpha_ios: true
  android: "launcher_icon"
  adaptative_icon_background: "#ffffff"
  adaptative_icon_foreground: "assets/app/icon-android.png"
```  

Estas configurações definem o caminho para a imagem do ícone do aplicativo (assets/app/icon.png), e especificam que os ícones serão gerados para Android e iOS. A opção remove_alpha_ios remove a transparência do ícone no iOS, e as opções adaptative_icon_background e adaptative_icon_foreground são usadas para criar um ícone adaptativo no Android.

Foram salvos três arquivos de imagens no formato PNG na pasta assets/app/:

icon.png: Uma imagem com fundo branco, utilizada como ícone do aplicativo. O tamanho da imagem é 1024x1024 pixels.
icon-android.png: Uma imagem com fundo transparente, utilizada como ícone adaptativo para Android. O tamanho da imagem é 1024x1024 pixels.
splash.png: Uma imagem com a cor primária do aplicativo, utilizada como imagem da tela de inicialização (splash screen). O tamanho da imagem é 1024x1024 pixels.
Após adicionar essas linhas de configuração, foram executados os seguintes comandos:

```flutter pub run flutter_launcher_icons:main```  
e  
```flutter pub run flutter_native_splash:create```  

O primeiro comando gera os ícones do aplicativo para as plataformas especificadas na configuração flutter_icons do arquivo pubspec.yaml. O segundo comando gera a tela de inicialização nativa para as plataformas especificadas na configuração flutter_native_splash do arquivo pubspec.yaml.

Estas etapas garantem que o aplicativo tenha ícones e uma tela de inicialização personalizados em todas as plataformas suportadas.



# Demonstração:    

https://github.com/welsoncmp/FakeStore/assets/42895405/adb22666-d862-4b95-9ccf-ad9f44d02ca6  


Telas:  

Tela Inicial:  
![01](https://github.com/welsoncmp/FakeStore/assets/42895405/556fa6a9-b571-4c11-8bd1-3bb4e2eea3e0)  

Carrinho:  
![02](https://github.com/welsoncmp/FakeStore/assets/42895405/28b68106-6014-40c7-affa-ae32cbf66612)  

Menu:  
![03](https://github.com/welsoncmp/FakeStore/assets/42895405/714c785b-ee68-4b0e-a699-39b92acbab04)  

Lista de desejos:  
![04](https://github.com/welsoncmp/FakeStore/assets/42895405/976e0786-f1e5-4d14-a575-2546dfaaa5a3)  

Detalhes do produto:  
![06](https://github.com/welsoncmp/FakeStore/assets/42895405/d3826f86-b5d3-434d-b3eb-4404adfdbbd8)  

Detalhes do usuário:  
![05](https://github.com/welsoncmp/FakeStore/assets/42895405/e9055bc9-59b7-49af-b58f-d2b5bf6f850b)  





