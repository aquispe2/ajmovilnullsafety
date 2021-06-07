import 'dart:io';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/controllers/consultaReclamoDenunciaController.dart';
import 'package:movilaj/src/seguimiento/models/casoAdjunto_model.dart';
import 'package:movilaj/src/seguimiento/models/caso_model.dart';

import 'package:movilaj/src/utils/apis.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/widgets/circularProgress_widget.dart';

import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/funciones.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
//import 'package:progress_dialog/progress_dialog.dart';

class CasoDetalleView extends StatefulWidget {
  @override
  _CasoDetalleView createState() => _CasoDetalleView();
}

class _CasoDetalleView extends State<CasoDetalleView> {
  final consultasReclamosDenunciasController =
      Get.find<ConsultasReclamosDenunciasController>();

  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '${variable.SEGUIMIENTO_CONSULTAS_RECLAMOS} ',
            style: estiloTexto.stlTituloBarBlanco,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colores.azul_claro_aj, colores.azul_oscuro_aj],
              ),
            ),
          )),
      body: Container(
        color: colores.grey_lighten_2,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _datosConsultas(),
          ],
        ),
      ),
    );
  }

  Widget _datosConsultas() {
    return Obx(() => (consultasReclamosDenunciasController.lstCaso.length > 0)
        ? ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: consultasReclamosDenunciasController.lstCaso.length,
            itemBuilder: (context, i) => _datosTodosConsulta(
                consultasReclamosDenunciasController.lstCaso[i]))
        : ((consultasReclamosDenunciasController.descargandoCaso.value == true)
            ? Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(child: CircularProgressWidget()))
            : Center(
                child: Text("No existe Caso para ese número"),
              )));
  }

  Widget _datosTodosConsulta(CasoModel caso) {
    return Column(
      children: <Widget>[
        _datosConsulta(caso),
        _datosAdjunto(caso),
        _datosRespuesta(caso)
      ],
    );
  }

  Widget _datosAdjunto(CasoModel caso) {
    consultasReclamosDenunciasController
        .cargarAdjuntoCasosPorCasoId(caso.casoId);

    return Obx(
        () => (consultasReclamosDenunciasController.lstCasoAdjunto.length > 0)
            ? Card(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "DATOS ADJUNTOS",
                        style: estiloTexto.stlTexto,
                      ),
                      Divider(
                        color: Colors.indigo,
                      ),
                      Text(
                        "(Para descargar y/o ver el adjunto, debe presionar sobre el nombre del archivo)",
                        textAlign: TextAlign.center,
                        style: estiloTexto.stlTextoPequeno,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: consultasReclamosDenunciasController
                              .lstCasoAdjunto.length,
                          itemBuilder: (context, i) => _datosAdjuntos(
                              consultasReclamosDenunciasController
                                  .lstCasoAdjunto[i])),
                    ],
                  ),
                ),
              )
            : Card(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "DATOS ADJUNTOS",
                        style: estiloTexto.stlTexto,
                      ),
                      Divider(
                        color: Colors.indigo,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "no existe adjuntos para mostrar",
                        style: estiloTexto.stlTextoPequeno,
                      ),
                    ],
                  ),
                ),
              ));
  }

  Widget _datosAdjuntos(CasoAdjuntoModel adjuntos) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 0, top: 5, bottom: 5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.file_download,
                    color: Colors.pink,
                    size: 24.0,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: GestureDetector(
                        child: Text(adjuntos.nombreArchivo,
                            style: estiloTexto.stlTexto),
                        onTap: () async {
                          //ProgressDialog pr = objFuncion.generarDialogProgress(context, "Descargando archivo");
                          //pr.show();
                          try {
                            Directory tempDir = await getTemporaryDirectory();
                            String tempPath = tempDir.path;
                            String uri =
                                '$API_AJAYU/$PATH_FILE/${adjuntos.nombreArchivo}';

                            showDialog(
                              context: context,
                              builder: (context) => FutureProgressDialog(
                                  objFuncion.downloadFile(
                                      uri, adjuntos.nombreArchivo, tempPath),
                                  message: Text(
                                      variable.PROGRESS_DESCARGANDO_ARCHIVO)),
                            );

                            await Future.delayed(Duration(seconds: 1));
                            //pr.hide();
                            OpenFile.open(
                                '$tempPath/${adjuntos.nombreArchivo}');
                          } catch (ex) {
                            //objFuncion.mostrarAlert(context,"no pude descargar el archivo, favor de verificar que tenga conexión a internet y que tenga instalado alguna aplicación para abrir los documentos");
                            objFuncion.mostrarDialog("Mensaje",
                                "no pude descargar el archivo, favor de verificar que tenga conexión a internet y que tenga instalado alguna aplicación para abrir los documentos");

                            await Future.delayed(Duration(seconds: 1));
                            //pr.hide();
                          }
                        }))
              ],
            ),
          ],
        ));
  }

  Card _datosConsulta(CasoModel caso) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  "DATOS DE LA CONSULTA",
                  style: estiloTexto.stlTexto,
                ),
                Divider(
                  color: Colors.indigo,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Tipo de Registro:',
                        style: estiloTexto.stlSubTitulo,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        caso.descripcionRegistro != null
                            ? caso.descripcionRegistro
                            : '',
                        style: estiloTexto.stlTexto,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Tipo de proceso:',
                        style: estiloTexto.stlSubTitulo,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        caso.descripcionProceso != null
                            ? caso.descripcionProceso
                            : '',
                        style: estiloTexto.stlTexto,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Departamento:',
                        style: estiloTexto.stlSubTitulo,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        caso.descripcionDepartamento != null
                            ? caso.descripcionDepartamento
                            : '',
                        style: estiloTexto.stlTexto,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Fecha de solicitud:',
                        style: estiloTexto.stlSubTitulo,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        "${DateFormat('dd/MM/yyyy').format(DateTime.parse(caso.fechaRegistro))} ",
                        style: estiloTexto.stlTexto,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Estado:',
                        style: estiloTexto.stlSubTitulo,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        caso.descripcionEstadoCaso,
                        style: estiloTexto.stlTexto,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                        'Descripción de la denuncia :',
                        style: estiloTexto.stlSubTitulo,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: Text(
                        caso.descripcion,
                        style: estiloTexto.stlTexto,
                      ),
                    )
                  ],
                )
              ],
            )));
  }

  Card _datosRespuesta(CasoModel caso) {
    if (caso.respuestaParcial == null && caso.conclusion == null) {
      return Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                "DATOS DE RESPUESTA",
                style: estiloTexto.stlTexto,
              ),
              Divider(
                color: Colors.indigo,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "aún no tiene una respuesta",
                style: estiloTexto.stlTextoPequeno,
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "DATOS DE RESPUESTA",
                    style: estiloTexto.stlTexto,
                  ),
                  Divider(
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Respuesta parcial',
                          style: estiloTexto.stlSubTitulo,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Text(
                          (caso.respuestaParcial != null)
                              ? caso.respuestaParcial
                              : 'aún no tiene una respuesta parcial',
                          style: estiloTexto.stlTexto,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Respuesta final',
                          style: estiloTexto.stlSubTitulo,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Text(
                          (caso.conclusion != null)
                              ? caso.conclusion
                              : 'aún no tiene una respuesta final',
                          style: estiloTexto.stlTexto,
                        ),
                      ),
                    ],
                  )
                ],
              )));
    }
  }
}
