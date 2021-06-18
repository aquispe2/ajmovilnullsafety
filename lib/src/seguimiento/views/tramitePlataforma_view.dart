import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/controllers/seguimientoTramiteController.dart';
import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/funciones.dart';
import 'package:movilaj/src/utils/variables.dart' as variable;
//import 'package:progress_dialog/progress_dialog.dart';

class TramitePlataforma extends StatefulWidget {
  @override
  _TramitePlataformaState createState() => _TramitePlataformaState();
}

class _TramitePlataformaState extends State<TramitePlataforma> {
  final seguimientoTramiteController = Get.find<SeguimientoTramiteController>();

  final TextEditingController _controllerBuscarPorTramiteId =
      TextEditingController();
  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Text(
            "Seguimiento de Trámites en Plataforma",
            style: estiloTexto.stlTextoBold,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Si el Trámite fue realizado mediante la Plataforma AJ en línea PAJEL+, entonces haga la búsqueda solamente por el número de trámite, para realizar el seguimiento",
            textAlign: TextAlign.center,
            style: estiloTexto.stlTexto,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            maxLength: 10,
            keyboardType: TextInputType.number,
            controller: _controllerBuscarPorTramiteId,
            autofocus: false,
            decoration: InputDecoration(
              hintStyle: estiloTexto.stlTextoPequeno,
              labelStyle: estiloTexto.stlTextoPequeno,
              counter: Offstage(),
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Digite el Número de Trámite',
              labelText: 'Digite el Número de Trámite',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: colores.blue_grey_darken_1,
                textColor: Colors.white,
                label: Text('Buscar'),
                icon: Icon(Icons.search),
                onPressed: () async {
                  //ProgressDialog pr = objFuncion.generarDialogProgress(context, "Buscando Trámite en Plataforma");

                  if (_controllerBuscarPorTramiteId.text.trim().isEmpty) {
                    objFuncion.mostrarDialog(
                        "Mensaje", "Debe ingresar el número de trámite");
                  } else {
                    //validar q sea solo numero
                    if (!objFuncion
                        .esNumero(_controllerBuscarPorTramiteId.text.trim())) {
                      objFuncion.mostrarDialog(
                          "Mensaje", "N° de Trámite debe ser un número entero");

                      return;
                    }

                    //pr.show();

                    /*await showDialog(
                      context: context,
                      builder: (context) => FutureProgressDialog(
                          seguimientoTramiteController
                              .cargarSeguimientoTramitePlataforma(int.parse(
                                  _controllerBuscarPorTramiteId.text.trim())),
                          message: Text(variable.PROGRESS_BUSCANDO_TRAMITE)),
                    );*/

                    var result = await objFuncion.showProgress(
                        context,
                        seguimientoTramiteController
                            .cargarSeguimientoTramitePlataforma(int.parse(
                                _controllerBuscarPorTramiteId.text.trim())));
                    if (result) {
                      Get.toNamed('tramite_plataforma_detalle');
                    } else {
                      objFuncion.mostrarDialog(
                          "Mensaje", "No se ha encontrado la Hoja de Ruta");
                    }

                    /*if (seguimientoTramiteController
                            .descargandoSeguimientoTramitePlataforma.value ==
                        false) {
                      if (seguimientoTramiteController
                              .lstSeguimientoTramitePlataforma.length >
                          0) {
                        Get.toNamed('tramite_plataforma_detalle');
                      } else {
                        objFuncion.mostrarDialog(
                            "Mensaje", "No existe datos para mostrar");
                      }
                    }*/

                  }
                },
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: colores.blue_grey_darken_1,
                textColor: Colors.white,
                label: Text('Limpiar'),
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _controllerBuscarPorTramiteId.text = "";
                  });
                },
              ),
            ],
          )
        ]));
  }
}
