import 'package:get/get.dart';

import 'package:movilaj/src/promocion-empresarial/controllers/PromocionEmpresarialController.dart';
import 'package:movilaj/src/promocion-empresarial/models/juegoAzar_model.dart';
import 'package:movilaj/src/views/menu_principal_view.dart';

import 'package:movilaj/src/widgets/circularProgress_widget.dart';
import 'package:flutter/material.dart';

import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/variables.dart' as variable;

class JuegosAzarView extends StatefulWidget {
  @override
  _JuegosAzarState createState() => _JuegosAzarState();
}

class _JuegosAzarState extends State<JuegosAzarView> {
  final promocionEmpresarialController =
      Get.find<PromocionEmpresarialController>();

  @override
  Widget build(BuildContext context) {
    promocionEmpresarialController.cargarJuegosAzarTodos();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          variable.JUEGO_AZAR,
          style: estiloTexto.estiloTextoAppbar,
        ),
      ),
      drawer: MenuPrincipal(),
      body: _crearListaJuegosAzar(),
    );
  }

  Widget _crearListaJuegosAzar() {
    return Obx(() => (promocionEmpresarialController.lstJuegoDeAzar.length > 0)
        ? ListView.builder(
            itemCount: promocionEmpresarialController.lstJuegoDeAzar.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nombre de Empresa",
                            style: estiloTexto.estiloSubTitulo),
                        Text(
                          promocionEmpresarialController
                              .lstJuegoDeAzar[index].nombreOperador,
                          style: estiloTexto.estiloTextoNormal,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nombre del Salón de Juego",
                            style: estiloTexto.estiloSubTitulo),
                        Text(
                          promocionEmpresarialController
                              .lstJuegoDeAzar[index].nombreSalonJuego,
                          style: estiloTexto.estiloTextoNormal,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Horario de Atención",
                            style: estiloTexto.estiloSubTitulo),
                        Text(
                          promocionEmpresarialController
                              .lstJuegoDeAzar[index].horarioAtencion,
                          style: estiloTexto.estiloTextoNormal,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Juegos Autorizados",
                          style: estiloTexto.estiloSubTitulo,
                        ),
                        _juegosAutorizados(promocionEmpresarialController
                            .lstJuegoDeAzar[index].juegosAutorizados!),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Direcciones",
                          style: estiloTexto.estiloSubTitulo,
                        ),
                        _direcciones(promocionEmpresarialController
                            .lstJuegoDeAzar[index].lstDirecciones!),
                      ],
                    ),
                  ));
            })
        : ((promocionEmpresarialController.descargandoJuegosLoteria.value ==
                true)
            ? Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(child: CircularProgressWidget()))
            : Center(
                child: Text("No existe Juegos de Azar"),
              )));
  }

  Widget _juegosAutorizados(List<String> lstJuegosAutorizados) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: lstJuegosAutorizados.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    size: 15,
                  ),
                  Text(
                    lstJuegosAutorizados[index],
                    style: estiloTexto.estiloTextoNormal,
                  )
                ],
              )
            ],
          );
        });
  }

  _direcciones(List<LstDireccione> lstDirecciones) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: lstDirecciones.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Regional: ",
                    style: estiloTexto.estiloTextoNormal,
                  ),
                  Text(
                    lstDirecciones[index].regional,
                    style: estiloTexto.estiloTextoNormal,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Dirección: ",
                    style: estiloTexto.estiloTextoNormal,
                  ),
                  Text(
                    lstDirecciones[index].direccion,
                    style: estiloTexto.estiloTextoNormal,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
