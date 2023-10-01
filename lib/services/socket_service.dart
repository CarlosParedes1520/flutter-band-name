import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketServices with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket? _socket;
  //IO.Socket socket = _socket ?? defaultValue;
  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket!;
  Function get emit => _socket!.emit;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    // Dart client
    _socket = IO.io('http://192.168.18.43:3000', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    _socket!.on('connect', (_) {
      print('connect');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket!.on('event', (data) => print(data));

    _socket!.on('disconnect', (_) {
      print('disconnect');
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    socket.on('nuevo-mensaje', (payload) {
      print('nombre:' + payload['nombre']);
      print('mensaje:' + payload['mensaje']);
      print(payload.containsKey('mensaje2')
          ? payload['mensaje2']
          : 'no hay mensaje 2');
    });
  }
}
