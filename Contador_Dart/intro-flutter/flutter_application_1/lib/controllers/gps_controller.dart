import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

/// Controller responsável por gerenciar funcionalidades de GPS e localização
///
/// Este controller permite obter a localização atual do dispositivo,
/// converter coordenadas em endereços e exibir a posição em um mapa.
class GpsController extends ChangeNotifier {
  // ===== SEÇÃO: DADOS DE LOCALIZAÇÃO =====
  // Posição GPS atual do dispositivo
  Position? _currentPosition;

  // Flag indicando se está buscando localização
  bool _isLoading = false;

  // Mensagem de status para exibição ao usuário
  String _statusMessage = 'Toque no botão para obter localização';

  // ===== SEÇÃO: COMPONENTES DO MAPA =====
  // Controller para gerenciar o mapa - inicialização tardia segura
  MapController? _mapController;

  // Lista de marcadores para exibir no mapa
  List<Marker> _markers = [];

  // ===== SEÇÃO: INFORMAÇÕES DE ENDEREÇO =====
  // Endereço completo baseado nas coordenadas
  String? _address;

  // Código postal (CEP) da localização
  String? _postalCode;

  // ===== SEÇÃO: GETTERS PÚBLICOS =====
  // Permitem acesso seguro aos dados internos do controller
  Position? get currentPosition => _currentPosition;
  bool get isLoading => _isLoading;
  String get statusMessage => _statusMessage;
  MapController? get mapController => _mapController;
  List<Marker> get markers => _markers;
  String? get address => _address;
  String? get postalCode => _postalCode;

  // ===== SEÇÃO: INICIALIZAÇÃO =====
  /// Inicializa o controller do mapa de forma segura
  void initializeMapController() {
    _mapController ??= MapController();
  }

  // ===== SEÇÃO: OBTENÇÃO DE LOCALIZAÇÃO =====
  /// Obtém a localização atual do dispositivo
  ///
  /// Verifica permissões, ativa serviços de localização se necessário,
  /// obtém coordenadas GPS e converte em endereço legível.
  Future<void> getCurrentLocation() async {
    _isLoading = true;
    _statusMessage = 'Obtendo localização...';
    notifyListeners();

    try {
      // Verificar e solicitar permissões de localização
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _statusMessage = 'Permissão de localização negada';
          _isLoading = false;
          notifyListeners();
          return;
        }
      }

      // Verificar se a permissão foi negada permanentemente
      if (permission == LocationPermission.deniedForever) {
        _statusMessage = 'Permissão de localização negada permanentemente';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Verificar se o serviço de GPS está ativo
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _statusMessage = 'Serviço de localização desabilitado';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Obter posição atual com máxima precisão e timeout
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation, // Máxima precisão
        timeLimit: const Duration(seconds: 15), // Timeout de 15 segundos
      );

      // Salvar posição e atualizar status
      _currentPosition = position;
      _statusMessage = 'Localização obtida com sucesso!';
      _isLoading = false;
      notifyListeners();

      // Buscar informações de endereço baseadas nas coordenadas
      await _getAddressFromCoordinates(position.latitude, position.longitude);

      // Atualizar marcador no mapa
      _updateMapMarker(position.latitude, position.longitude);
    } catch (e) {
      String errorMessage = 'Erro ao obter localização';

      if (e is TimeoutException) {
        errorMessage = 'Timeout: Localização demorou muito para responder';
      } else if (e is LocationServiceDisabledException) {
        errorMessage = 'Serviço de localização está desabilitado';
      } else if (e is PermissionDeniedException) {
        errorMessage = 'Permissão de localização negada';
      } else {
        errorMessage = 'Erro ao obter localização: ${e.toString()}';
      }

      _statusMessage = errorMessage;
      _isLoading = false;
      notifyListeners();
    }
  }

  // ===== SEÇÃO: CONVERSÃO DE COORDENADAS =====
  /// Converte coordenadas GPS em endereço legível
  ///
  /// Utiliza o serviço de geocodificação reversa para obter
  /// informações de endereço baseadas na latitude e longitude.
  Future<void> _getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      // Buscar informações de localização baseadas nas coordenadas
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // Montar endereço completo a partir dos componentes
        List<String> addressParts = [];

        if (place.street != null && place.street!.isNotEmpty) {
          addressParts.add(place.street!);
        }
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          addressParts.add(place.subLocality!);
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          addressParts.add(place.locality!);
        }
        if (place.administrativeArea != null &&
            place.administrativeArea!.isNotEmpty) {
          addressParts.add(place.administrativeArea!);
        }

        _address = addressParts.isNotEmpty
            ? addressParts.join(', ')
            : 'Endereço não encontrado';
        _postalCode = place.postalCode ?? 'CEP não encontrado';
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao buscar endereço: $e');
      }
      // Definir valores padrão em caso de erro
      _address = 'Endereço não encontrado';
      _postalCode = 'CEP não encontrado';
      notifyListeners();
    }
  }

  // ===== SEÇÃO: ATUALIZAÇÃO DO MAPA =====
  /// Atualiza o marcador no mapa e move a câmera
  ///
  /// Cria um marcador vermelho na posição atual e move a visualização
  /// do mapa para centralizar na localização obtida.
  void _updateMapMarker(double latitude, double longitude) {
    // Criar marcador na posição atual
    _markers = [
      Marker(
        point: LatLng(latitude, longitude),
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    ];
    notifyListeners();

    // Mover câmera para a localização atual com zoom apropriado (apenas se o controller estiver inicializado)
    if (_mapController != null) {
      try {
        _mapController!.move(
            LatLng(latitude, longitude), 18.0); // Zoom maior para mais detalhes
      } catch (e) {
        if (kDebugMode) {
          print('Erro ao mover câmera do mapa: $e');
        }
      }
    }
  }

  // ===== SEÇÃO: CLEANUP =====
  @override
  void dispose() {
    _mapController = null;
    super.dispose();
  }
}
