import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (promocionEmpresarialController.getMensajeBusqueda() == "") {
        promocionEmpresarialController.limpiarPromocion();
        promocionEmpresarialController.cargarPromocionesEmpresarialesTodos();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*if (promocionEmpresarialController.getMensajeBusqueda() == "") {
      promocionEmpresarialController.cargarPromocionesEmpresarialesTodos();
    }*/

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Column(children: <Widget>[
          (promocionEmpresarialController.getMensajeBusqueda() == "")
              ? Column(
                  children: <Widget>[
                    Text(
                      variable_textos.PROMOCIONES_EMPRESARIALES,
                      style: estiloTexto.stlTituloBarBlanco,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Todas las Promociones Empresariales ",
                      style: TextStyle(
                          fontSize: 10, color: colores.blue_grey_lighten_4),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Text(
                      variable_textos.PROMOCIONES_EMPRESARIALES,
                      style: estiloTexto.stlTextoBlancoHome,
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colores.azul_claro_aj, colores.azul_oscuro_aj],
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, 'busca_promociones');
              Get.toNamed('busca_promociones');
            },
            child: CircleAvatar(
              child: Icon(Icons.search),
              backgroundColor: colores.azul_oscuro_aj,
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
    return Obx(() => (promocionEmpresarialController.lstPromociones.length > 0)
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
        : (promocionEmpresarialController.estaProceso.value)
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
            style: estiloTexto.stlTextoPequeno,
          ),
          Text(
            '${DateFormat('dd/MM/yyyy').format(pPromocion.fechaDesde)} al ${(pPromocion.fechaHasta != null) ? DateFormat('dd/MM/yyyy').format(pPromocion.fechaHasta) : ' - '}',
            style: estiloTexto.stlTextoPequeno,
          ),
        ]),
        Expanded(
          child: SizedBox(),
        ),
        FlatButton(
            child: Text(
              "VER PROMOCIÓN",
              style: estiloTexto.stlTextoIrPromocion,
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

  Row _textoPromocion(PromocionEmpresarialModel pPromocion) {
    return Row(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Text(
          pPromocion.nombrePromocion.toString(),
          style: estiloTexto.stlTextoNombrePromocion,
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
              style: estiloTexto.stlTextoNombreEmpresa,
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
            style: estiloTexto.stlTextoBlancoHome,
            textAlign: TextAlign.center,
          ),
          backgroundColor: colores.blue_grey_darken_1);
    } else {
      return Container();
    }
  }
}
