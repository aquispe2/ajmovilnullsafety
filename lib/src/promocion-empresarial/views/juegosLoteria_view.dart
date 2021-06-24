import 'package:get/get.dart';

import 'package:movilaj/src/promocion-empresarial/controllers/PromocionEmpresarialController.dart';
import 'package:movilaj/src/views/menu_principal_view.dart';

import 'package:movilaj/src/widgets/circularProgress_widget.dart';
import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:intl/intl.dart';

class JuegosLoteriaView extends StatefulWidget {
  @override
  _JuegosLoteriaViewState createState() => _JuegosLoteriaViewState();
}

class _JuegosLoteriaViewState extends State<JuegosLoteriaView> {
  final promocionEmpresarialController =
      Get.find<PromocionEmpresarialController>();

  NumberFormat f = new NumberFormat("#,##0.00", "es_BO");
  @override
  Widget build(BuildContext context) {
    promocionEmpresarialController.cargarJuegosLoteriaTodos();

    return WillPopScope(
      onWillPop: _clickAtras,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              variable.JUEGO_LOTERIA,
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
        body: _crearListaJuegosLoteria(),
      ),
    );
  }

  Widget _crearListaJuegosLoteria() {
    return Obx(() => (promocionEmpresarialController.lstJuegoDeLoteria.length >
            0)
        ? ListView.builder(
            itemCount: promocionEmpresarialController.lstJuegoDeLoteria.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("NOMBRE DEL SORTEO",
                            style: estiloTexto.stlSubTitulo),
                        Text(
                          promocionEmpresarialController
                              .lstJuegoDeLoteria[index].nombreSorteo,
                          style: estiloTexto.stlTexto,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("MONTO EN CANTIDAD PREMIO MAYOR",
                            style: estiloTexto.stlSubTitulo),
                        Text(
                          "Bs ${f.format((promocionEmpresarialController.lstJuegoDeLoteria[index].montoCantidadPremioMayor != 0) ? promocionEmpresarialController.lstJuegoDeLoteria[index].montoCantidadPremioMayor : 0)}",
                          style: estiloTexto.stlTexto,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("FECHA DEL SORTEO",
                            style: estiloTexto.stlSubTitulo),
                        Text(
                          DateFormat('dd/MM/yyyy').format(
                              promocionEmpresarialController
                                  .lstJuegoDeLoteria[index].fechaSorteo!),
                          style: estiloTexto.stlTexto,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("DEPARTAMENTO", style: estiloTexto.stlSubTitulo),
                        Text(
                          promocionEmpresarialController
                              .lstJuegoDeLoteria[index].departamento,
                          style: estiloTexto.stlTexto,
                        ),
                      ],
                    ),
                  ));
            })
        : ((promocionEmpresarialController.descargandoJuegosLoteria.value ==
                true)
            ? Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(child: CircularProgressWidget()))
            : Center(
                child: Text(variable.NOEXISTE_DATOS_LOTERIA),
              )));
  }

  Future<bool> _clickAtras() {
    Get.toNamed("inicio");
    return new Future.value(true);
  }
}
