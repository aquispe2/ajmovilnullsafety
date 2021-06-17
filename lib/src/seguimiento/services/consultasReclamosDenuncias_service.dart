import 'dart:convert';
import 'package:movilaj/src/seguimiento/models/casoAdjunto_model.dart';
import 'package:movilaj/src/seguimiento/models/caso_model.dart';
import 'package:movilaj/src/utils/apis.dart' as api;
import 'package:http/http.dart' as http;

class ConsultasReclamosDenunciasService {
  Future<List<CasoModel>> obtenerCasoPorNroCaso(String pNroCaso) async {
    final url = "${api.API_AJAYU}/casos/busquedas?nrocaso=$pNroCaso";
    print("url_caso:  " + url);

    try {
      final resp = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: api.TIMEOUT_SECOND));
      final decodeData = json.decode(resp.body)["resultado"] as List;
      List<CasoModel> lstCasos =
          decodeData.map((obj) => CasoModel.fromJson(obj)).toList();

      return lstCasos;
    } catch (e) {
      print("ERROR" + e.toString());
      return List<CasoModel>.empty();
    }
  }

  Future<List<CasoAdjuntoModel>> obtenerCasoAdjuntoPorCasoId(
      int pCasoId) async {
    final url = "${api.API_AJAYU}/adjuntos/list/$pCasoId";
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body) as List;
    List<CasoAdjuntoModel> lstAdjuntos =
        decodeData.map((obj) => CasoAdjuntoModel.fromJson(obj)).toList();
    return lstAdjuntos;
  }
}
