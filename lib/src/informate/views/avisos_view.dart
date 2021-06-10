import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/informate/controllers/aviso_controller.dart';
import 'package:movilaj/src/informate/models/aviso_model.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/funciones.dart';
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:movilaj/src/views/menu_principal_view.dart';
import 'package:movilaj/src/widgets/circularProgress_widget.dart';
import 'package:movilaj/src/utils/apis.dart' as api;

class AvisosView extends StatefulWidget {
  @override
  _AvisosViewState createState() => _AvisosViewState();
}

class _AvisosViewState extends State<AvisosView> {
  final avisoController = Get.find<AvisoController>();

  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    avisoController.obtenerAviso();

    return Scaffold(
      appBar: AppBar(
          title: Text(
            variable.AVISOS,
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
      body: Container(
          width: double.infinity,
          /*decoration: BoxDecoration(
              color: colores.azul_oscuro_aj,
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  colores.azul_oscuro_aj,
                  colores.azul_claro_aj,
                ],
              )),*/
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: _crearListaAviso(avisoController.lstAviso)),
    );
  }

  Widget _crearListaAviso(List<AvisoModel> lstAviso) {
    return Obx(() => (lstAviso.length > 0)
        ? Container(
            child: ListView.builder(
                itemCount: lstAviso.length,
                itemBuilder: (BuildContext context, int index) {
                  return _crearItemAviso(pAvisoModel: lstAviso[index]);
                }),
          )
        : (avisoController.descargandoAviso.value == true)
            ? Center(child: CircularProgressWidget())
            : Center(
                child: Text("No existe datos para mostrar"),
              ));
  }

  Widget _crearItemAviso({required AvisoModel pAvisoModel}) {
    return Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              _imagenAviso(pAvisoModel),
              _tituloAviso(pAvisoModel),
              _contenidoAviso(pAvisoModel),
              SizedBox(
                height: 10,
              ),
              _fechaAviso(pAvisoModel)
            ],
          ),
        ));
  }

  Widget _tituloAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.titulo.trim() != "")
      return Text(
        pAvisoModel.titulo.trim().toString(),
        style: estiloTexto.stlTextoTituloAviso,
        textAlign: TextAlign.center,
      );
    else
      return Row();
  }

  Widget _imagenAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.nombreArchivo.trim() != "") {
      print("url de rutaa: " + pAvisoModel.nombreArchivo.toString());
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          child: Container(
            child: FadeInImage(
              placeholder: AssetImage('assets/giphy.gif'),
              image: NetworkImage(api.API_AJAYU +
                  '/aviso/descargar_aviso/' +
                  pAvisoModel.avisoMovilId.toString() +
                  "/" +
                  pAvisoModel.nombreArchivo),
            ),
          ),
        ),
      );
    } else if (pAvisoModel.enlace.trim() != "") {
      print("url de anlace: " + pAvisoModel.enlace);
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.98,
            child: FadeInImage(
              placeholder: AssetImage('assets/giphy.gif'),
              image: NetworkImage(pAvisoModel.enlace.trim()),
            ),
          ),
        ),
      );
    } else {
      return Row();
    }
  }

  Row _contenidoAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.contenido.trim() != "")
      return Row(children: <Widget>[
        Container(
          //width: MediaQuery.of(context).size.width * 0.98,
          child: Text(
            pAvisoModel.contenido.toString(),
            style: estiloTexto.stlTextoContenidoAviso,
            textAlign: TextAlign.left,
          ),
        ),
      ]);
    else {
      return Row();
    }
  }

  Widget _fechaAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.fechaAviso.trim() != "")
      return Container(
        //width: MediaQuery.of(context).size.width * 0.95,
        child: Row(children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          Text(
            "fecha publicación: ",
            style: estiloTexto.stlTextoContenidoAviso,
          ),
          Container(
            child: Text(
              pAvisoModel.fechaAviso.toString(),
              style: estiloTexto.stlTextoFechaAviso,
              textAlign: TextAlign.right,
            ),
          ),
        ]),
      );
    else {
      return Row();
    }
  }
}
