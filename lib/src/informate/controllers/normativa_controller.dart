import 'package:get/get.dart';
import 'package:movilaj/src/informate/models/aviso_model.dart';
import 'package:movilaj/src/informate/models/normativa_model.dart';
import 'package:movilaj/src/informate/services/normativa_service.dart';

class NormativaController extends GetxController {
  final _normativaService = new NormativaService();

  // PARA NORMATIVAS
  var lstNormativa = new List<NormativaModel>.empty().obs;
  var descargandoNormativa = false.obs;
  // ==================================

  // PARA VERSION DE AKP
  var versionNueva = "".toString().obs;
  // =================================

  void cargarNormativas() async {
    descargandoNormativa.value = true;

    lstNormativa.value = await _normativaService.obtenerNormativa();

    descargandoNormativa.value = false;
  }

  void verificarVersion() async {
    print("verifica rversion");
    final version = await _normativaService.verificarVersion();
    versionNueva.value = version;
  }
}
