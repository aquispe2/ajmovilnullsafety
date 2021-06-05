import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:movilaj/src/promocion-empresarial/controllers/PromocionEmpresarialController.dart';
import 'package:movilaj/src/promocion-empresarial/models/promocionempresarial_model.dart';

import 'package:movilaj/src/utils/variables.dart' as variable_textos;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/views/menu_principal_view.dart';
import 'package:movilaj/src/widgets/circularProgress_widget.dart';

class ListaPeView extends StatefulWidget {
  @override
  _ListaPeViewState createState() => _ListaPeViewState();
}

class _ListaPeViewState extends State<ListaPeView> {
  final promocionEmpresarialController =
      Get.find<PromocionEmpresarialController>();

  @override
  Widget build(BuildContext context) {
    if (promocionEmpresarialController.getMensajeBusqueda() == "") {
      promocionEmpresarialController.cargarPromocionesEmpresarialesTodos();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Column(children: <Widget>[
          (promocionEmpresarialController.getMensajeBusqueda() == "")
              ? Column(
                  children: <Widget>[
                    Text(
                      variable_textos.PROMOCIONES_EMPRESARIALES,
                      style: estiloTexto.estiloTextoAppbar,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Todas las Promociones Empresariales",
                      style: TextStyle(
                          fontSize: 10, color: colores.blue_grey_lighten_4),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Text(
                      variable_textos.PROMOCIONES_EMPRESARIALES,
                      style: estiloTexto.estiloTextoAppbar,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      promocionEmpresarialController.getMensajeBusqueda(),
                      style: TextStyle(
                          fontSize: 10, color: colores.blue_grey_lighten_4),
                    ),
                  ],
                )
        ]),
        actions: <Widget>[
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, 'busca_promociones');
              Get.toNamed('busca_promociones');
            },
            child: CircleAvatar(
              child: Icon(Icons.search),
              backgroundColor: Color(0xff1E88E5),
            ),
          ),
        ],
      ),
      drawer: MenuPrincipal(),
      body: _crearListaPromociones(),
      floatingActionButton: _crearBotonFlotante(),
    );
  }

  Widget _crearListaPromociones() {
    return Obx(() => (promocionEmpresarialController.existePromocion.value)
        ? Container(
            color: colores.grey_lighten_2,
            child: ListView.builder(
                itemCount: promocionEmpresarialController.lstPromociones.length,
                itemBuilder: (BuildContext context, int index) {
                  return _crearItemPromociones(
                      pPromocion:
                          promocionEmpresarialController.lstPromociones[index]);
                }),
          )
        : (promocionEmpresarialController.extaProceso.value)
            ? Center(child: CircularProgressWidget())
            : Center(
                child: Text("No existe datos para mostrar"),
              ));
  }

  Widget _crearItemPromociones(
      {required PromocionEmpresarialModel pPromocion}) {
    return Card(
        elevation: 0.5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              _textoPromocion(pPromocion),
              _textoEmpresa(pPromocion),
              //_textoDuracion(pPromocion),
              // _textoRaa(pPromocion),
              _verMas(pPromocion)
            ],
          ),
        ));
  }

  Row _verMas(PromocionEmpresarialModel pPromocion) {
    return Row(
      children: <Widget>[
        /*SizedBox(
          width: 11,
        ),*/
        Column(children: [
          Text(
            "Duración",
            style: estiloTexto.estiloTextoNormal,
          ),
          Text(
            '${DateFormat('dd/MM/yyyy').format(pPromocion.fechaDesde)} al ${(pPromocion.fechaHasta != null) ? DateFormat('dd/MM/yyyy').format(pPromocion.fechaHasta) : ' - '}',
            style: estiloTexto.estiloTextoPeriodoPe,
          ),
        ]),
        Expanded(
          child: SizedBox(),
        ),
        FlatButton(
            child: Text(
              "IR A LA PROMOCIÓN",
              style: GoogleFonts.padauk(
                  textStyle: TextStyle(
                      color: Colors.green[600],
                      letterSpacing: 0.5,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
            onPressed: () {
              promocionEmpresarialController.setObjPromocion(pPromocion);
              promocionEmpresarialController.limpiarDetallePremios();
              Get.toNamed('promociones_empresariales_detalle');
              //Navigator.pushNamed(context, 'busca_pe_detalle');
            })
      ],
    );
  }

  /*Row _textoDuracion(PromocionEmpresarialModel pPromocion) {
    return Row(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.30,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          'Duración:',
          style: estiloTexto.estiloSubTitulo,
          textAlign: TextAlign.right,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Text(
          '${DateFormat('dd/MM/yyyy').format(DateTime.parse(pPromocion.fechaDesde.toString()))} al ${(pPromocion.fechaHasta != null) ? DateFormat('dd/MM/yyyy').format(DateTime.parse(pPromocion.fechaHasta.toString())) : '-'}',
          style: estiloTexto.estiloTextoNormal,
        ),
      )
    ]);
  }*/

  /*Row _textoRaa(PromocionEmpresarialModel pPromocion) {
    return Row(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.30,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          'Autorización:',
          style: estiloTexto.estiloSubTitulo,
          textAlign: TextAlign.right,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Text(
          '${pPromocion.cadenaCiteResolucion}',
          style: estiloTexto.estiloTextoNormal,
        ),
      )
    ]);
  }*/

  Row _textoPromocion(PromocionEmpresarialModel pPromocion) {
    return Row(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Text(
          pPromocion.nombrePromocion.toString(),
          style: GoogleFonts.imprima(
              textStyle: TextStyle(
                  color: Colors.blue[800],
                  letterSpacing: 0.5,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          textAlign: TextAlign.left,
        ),
      ),
    ]);
  }

  Row _textoEmpresa(PromocionEmpresarialModel pPromocion) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Text("${pPromocion.nombreEmpresa}",
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Colors.grey[700],
                      letterSpacing: 0.5,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              textAlign: TextAlign.left),
        )
      ],
    );
  }

  Widget _crearBotonFlotante() {
    if (promocionEmpresarialController.getMensajeBusqueda() != "") {
      return FloatingActionButton(
          onPressed: () {
            setState(() {
              promocionEmpresarialController.setMensajeBusqueda("");
              promocionEmpresarialController
                  .cargarPromocionesEmpresarialesTodos();
            });
          },
          child: Text(
            "ver\n todos",
            style: estiloTexto.estiloTextoNormalBlanco,
            textAlign: TextAlign.center,
          ),
          backgroundColor: colores.blue_grey_darken_1);
    } else {
      return Container();
    }
  }
}
