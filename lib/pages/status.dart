import 'package:band_name_socket/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  //const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketServices>(context);
    //socketService.socket.emit(event);

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('ServerStatus: ${socketService.serverStatus}')
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.message),
            onPressed: () {
              //  TAREA
              // emitir: emitir-mensaje
              // { nombre: 'Flutter', mensaje: 'Hola desde Flutter' }
              socketService.emit('emitir-mensaje',
                  {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'});
            }));
  }
}
