import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/promocion-empresarial/controllers/PromocionEmpresarialController.dart';
import 'package:movilaj/src/utils/funciones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movilaj/src/views/menu_principal_view.dart';
//import 'package:progress_dialog/progress_dialog.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/variables.dart' as variable;

class BuscaPeView extends StatefulWidget {
  @override
  _BuscaPeState createState() => _BuscaPeState();
}

class _BuscaPeState extends State<BuscaPeView> {
  final formKey = GlobalKey<FormState>();

  final promocionEmpresarialController =
      Get.find<PromocionEmpresarialController>();

  final TextEditingController _controllerBuscar = TextEditingController();
  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _clickAtras,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              variable.BUSCA_PE,
              style: estiloTexto.stlTituloBarBlanco,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colores.azul_claro_aj, colores.azul_oscuro_aj],
                ),
              ),
            )),
        //drawer: MenuPrincipal(),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _crearNota(),
              SizedBox(
                height: 10,
              ),
              _crearTextoBuscador(),
              _crearBotonBuscar()
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearTextoBuscador() {
    return TextField(
      controller: _controllerBuscar,
      maxLength: 200,
      autofocus: false,
      decoration: InputDecoration(
          counter: Offstage(),
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Ingrese promoción a buscar',
          labelText: 'Texto a buscar',
          icon: Icon(Icons.search)),
    );
  }

  Widget _crearBotonBuscar() {
    return RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: colores.blue_grey_darken_1,
        textColor: Colors.white,
        label: Text('Buscar'),
        icon: Icon(Icons.search),
        onPressed: () async {
          if (_controllerBuscar.text.trim() != "") {
            promocionEmpresarialController.setMensajeBusqueda(
                "Busqueda realizada por : ${_controllerBuscar.text.trim()} ");

            var result = await objFuncion.showProgress(
                context,
                promocionEmpresarialController
                    .cargarPromocionesEmpresarialesByTextoBusqueda(
                        _controllerBuscar.text));
            if (result) {
              Get.toNamed("promociones_empresariales");
            } else {
              objFuncion.mostrarDialog(
                  "Mensaje", "No se ha encontrado la Promoción");
            }
          } else {
            objFuncion.mostrarDialog(
                "Mensaje", "Debe escribir la Promoción Empresarial");
          }
        });
  }

  Widget _crearNota() {
    return Center(
      child: Text(
        'Búsqueda por nombre de Empresa, Nombre de la Promoción Empresarial, Nombre Comercial, Premio Ofretado o Sigla Empresa.',
        textAlign: TextAlign.center,
        style: estiloTexto.stlTexto,
      ),
    );
  }
     Future<bool> _clickAtras() {
    Get.toNamed("promociones_empresariales");
    return new Future.value(true);
  }
}
