import 'dart:convert';

import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/controllers/seguimientoTramiteController.dart';
import 'package:movilaj/src/seguimiento/models/oficina_model.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/funciones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/variables.dart' as variable;
//import 'package:progress_dialog/progress_dialog.dart';

class TramiteFisicoView extends StatefulWidget {
  @override
  _TramiteFisicoViewState createState() => _TramiteFisicoViewState();
}

class _TramiteFisicoViewState extends State<TramiteFisicoView> {
  final TextEditingController _controllerGestion = TextEditingController();
  final TextEditingController _controllerNroHr = TextEditingController();

  OficinaModel? selectedOficina;
  Funciones objFuncion = new Funciones();

  final seguimientoTramiteController = Get.find<SeguimientoTramiteController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Seguimiento de Trámites en Físico",
            style: estiloTexto.stlTextoBold,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Si el Trámite es Físico haga la búsqueda por: Gestión, Oficina y Número Hoja de Ruta, los 3 parámetros son obligatorios, para realizar el seguimiento",
            textAlign: TextAlign.center,
            style: estiloTexto.stlTexto,
          ),
          SizedBox(
            height: 10,
          ),
          _crearTextoGestion(),
          SizedBox(
            height: 5,
          ),
          _crearTextoNroHojaRuta(),
          SizedBox(
            height: 5,
          ),
          Text(
            "Elija y seleccione la oficina en el que entregó el documento",
            textAlign: TextAlign.center,
            style: estiloTexto.stlTextoPequeno,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 1),
            ),
            child: _crearOficinasDropDown(),
          ),
          SizedBox(
            height: 5,
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
                  //ProgressDialog pr = objFuncion.generarDialogProgress(context, "Buscando Trámite en Físico");
                  if (_controllerGestion.text.trim().isEmpty ||
                      _controllerNroHr.text.trim().isEmpty ||
                      selectedOficina == null ||
                      selectedOficina!.oficinaId == 0) {
                    /*_mostrarAlert(context, "Mensaje",
                    "Debe ingresar gestión, hoja de ruta y seleccionar oficina ");*/

                    objFuncion.mostrarDialog("Mensaje",
                        "Debe ingresar gestión, hoja de ruta y seleccionar oficina");
                  } else {
                    //validar q sea solo numero
                    if (!objFuncion.esNumero(_controllerGestion.text.trim()) ||
                        !objFuncion.esNumero(_controllerNroHr.text.trim())) {
                      objFuncion.mostrarDialog("Mensaje",
                          "Gestión y N° de Hoja de Ruta deben ser números enteros");
                      return;
                    }

                    //pr.show();

                    await showDialog(
                      context: context,
                      builder: (context) => FutureProgressDialog(
                          seguimientoTramiteController
                              .cargarSeguimientoTramiteFisico(
                                  int.parse(_controllerGestion.text.trim()),
                                  selectedOficina!.oficinaId,
                                  int.parse(_controllerNroHr.text.trim())),
                          message: Text(variable.PROGRESS_BUSCANDO_HR)),
                    );
                    //pr.hide();

                    if (seguimientoTramiteController
                            .lstSeguimientoTramiteFisico.length >
                        0) {
                      //Navigator.pushNamed(context, 'tramite_fisico_detalle');
                      Get.toNamed('tramite_fisico_detalle');
                    } else {
                      objFuncion.mostrarDialog(
                          "Mensaje", "No existe datos para mostrar");
                    }
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
                    _controllerGestion.text = "";
                    _controllerNroHr.text = "";
                    selectedOficina = null;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _crearOficinasDropDown() {
    return Obx(() => (seguimientoTramiteController.lstOficina.length > 0)
        ? DropdownButton<OficinaModel>(
            isExpanded: true,
            hint: Text(
              "Seleccione Oficina",
              style: estiloTexto.stlTextoPequeno,
            ),
            value: selectedOficina,
            onChanged: (OficinaModel? newValue) {
              setState(() {
                selectedOficina = newValue;
              });
            },
            items:
                seguimientoTramiteController.lstOficina.map((OficinaModel ofi) {
              return new DropdownMenuItem<OficinaModel>(
                value: ofi,
                child: new Text(
                  ofi.nombreOficina,
                  style: estiloTexto.stlTexto,
                ),
              );
            }).toList(),
          )
        : Text("Cargando Oficinas"));
  }

  Widget _crearTextoGestion() {
    return TextField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: _controllerGestion,
      decoration: InputDecoration(
        hintStyle: estiloTexto.stlTextoPequeno,
        labelStyle: estiloTexto.stlTextoPequeno,
        counter: Offstage(),
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Gestión',
        labelText: 'Gestión',
      ),
    );
  }

  Widget _crearTextoNroHojaRuta() {
    return TextField(
      maxLength: 10,
      controller: _controllerNroHr,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        hintStyle: estiloTexto.stlTextoPequeno,
        labelStyle: estiloTexto.stlTextoPequeno,
        counter: Offstage(),
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'N° Hoja de Ruta',
        labelText: 'N° Hoja de Ruta',
      ),
    );
  }
}
