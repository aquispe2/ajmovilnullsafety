import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/controllers/seguimientoTramiteController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movilaj/src/seguimiento/models/derivacion_model.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/widgets/circularProgress_widget.dart';

class TramitePlataformaDetalleView extends StatefulWidget {
  @override
  _TramitePlataformaDetalleViewState createState() =>
      _TramitePlataformaDetalleViewState();
}

class _TramitePlataformaDetalleViewState
    extends State<TramitePlataformaDetalleView> {
  final seguimientoTramiteController = Get.find<SeguimientoTramiteController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _clickAtras,
      child: Scaffold(
          appBar: AppBar(
              title: Column(children: [
                Text(
                  "Búsqueda",
                  style: estiloTexto.stlTituloBarBlanco,
                ),
                Text("Seguimiento por N° de Trámite",
                    style: TextStyle(
                        fontSize: 10, color: colores.blue_grey_lighten_4))
              ]),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colores.azul_claro_aj, colores.azul_oscuro_aj],
                  ),
                ),
              )),
          body: _crearDatosTramitePlataforma()),
    );
  }

  Widget _crearDatosTramitePlataforma() {
    return Obx(() =>
        (seguimientoTramiteController.lstSeguimientoTramitePlataforma.length >
                0)
            ? Container(
                color: colores.grey_lighten_2,
                child: ListView.builder(
                    itemCount: seguimientoTramiteController
                        .lstSeguimientoTramitePlataforma.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _crearItemTramite(context, index);
                    }),
              )
            : ((seguimientoTramiteController
                        .descargandoSeguimientoTramitePlataforma.value ==
                    true)
                ? Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(child: CircularProgressWidget()))
                : Center(
                    child: Text("No se pudo descargar tramite físico"),
                  )));
  }

  //http://ajmovil.aj.gob.bo:50090/api/v1/extras/generic_derivations_v3/10171

  Widget _crearItemTramite(BuildContext context, int index) {
    return Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("N° Trámite: ", style: estiloTexto.stlSubTitulo),
                  Text(
                      '${seguimientoTramiteController.lstSeguimientoTramitePlataforma[index].tramiteId}',
                      style: estiloTexto.stlTexto),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Hoja de Ruta: ", style: estiloTexto.stlSubTitulo),
                  Text(
                    '${seguimientoTramiteController.lstSeguimientoTramitePlataforma[index].numeroHojaRuta}',
                    style: estiloTexto.stlTexto,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Tipo de Trámite: ",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Text(
                      seguimientoTramiteController
                          .lstSeguimientoTramitePlataforma[index]
                          .tipoTramiteDescripcion,
                      style: estiloTexto.stlTexto,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Cite: ",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Text(
                    seguimientoTramiteController
                        .lstSeguimientoTramitePlataforma[index].cite,
                    style: estiloTexto.stlTexto,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Referencia",
                style: estiloTexto.stlSubTitulo,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                child: Text(
                  seguimientoTramiteController
                      .lstSeguimientoTramitePlataforma[index].referencia,
                  style: estiloTexto.stlTexto,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Entregado por: ",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Text(
                      seguimientoTramiteController
                          .lstSeguimientoTramitePlataforma[index].entregadoPor,
                      style: estiloTexto.stlTexto,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Origen: ",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Text(
                      seguimientoTramiteController
                          .lstSeguimientoTramitePlataforma[index].origen,
                      style: estiloTexto.stlTexto,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Fecha recepción: ",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Text(
                    ' ${DateFormat('dd/MM/yyyy').format(seguimientoTramiteController.lstSeguimientoTramitePlataforma[index].fechaRecepcion!)}',
                    style: estiloTexto.stlTexto,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Fecha inicio: ",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Text(
                    ' ${DateFormat('dd/MM/yyyy').format(seguimientoTramiteController.lstSeguimientoTramitePlataforma[index].fechaInicio!)}',
                    style: estiloTexto.stlTexto,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Fecha fin: ",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Text(
                    //' ${DateFormat('dd/MM/yyyy').format(seguimientosTramites[index].fechaFin)}',
                    '${(seguimientoTramiteController.lstSeguimientoTramitePlataforma[index].fechaFin == null) ? 'En proceso' : DateFormat('dd/MM/yyyy').format(DateTime.parse(seguimientoTramiteController.lstSeguimientoTramitePlataforma[index].fechaFin))}',
                    style: estiloTexto.stlTexto,
                  ),
                ],
              ),
              Divider(
                color: Colors.indigo,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'Listado de Derivaciones',
                    style: estiloTexto.stlSubTitulo,
                    textAlign: TextAlign.right,
                  )),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount:
                      seguimientoTramiteController.lstDerivaciones.length,
                  itemBuilder: (context, i) => _creatItemDerivacion(
                      seguimientoTramiteController.lstDerivaciones[i]))
            ],
          ),
        ));
  }

  Widget _creatItemDerivacion(DerivacionModel pDerivacionModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Icons.done,
              size: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    pDerivacionModel.area,
                    style: estiloTexto.stlTextoMediano,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(
                        DateTime.parse(pDerivacionModel.fechaAsignacion)),
                    style: estiloTexto.stlTextoMediano,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Future<bool> _clickAtras() {
    Get.toNamed("seguimiento_tramites");
    return new Future.value(true);
  }
}
