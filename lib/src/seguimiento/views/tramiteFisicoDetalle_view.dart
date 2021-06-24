import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/controllers/seguimientoTramiteController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movilaj/src/seguimiento/models/derivacionFisico_model.dart';
import 'package:movilaj/src/seguimiento/models/derivacion_model.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/widgets/circularProgress_widget.dart';

class TramiteFisicoDetalleView extends StatefulWidget {
  @override
  _TramiteFisicoDetalleViewState createState() =>
      _TramiteFisicoDetalleViewState();
}

class _TramiteFisicoDetalleViewState extends State<TramiteFisicoDetalleView> {
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
                Text("Seguimiento por Hoja de Ruta",
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
          body: _crearDatosTramiteFisico()),
    );
  }

  Widget _crearDatosTramiteFisico() {
    return Obx(() => (seguimientoTramiteController
                .lstSeguimientoTramiteFisico.length >
            0)
        ? ListView.builder(
            itemCount:
                seguimientoTramiteController.lstSeguimientoTramiteFisico.length,
            itemBuilder: (BuildContext context, int index) {
              if (seguimientoTramiteController
                          .lstSeguimientoTramiteFisico[index].flujoId !=
                      null &&
                  seguimientoTramiteController
                          .lstSeguimientoTramiteFisico[index].flujoId >
                      0) {
                seguimientoTramiteController.cargarDerivacionTramiteFisico(
                    seguimientoTramiteController
                        .lstSeguimientoTramiteFisico[index].tramiteId);
              } else {
                seguimientoTramiteController.cargarDerivacionTramite(
                    seguimientoTramiteController
                        .lstSeguimientoTramiteFisico[index].tramiteId);
              }

              return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("N° Trámite: ",
                                style: estiloTexto.stlSubTitulo),
                            Text(
                              '${seguimientoTramiteController.lstSeguimientoTramiteFisico[index].tramiteId}',
                              style: estiloTexto.stlTexto,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Hoja de Ruta: ",
                                style: estiloTexto.stlSubTitulo),
                            Text(
                              '${seguimientoTramiteController.lstSeguimientoTramiteFisico[index].numeroHojaRuta}',
                              style: estiloTexto.stlTexto,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Text("Gestión: ", style: estiloTexto.stlSubTitulo),
                            Text(
                              seguimientoTramiteController
                                  .lstSeguimientoTramiteFisico[index].gestion,
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
                                    .lstSeguimientoTramiteFisico[index]
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
                                  .lstSeguimientoTramiteFisico[index].cite,
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
                                .lstSeguimientoTramiteFisico[index].referencia,
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
                                    .lstSeguimientoTramiteFisico[index]
                                    .entregadoPor,
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
                                    .lstSeguimientoTramiteFisico[index].origen,
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
                              '${DateFormat('dd/MM/yyyy').format(seguimientoTramiteController.lstSeguimientoTramiteFisico[index].fechaRecepcion!)}',
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
                              '${DateFormat('dd/MM/yyyy').format(seguimientoTramiteController.lstSeguimientoTramiteFisico[index].fechaInicio!)}',
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
                              //'${(seguimientosTramites[index].fechaFin == null) ? 'En proceso' : DateFormat('dd/MM/yyyy').format(seguimientosTramites[index].fechaFin)}',
                              '${(seguimientoTramiteController.lstSeguimientoTramiteFisico[index].fechaFin == null) ? 'En proceso' : DateFormat('dd/MM/yyyy').format(DateTime.parse(seguimientoTramiteController.lstSeguimientoTramiteFisico[index].fechaFin))}',
                              style: estiloTexto.stlTexto,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.indigo,
                        ),
                        Obx(() => (seguimientoTramiteController
                                    .lstDerivacionesFisico.length >
                                0)
                            ? Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      child: Text(
                                        'Listado de Derivaciones',
                                        style: estiloTexto.stlSubTitulo,
                                        textAlign: TextAlign.center,
                                      )),
                                  (seguimientoTramiteController.lstSeguimientoTramiteFisico[index].flujoId !=
                                              null &&
                                          seguimientoTramiteController.lstSeguimientoTramiteFisico[index].flujoId >
                                              0)
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount:
                                              seguimientoTramiteController
                                                  .lstDerivacionesFisico.length,
                                          itemBuilder: (context, i) => _creatItemDerivacionFisico(
                                              seguimientoTramiteController
                                                  .lstDerivacionesFisico[i]))
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount:
                                              seguimientoTramiteController
                                                  .lstDerivaciones.length,
                                          itemBuilder: (context, i) =>
                                              _creatItemDerivacion(seguimientoTramiteController.lstDerivaciones[i]))
                                ],
                              )
                            : Container())
                      ],
                    ),
                  ));
            })
        : ((seguimientoTramiteController
                    .descargandoSeguimientoTramiteFisico.value ==
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

  Widget _creatItemDerivacionFisico(DerivacionFisicoModel pDerivacionModel) {
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
                    pDerivacionModel.etapa,
                    style: estiloTexto.stlTextoMediano,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(
                        DateTime.parse(pDerivacionModel.fechaRecepcion)),
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
