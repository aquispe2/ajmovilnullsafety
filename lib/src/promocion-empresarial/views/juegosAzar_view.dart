import 'package:get/get.dart';

import 'package:movilaj/src/promocion-empresarial/controllers/PromocionEmpresarialController.dart';
import 'package:movilaj/src/promocion-empresarial/models/juegoAzar_model.dart';
import 'package:movilaj/src/views/menu_principal_view.dart';

import 'package:movilaj/src/widgets/circularProgress_widget.dart';
import 'package:flutter/material.dart';

import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:movilaj/src/utils/colores.dart' as colores;

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
            style: estiloTexto.stlTituloBarBlanco,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colores.azul_claro_aj, colores.azul_oscuro_aj],
              ),
            ),
          )),
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
                        Text("NOMBRE DE EMPRESA",
                            style: estiloTexto.stlSubTitulo),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Text(
                            promocionEmpresarialController
                                .lstJuegoDeAzar[index].nombreOperador,
                            style: estiloTexto.stlTexto,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("NOMBRE DEL SALÓN DE JUEGO",
                            style: estiloTexto.stlSubTitulo),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Text(
                            promocionEmpresarialController
                                .lstJuegoDeAzar[index].nombreSalonJuego,
                            style: estiloTexto.stlTexto,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("HORARIO DE ATENCIÓN",
                            style: estiloTexto.stlSubTitulo),
                        Text(
                          promocionEmpresarialController
                              .lstJuegoDeAzar[index].horarioAtencion,
                          style: estiloTexto.stlTexto,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "JUEGOS AUTORIZADOS",
                          style: estiloTexto.stlSubTitulo,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        _juegosAutorizados(promocionEmpresarialController
                            .lstJuegoDeAzar[index].juegosAutorizados!),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "DIRECCIONES",
                          style: estiloTexto.stlSubTitulo,
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
            children: [
              SizedBox(
                height: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        size: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Text(
                          lstJuegosAutorizados[index],
                          style: estiloTexto.stlTexto,
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Regional: ",
                    style: estiloTexto.stlTextoBlue900,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Text(
                      lstDirecciones[index].regional,
                      style: estiloTexto.stlTexto,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Dirección: ",
                    style: estiloTexto.stlTextoBlue900,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Text(
                      lstDirecciones[index].direccion,
                      style: estiloTexto.stlTexto,
                    ),
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
