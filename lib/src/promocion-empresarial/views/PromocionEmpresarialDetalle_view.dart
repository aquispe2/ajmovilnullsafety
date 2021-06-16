import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/promocion-empresarial/controllers/PromocionEmpresarialController.dart';
import 'package:movilaj/src/promocion-empresarial/models/lugarPremiacon_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/lugarSorteo_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/premiosofertados_model.dart';

import 'package:movilaj/src/utils/apis.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/widgets/circularProgessCenter_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:url_launcher/url_launcher.dart';

class PromocionEmpresarialDetalleView extends StatefulWidget {
  @override
  _BuscaPeDetalleState createState() => _BuscaPeDetalleState();
}

class _BuscaPeDetalleState extends State<PromocionEmpresarialDetalleView> {
  final promocionEmpresarialController =
      Get.find<PromocionEmpresarialController>();

  @override
  Widget build(BuildContext context) {
    promocionEmpresarialController.cargarMecanicaPremiacionByPromocionId(
        promocionEmpresarialController.objPromocion.promocionEmpresarialId);
    promocionEmpresarialController.cargarPremiosOfertadosByPromocionId(
        promocionEmpresarialController.objPromocion.promocionEmpresarialId);
    promocionEmpresarialController.cargarLugaresPremiacionByPromocionId(
        promocionEmpresarialController.objPromocion.promocionEmpresarialId);
    promocionEmpresarialController.cargarLugaresSorteoByPromocionId(
        promocionEmpresarialController.objPromocion.promocionEmpresarialId);

    return WillPopScope(
      onWillPop: _clickAtras,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              variable.PROMOCIONES_EMPRESARIALES_DETALLE,
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
              _crearDatosEmpresa(),
              _crearComoParticipar(),
              _crearPremiosOfertados(),
              _crearLugaresPremiacion(),
              _crearLugarSorteo(),
              _crearMasInformacion(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearMasInformacion() {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Text.rich(TextSpan(
              text: 'Para más información presione el enlace: ',
              style: estiloTexto.stlTextoPequeno,
              children: <InlineSpan>[
                TextSpan(
                  text: 'más información',
                  style: estiloTexto.stlSubTitulo,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          "${SITIO_SIAJ}/WebPortal/PromEmpresarial/BUSPromocion.aspx?idpe=${promocionEmpresarialController.objPromocion.promocionEmpresarialId}");
                    },
                )
              ]))
        ]));
  }

  Widget _crearDatosEmpresa() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              "DATOS DE LA PROMOCIÓN",
              style: estiloTexto.stlSubTitulo,
            ),
            Divider(
              color: Colors.indigo,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Empresa:',
                    style: estiloTexto.stlSubTitulo,
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: Text(
                    promocionEmpresarialController.objPromocion.nombreEmpresa,
                    style: estiloTexto.stlTexto,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Promoción:',
                    style: estiloTexto.stlSubTitulo,
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: Text(
                    promocionEmpresarialController.objPromocion.nombrePromocion,
                    style: estiloTexto.stlTexto,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Duración:',
                    style: estiloTexto.stlSubTitulo,
                    textAlign: TextAlign.right,
                  ),
                ),
                Text(
                  '${DateFormat('dd/MM/yyyy').format(promocionEmpresarialController.objPromocion.fechaDesde)} al ${(promocionEmpresarialController.objPromocion.fechaHasta != null) ? DateFormat('dd/MM/yyyy').format(promocionEmpresarialController.objPromocion.fechaHasta) : ' - '}',
                  style: estiloTexto.stlTexto,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Estado:',
                    style: estiloTexto.stlSubTitulo,
                    textAlign: TextAlign.right,
                  ),
                ),
                Text(
                  promocionEmpresarialController.objPromocion.estado,
                  style: estiloTexto.stlTexto,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Autorización:',
                    style: estiloTexto.stlSubTitulo,
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: Text(
                    promocionEmpresarialController
                        .objPromocion.cadenaCiteResolucion,
                    style: estiloTexto.stlTexto,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _crearComoParticipar() {
    print(promocionEmpresarialController.objMecanicaPremiacion
        .toJson()
        .toString());
    return Obx(() => (promocionEmpresarialController
                .objMecanicaPremiacion.value.mecanica !=
            "")
        ? Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "COMO PARTICIPAR",
                        style: estiloTexto.stlSubTitulo,
                      ),
                      Divider(
                        color: Colors.indigo,
                      ),
                      Text(
                        promocionEmpresarialController
                            .objMecanicaPremiacion.value.mecanica,
                        style: estiloTexto.stlTextoMediano,
                        textAlign: TextAlign.justify,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        : ((promocionEmpresarialController.descargandoMecanica.value == true)
            ? CircularProgressCenterWidget()
            : _noExisetDato("COMO PARTICIPAR", variable.NOEXISTE_DATOS)));
  }

  Widget _crearLugaresPremiacion() {
    return Obx(() => (promocionEmpresarialController.lstLugarPremiacion.length >
            0)
        ? Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    "LUGARES PREMIACIÓN",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Divider(
                    color: Colors.indigo,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: promocionEmpresarialController
                          .lstLugarPremiacion.length,
                      itemBuilder: (context, i) => _creatItemLugarPremiacion(
                          promocionEmpresarialController.lstLugarPremiacion[i]))
                ],
              ),
            ),
          )
        : ((promocionEmpresarialController.descargandoLugarPremiacion.value ==
                true)
            ? CircularProgressCenterWidget()
            : _noExisetDato("LUGARES PREMIACIÓN", variable.NOEXISTE_DATOS)));
  }

  Widget _crearLugarSorteo() {
    return Obx(() => (promocionEmpresarialController.lstLugarSorteo.length > 0)
        ? Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "LUGARES DE SORTEO",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Divider(
                    color: Colors.indigo,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount:
                          promocionEmpresarialController.lstLugarSorteo.length,
                      itemBuilder: (context, i) => _creatItemLugarSorteo(
                          promocionEmpresarialController.lstLugarSorteo[i]))
                ],
              ),
            ),
          )
        : ((promocionEmpresarialController.descargandoLugarSorteo.value == true)
            ? CircularProgressCenterWidget()
            : _noExisetDato("LUGARES DE SORTEO", variable.NOEXISTE_DATOS)));
  }

  Widget _creatItemLugarSorteo(LugarSorteoModel pLugarSorteo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Dirección:',
                style: estiloTexto.stlSubTitulo,
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                pLugarSorteo.direccion,
                style: estiloTexto.stlTextoMediano,
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
                pLugarSorteo.departamento,
                style: estiloTexto.stlTextoMediano,
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
                'Fecha de sorteo:',
                style: estiloTexto.stlSubTitulo,
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                "${DateFormat('dd/MM/yyyy').format(pLugarSorteo.fechaSorteo!)}",
                style: estiloTexto.stlTextoMediano,
              ),
            )
          ],
        ),
        Divider()
      ],
    );
  }

  Widget _crearPremiosOfertados() {
    return Obx(() => (promocionEmpresarialController
                .lstPremiosOfertados.length >
            0)
        ? Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "PREMIOS OFERTADOS",
                    style: estiloTexto.stlSubTitulo,
                  ),
                  Divider(
                    color: Colors.indigo,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: promocionEmpresarialController
                          .lstPremiosOfertados.length,
                      itemBuilder: (context, i) => _creatItemPremiosOfertados(
                          promocionEmpresarialController
                              .lstPremiosOfertados[i]))
                ],
              ),
            ),
          )
        : ((promocionEmpresarialController.descargandoPremioOfertado.value ==
                true)
            ? CircularProgressCenterWidget()
            : _noExisetDato("PREMIOS OFERTADOS", variable.NOEXISTE_DATOS)));
  }

  Widget _creatItemPremiosOfertados(PremiosOfertadosModel pPremioOfertado) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.done,
              size: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                pPremioOfertado.descripcionPremio,
                style: estiloTexto.stlTextoMediano,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _creatItemLugarPremiacion(LugarPremiacionModel pLugarPremiacion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.30,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Dirección:',
                  style: estiloTexto.stlSubTitulo,
                  textAlign: TextAlign.right,
                )),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                pLugarPremiacion.direccion,
                style: estiloTexto.stlTextoMediano,
              ),
            )
          ],
        ),
        SizedBox(
          height: 7,
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
                )),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                pLugarPremiacion.departamento,
                style: estiloTexto.stlTextoMediano,
              ),
            )
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.30,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Observación:',
                  style: estiloTexto.stlSubTitulo,
                  textAlign: TextAlign.right,
                )),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                pLugarPremiacion.observacion,
                style: estiloTexto.stlTextoMediano,
              ),
            )
          ],
        ),
        Divider()
      ],
    );
  }

  Card _noExisetDato(String titulo, String contenido) {
    return Card(
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              titulo,
              style: estiloTexto.stlSubTitulo,
            ),
            Divider(
              color: Colors.blue[800],
            ),
            Text(
              contenido,
              style: estiloTexto.stlTexto,
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _clickAtras() {
    Get.toNamed("promociones_empresariales");
    return new Future.value(true);
  }
}
