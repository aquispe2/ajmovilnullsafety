import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/controllers/consultaReclamoDenunciaController.dart';
import 'package:movilaj/src/seguimiento/models/caso_model.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/funciones.dart';
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:movilaj/src/views/menu_principal_view.dart';
//import 'package:progress_dialog/progress_dialog.dart';

class BuscaCasosView extends StatefulWidget {
  @override
  _BuscaCasosViewState createState() => _BuscaCasosViewState();
}

class _BuscaCasosViewState extends State<BuscaCasosView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _controllerBuscar = TextEditingController();
  Funciones objFuncion = new Funciones();

  final consultasReclamosDenunciasController =
      Get.find<ConsultasReclamosDenunciasController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          variable.BUSQUEDA_CASOS,
          style: estiloTexto.stlTituloBarBlanco,
        ),
      ),
      drawer: MenuPrincipal(),
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
    );
  }

  Widget _crearNota() {
    return Center(
      child: Text(
        'Seguimiento de reclamos, consultas y/o denuncias',
        textAlign: TextAlign.center,
        style: estiloTexto.stlTexto,
      ),
    );
  }

  Widget _crearTextoBuscador() {
    return TextField(
      controller: _controllerBuscar,
      maxLength: 15,
      autofocus: false,
      decoration: InputDecoration(
          counter: Offstage(),
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Ingrese nro. de caso a buscar',
          labelText: 'Nro de Caso',
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
        onPressed: _enviarBusqueda);
  }

// el return estaria opr demas, pero el cmoponente de dialogprogress nos pide un retorno
  Future<void> _enviarBusqueda() async {
    consultasReclamosDenunciasController.lstCaso.value =
        new List<CasoModel>.empty();
    if (_controllerBuscar.text.trim() != "") {
      showDialog(
        context: context,
        builder: (context) => FutureProgressDialog(
            consultasReclamosDenunciasController
                .cargarCasosPorNroCaso(_controllerBuscar.text),
            message: Text(variable.PROGRESS_BUSCANDO_CASO)),
      );
      await Future.delayed(
          Duration(seconds: 1)); // por si acos una eséra de 1 segundo

      if (consultasReclamosDenunciasController.lstCaso.isEmpty) {
        objFuncion.mostrarDialog("Mensaje", "No se ha encontrado el Caso");
      } else {
        Get.toNamed('caso_detalle');
      }
    } else {
      objFuncion.mostrarDialog("Mensaje", "Debe escribir el número de caso");
    }
  }
}
