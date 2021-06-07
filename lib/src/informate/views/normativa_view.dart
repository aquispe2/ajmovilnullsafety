import 'dart:io';

import 'package:get/get.dart';
import 'package:movilaj/src/informate/controllers/normativa_controller.dart';
import 'package:movilaj/src/informate/models/normativa_model.dart';

import 'package:movilaj/src/utils/funciones.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
//import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:progress_dialog/progress_dialog.dart';
import '../../views/menu_principal_view.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;

class NormativaView extends StatefulWidget {
  @override
  _NormativaViewState createState() => _NormativaViewState();
}

class _NormativaViewState extends State<NormativaView> {
  final normativaController = Get.find<NormativaController>();

  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    normativaController.cargarNormativas();

    return Scaffold(
        appBar: AppBar(
          title:
              Text(variable.NORMATIVA, style: estiloTexto.stlTituloBarBlanco),
        ),
        drawer: MenuPrincipal(),
        body: Obx(() => (normativaController.lstNormativa.length > 0)
            ? Container(
                child: ListView.builder(
                    itemCount: normativaController.lstNormativa.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _crearItemNormativa(
                          pNormativa: normativaController.lstNormativa[index]);
                    }),
              )
            : Center(
                child: Text("No existe datos para mostrar"),
              )));
  }

  Widget _crearItemNormativa({NormativaModel? pNormativa}) {
    pNormativa = NormativaModel.parse(pNormativa);
    return Card(
        child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: colores.blue_grey_darken_1,
        ),
      ),
      child: Column(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(
              Icons.picture_as_pdf,
              color: colores.blue_grey_darken_1,
            ),
            key: PageStorageKey<NormativaModel>(pNormativa),
            title: Text(
              pNormativa.normativa.toUpperCase(),
              style: estiloTexto.stlSubTitulo,
            ),
            children:
                pNormativa.lstNormativa!.map(_verDetalleNormativa).toList(),
          )
        ],
      ),
    ));
  }

  Widget _verDetalleNormativa(LstNormativa pNormativaModel) {
    return InkWell(
      onTap: () async {
        //ProgressDialog pr =objFuncion.generarDialogProgress(context, "Descargando archivo");
        //pr.show();
        try {
          var urlDividido = pNormativaModel.urlArchivo.split("/");
          var nombre_archivo =
              urlDividido[urlDividido.length - 1].toString().trim();
          Directory tempDir = await getTemporaryDirectory();
          String tempPath = tempDir.path;

          await objFuncion.downloadFile(
              pNormativaModel.urlArchivo, nombre_archivo, tempPath);
          await Future.delayed(Duration(seconds: 1));
          //pr.hide();
          OpenFile.open('$tempPath/${nombre_archivo}');
        } catch (ex) {
          print("errorrr: " + ex.toString());
          objFuncion.mostrarDialog("Error",
              "no pude descargar el archivo, favor de verificar que tenga conexión a internet y que tenga instalado alguna aplicación para abrir los documentos");

          await Future.delayed(Duration(seconds: 1));
          //pr.hide();
        }
      },
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.brightness_1,
                  size: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  pNormativaModel.nombre,
                  style: estiloTexto.stlSubTitulo,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.brightness_1,
                  size: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Fecha de emisión: ${DateFormat('dd/MM/yyyy').format(pNormativaModel.fechaEmision)}',
                  style: estiloTexto.stlTexto,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.brightness_1,
                  size: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(pNormativaModel.descripcion,
                      style: estiloTexto.stlTexto),
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
