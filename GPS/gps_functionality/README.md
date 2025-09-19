# Funcionalidade GPS - Guia de Integração

Este pacote contém a funcionalidade completa de GPS extraída do projeto `flutter_hardware_resources` para ser integrada no projeto `intro_flutter`.

## 📁 Estrutura dos Arquivos

```
gps_functionality/
├── lib/
│   ├── controllers/
│   │   └── gps_controller.dart     # Controller principal do GPS
│   └── pages/
│       └── gps_page.dart           # Interface de usuário do GPS
├── dependencies.txt                # Lista de dependências necessárias
└── README.md                      # Este arquivo
```

## 🚀 Como Integrar no Projeto intro_flutter

### Passo 1: Adicionar as Dependências

Abra o arquivo `pubspec.yaml` do seu projeto `intro_flutter` e adicione as seguintes dependências na seção `dependencies:`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # GPS e localização
  geolocator: ^10.1.0          # Para obter coordenadas GPS
  geocoding: ^2.1.1            # Para converter coordenadas em endereços
  
  # Mapa interativo  
  flutter_map: ^6.1.0         # Widget de mapa do Flutter
  latlong2: ^0.9.1             # Para trabalhar com coordenadas latitude/longitude
  
  # suas outras dependências...
```

Após adicionar, execute no terminal:
```bash
flutter pub get
```

### Passo 2: Copiar os Arquivos

1. **Copie o controller**: 
   - Copie o arquivo `lib/controllers/gps_controller.dart` para `lib/controllers/` do seu projeto `intro_flutter`
   - Se a pasta `controllers` não existir, crie ela

2. **Copie a página**:
   - Copie o arquivo `lib/pages/gps_page.dart` para `lib/pages/` do seu projeto `intro_flutter`
   - Se a pasta `pages` não existir, crie ela

### Passo 3: Configurar Permissões

#### Android
Adicione as seguintes permissões no arquivo `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
```

#### iOS
Adicione as seguintes chaves no arquivo `ios/Runner/Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Este app precisa acessar sua localização para funcionar corretamente.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Este app precisa acessar sua localização para funcionar corretamente.</string>
```

### Passo 4: Adicionar ao Menu Principal

No arquivo principal do seu projeto `intro_flutter` (geralmente `main.dart` ou onde está o menu), adicione uma nova opção para acessar a funcionalidade GPS:

```dart
import 'package:flutter/material.dart';
import 'pages/gps_page.dart';  // Importe a página GPS

// No seu widget de menu/lista, adicione:
ListTile(
  leading: Icon(Icons.location_on),
  title: Text('GPS / Localização'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GpsPage()),
    );
  },
),
```

### Passo 5: Testar a Funcionalidade

1. Execute o projeto: `flutter run`
2. Navegue até a nova opção "GPS / Localização" no menu
3. Toque no botão "Obter Localização"
4. Aceite as permissões quando solicitado
5. Verifique se o mapa aparece com sua localização atual

## ⚙️ Funcionalidades Incluídas

- ✅ **Obtenção de localização GPS** com alta precisão
- ✅ **Verificação automática de permissões** e solicitação ao usuário
- ✅ **Conversão de coordenadas para endereço** (geocodificação reversa)
- ✅ **Exibição em mapa interativo** com marcador da localização
- ✅ **Informações técnicas detalhadas** (latitude, longitude, altitude, precisão, etc.)
- ✅ **Interface moderna** com Cards e loading states
- ✅ **Tratamento de erros** robusto

## 🔧 Possíveis Problemas e Soluções

### Erro de permissões no Android
- Certifique-se de que as permissões estão corretas no `AndroidManifest.xml`
- Teste em um dispositivo físico (emulador pode ter limitações de GPS)

### Erro de dependências
- Execute `flutter clean` e depois `flutter pub get`
- Verifique se as versões das dependências são compatíveis

### Mapa não carrega
- Verifique sua conexão com a internet
- O mapa usa tiles do OpenStreetMap que requerem internet

### GPS não funciona no emulador
- Use um dispositivo físico para testar
- No emulador Android, você pode simular localização nas configurações

## 📱 Compatibilidade

- ✅ Android 6.0+ (API 23+)
- ✅ iOS 11.0+
- ✅ Dispositivos físicos e emuladores (com limitações no GPS)

## 🤝 Suporte

Se encontrar problemas durante a integração:
1. Verifique se seguiu todos os passos corretamente
2. Confirme que as dependências foram instaladas (`flutter pub get`)
3. Teste em um dispositivo físico se estiver usando emulador
4. Verifique as permissões do app nas configurações do dispositivo

---

**Desenvolvido para o desafio de transferência de funcionalidade GPS**
*Curso: [Nome do Curso] - Professor: [Nome do Professor]*