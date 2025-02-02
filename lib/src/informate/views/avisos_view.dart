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

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await obtenerAvisos();
    });
    super.initState();
  }

  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _clickAtras,
      child: Scaffold(
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
          child: _crearListaAviso(avisoController.lstAviso),
        ),
      ),
    );
  }

  Future<void> obtenerAvisos() async {
    avisoController.limpiarAviso();
    await avisoController.obtenerAviso();
  }

  Widget _crearListaAviso(List<AvisoModel> lstAviso) {
    return Obx(
      () => (lstAviso.length > 0)
          ? Container(
              child: RefreshIndicator(
                onRefresh: () async {
                  return Future.delayed(Duration.zero, () async {
                    await obtenerAvisos();
                  });
                },
                child: ListView.builder(
                    itemCount: lstAviso.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _crearItemAviso(pAvisoModel: lstAviso[index]);
                    }),
              ),
            )
          : (avisoController.descargandoAviso.value == true)
              ? Center(child: CircularProgressWidget())
              : RefreshIndicator(
                  onRefresh: () async {
                    return Future.delayed(Duration.zero, () async {
                      await obtenerAvisos();
                    });
                  },
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: <Widget>[
                      Container(
                        height: 50,
                        child:
                            const Center(child: Text(variable.NOEXISTE_DATOS)),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _crearItemAviso({required AvisoModel pAvisoModel}) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(width: 1, color: colores.azul_oscuro_aj)),
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              _imagenAviso(pAvisoModel),
              _tituloAviso(pAvisoModel),
              _contenidoAviso(pAvisoModel),
              _fechaAviso(pAvisoModel)
            ],
          ),
        ));
  }

  Widget _tituloAviso(AvisoModel pAvisoModel) {
    print("titlulo: " + pAvisoModel.titulo);
    if (pAvisoModel.titulo.trim() != "")
      return Column(
        children: [
          Text(
            pAvisoModel.titulo.trim().toString(),
            style: estiloTexto.stlTextoTituloAviso,
            textAlign: TextAlign.center,
          ),
        ],
      );
    else
      return Row();
  }

  Widget _imagenAviso(AvisoModel pAvisoModel) {
    print("holaaaaaaaaaaaaaaaaa");
    print("url: " + pAvisoModel.nombreArchivo);
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

  Column _contenidoAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.contenido.trim() != "")
      return Column(children: <Widget>[
        Divider(
          color: Colors.indigo,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Text(
            pAvisoModel.contenido.toString(),
            style: estiloTexto.stlTextoContenidoAviso,
            textAlign: TextAlign.left,
          ),
        ),
      ]);
    else {
      return Column();
    }
  }

  Widget _fechaAviso(AvisoModel pAvisoModel) {
    if (pAvisoModel.fechaAviso.trim() != "")
      return Container(
        //width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Divider(
              color: Colors.indigo,
            ),
            Row(children: <Widget>[
              if (pAvisoModel.mensajeCorto != "")
                Container(
                  color: Colors.red[100],
                  padding: EdgeInsets.all(5),
                  child: Text(pAvisoModel.mensajeCorto),
                ),
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
          ],
        ),
      );
    else {
      return Row();
    }
  }
     Future<bool> _clickAtras() {
    Get.toNamed("inicio");
    return new Future.value(true);
  }
}
