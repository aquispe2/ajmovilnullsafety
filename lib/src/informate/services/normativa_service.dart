import 'dart:convert';

import 'package:movilaj/src/informate/models/normativa_model.dart';
import 'package:movilaj/src/utils/apis.dart' as api;
import 'package:http/http.dart' as http;

class NormativaService {
  Future<List<NormativaModel>> obtenerNormativa() async {
    final url = "${api.API_NET}/GetNormativas";
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body) as List;
    List<NormativaModel> lstNormativa =
        decodeData.map((obj) => NormativaModel.fromJson(obj)).toList();
    return lstNormativa;
  }

  Future<String> verificarVersion() async {
    print("verificando versión");
    final url = "${api.API_NET}/VerificarVersion";
    final resp = await http
        .post(Uri.parse(url), body: {'versionAjMovil': '${api.VERSION_APP}'});
    final decodeData = json.decode(resp.body) as String;
    return decodeData;
  }
}
