# 📱 Counter Dart - Flutter Learning Project

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.6.1-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.6.1-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

*Um projeto Flutter educacional que demonstra conceitos fundamentais de desenvolvimento mobile e integração com funcionalidades de hardware*

[Funcionalidades](#-funcionalidades) • [Instalação](#-instalação) • [Estrutura](#-estrutura-do-projeto) • [Como Usar](#-como-usar) • [Contribuição](#-contribuição)

</div>

---

## 📖 Sobre o Projeto

O **Counter Dart** é um projeto Flutter desenvolvido para fins educacionais, demonstrando a implementação de padrões de gerenciamento de estado, integração com APIs de geolocalização e desenvolvimento de interfaces responsivas. O projeto combina conceitos básicos e avançados do Flutter em uma aplicação prática e funcional.

### 🎯 Objetivos Educacionais

- **Gerenciamento de Estado**: Implementação de `ChangeNotifier` e `ValueNotifier`
- **Navegação**: Sistema de navegação entre telas
- **Integração de Hardware**: Acesso a GPS e sensores de localização
- **UI/UX**: Design de interfaces responsivas e intuitivas
- **Arquitetura**: Organização de código seguindo boas práticas

---

## ✨ Funcionalidades

### 🔢 Sistema de Contadores
- **Counter Screen Notifier**: Implementação de contador usando `ValueNotifier`
- **Change Notifier Example**: Demonstração de `ChangeNotifier` para gerenciamento de estado
- Interface responsiva com feedback visual imediato

### 🗺️ GPS e Localização
- **Obtenção de Localização**: Acesso à localização atual do dispositivo
- **Mapa Interativo**: Visualização da posição em mapa usando OpenStreetMap
- **Geocodificação Reversa**: Conversão de coordenadas em endereços legíveis
- **Detalhes Técnicos**: Exibição completa de dados GPS (latitude, longitude, altitude, precisão)
- **Gerenciamento de Permissões**: Tratamento adequado de permissões de localização

### 🎨 Interface de Usuário
- **Design Material**: Interface seguindo guidelines do Material Design
- **Cards Personalizados**: Componentes reutilizáveis para navegação
- **Responsividade**: Layout adaptável a diferentes tamanhos de tela
- **Feedback Visual**: Indicadores de carregamento e status

---

## 🛠️ Tecnologias Utilizadas

### Core Flutter
- **Flutter SDK**: 3.6.1
- **Dart**: 3.6.1
- **Material Design**: Interface nativa Android/iOS

### Dependências Principais
- **geolocator** (^10.1.0): Acesso a serviços de geolocalização
- **geocoding** (^2.1.1): Conversão de coordenadas em endereços
- **flutter_map** (^6.1.0): Widget de mapa interativo
- **latlong2** (^0.9.1): Manipulação de coordenadas geográficas

### Ferramentas de Desenvolvimento
- **flutter_lints** (^5.0.0): Análise estática de código
- **flutter_test**: Framework de testes unitários

---

## 📁 Estrutura do Projeto

```
Counter_Dart/
├── 📁 Contador_Dart/
│   └── 📁 intro-flutter/
│       └── 📁 flutter_application_1/          # Aplicação principal
│           ├── 📁 lib/
│           │   ├── 📁 components/             # Componentes reutilizáveis
│           │   │   └── custom_card.dart       # Card personalizado para navegação
│           │   ├── 📁 controllers/            # Controladores de estado
│           │   │   └── gps_controller.dart    # Controller GPS e localização
│           │   ├── 📁 examples/               # Exemplos educacionais
│           │   │   ├── change_counter_screen.dart
│           │   │   ├── simple_change_notifier_example.dart
│           │   │   ├── user_controller.dart
│           │   │   └── value_notifier_counter_screen.dart
│           │   ├── 📁 pages/                  # Telas da aplicação
│           │   │   ├── counter_screen_page.dart
│           │   │   ├── gps_page.dart          # Tela de GPS e mapas
│           │   │   └── home_screen.dart       # Tela principal
│           │   ├── main.dart                  # Ponto de entrada
│           │   └── material_app.dart          # Configuração do app
│           ├── pubspec.yaml                   # Dependências e metadados
│           └── README.md
├── 📁 GPS/
│   └── 📁 gps_functionality/                  # Código fonte original GPS
│       ├── dependencies.txt                  # Lista de dependências
│       ├── README.md
│       ├── RESUMO_EXECUTIVO.md
│       └── 📁 lib/
│           ├── 📁 controllers/
│           └── 📁 pages/
├── LICENSE                                    # Licença do projeto
└── README.md                                 # Este arquivo
```

---

## 🚀 Instalação

### Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- **Flutter SDK** 3.6.1 ou superior
- **Dart SDK** 3.6.1 ou superior
- **Android Studio** ou **VS Code** com extensões Flutter
- **Git** para controle de versão

### Passos de Instalação

1. **Clone o repositório**
```bash
git clone https://github.com/jimmyadmsenior/Counter_Dart.git
cd Counter_Dart
```

2. **Navegue para o diretório da aplicação**
```bash
cd Contador_Dart/intro-flutter/flutter_application_1
```

3. **Instale as dependências**
```bash
flutter pub get
```

4. **Verifique a instalação**
```bash
flutter doctor
```

5. **Execute a aplicação**
```bash
flutter run
```

### Configuração de Permissões

#### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

#### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Este app precisa de acesso à localização para funcionalidades de GPS.</string>
```

---

## 🎮 Como Usar

### Tela Principal
1. **Inicie a aplicação** - A tela principal exibirá três opções principais
2. **Navegue pelas funcionalidades** - Toque nos cards para acessar diferentes recursos

### Funcionalidades de Contador
1. **Counter Screen Notifier**: Demonstra uso de `ValueNotifier`
   - Toque nos botões + e - para incrementar/decrementar
   - Observe a reatividade da interface

2. **Change Notifier Example**: Exemplifica `ChangeNotifier`
   - Interaja com os controles para ver mudanças de estado
   - Analise como o padrão Observer funciona

### Funcionalidades GPS
1. **Acesse GPS/Localização** - Toque no card verde com ícone de localização
2. **Obtenha sua localização** - Toque em "Obter Localização"
3. **Permita acesso** - Autorize o acesso à localização quando solicitado
4. **Explore o mapa** - Visualize sua posição no mapa interativo
5. **Veja detalhes** - Analise informações técnicas de GPS

### Recursos do GPS
- **📍 Localização Atual**: Coordenadas precisas
- **🗺️ Mapa Interativo**: Visualização em OpenStreetMap
- **🏠 Endereço**: Geocodificação reversa automática
- **📊 Dados Técnicos**: Altitude, precisão, velocidade, direção

---

## 🏗️ Arquitetura

### Padrões Implementados

#### **State Management**
- **ChangeNotifier**: Para controllers complexos (GPS)
- **ValueNotifier**: Para estados simples (contadores)
- **Stateful/Stateless Widgets**: Conforme necessidade

#### **Separation of Concerns**
- **Controllers**: Lógica de negócio isolada
- **Pages**: Apresentação e interface
- **Components**: Elementos reutilizáveis

#### **Clean Architecture**
```
Presentation Layer (Pages/Widgets)
       ↓
Business Logic Layer (Controllers)
       ↓
Data Layer (APIs/Services)
```

### Fluxo de Dados

1. **User Interaction** → Widget
2. **Widget** → Controller (via callbacks)
3. **Controller** → Business Logic
4. **Controller** → notifyListeners()
5. **Widget** → rebuild (setState/listening)

---

## 🧪 Testes

### Executar Testes
```bash
# Testes unitários
flutter test

# Análise de código
flutter analyze

# Verificação de dependências
flutter pub deps
```

### Cobertura de Testes
- **Unit Tests**: Controllers e lógica de negócio
- **Widget Tests**: Componentes de interface
- **Integration Tests**: Fluxos completos

---

## 🤝 Contribuição

Contribuições são bem-vindas! Siga estas diretrizes:

### Como Contribuir

1. **Fork** o projeto
2. **Crie** uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. **Push** para a branch (`git push origin feature/AmazingFeature`)
5. **Abra** um Pull Request

### Diretrizes

- Siga as convenções de código Dart/Flutter
- Adicione testes para novas funcionalidades
- Mantenha a documentação atualizada
- Use mensagens de commit descritivas

### Código de Conduta

Este projeto adere ao [Código de Conduta](CODE_OF_CONDUCT.md). Ao participar, você concorda em manter um ambiente respeitoso e inclusivo.

---

## 📚 Recursos Educacionais

### Conceitos Demonstrados

#### **State Management**
- `ChangeNotifier` vs `ValueNotifier`
- Observer Pattern
- Reactive Programming
- State Lifting

#### **Flutter Architecture**
- Widget Tree
- Build Context
- Lifecycle Management
- Navigation

#### **Hardware Integration**
- GPS/Location Services
- Permission Handling
- Platform Channels
- Async Programming

#### **UI/UX Design**
- Material Design
- Responsive Layout
- Custom Widgets
- Theme Management

### Próximos Passos

Para expandir seus conhecimentos:

1. **State Management Avançado**: Provider, Riverpod, BLoC
2. **Persistência**: SharedPreferences, SQLite, Hive
3. **Networking**: HTTP, REST APIs, GraphQL
4. **Testes**: Unit, Widget, Integration
5. **Performance**: Optimization, Profiling
6. **Deployment**: App Store, Play Store

---

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

## 👨‍💻 Autor

**jimmyadmsenior**
- GitHub: [@jimmyadmsenior](https://github.com/jimmyadmsenior)

---

## 🙏 Agradecimentos

- **Flutter Team** pela excelente framework
- **Community Contributors** pelas bibliotecas utilizadas
- **OpenStreetMap** pelos dados de mapa gratuitos
- **Geolocator Team** pela biblioteca de localização

---

<div align="center">

**⭐ Se este projeto foi útil, considere dar uma estrela!**

*Desenvolvido com ❤️ para a comunidade Flutter*

</div>

