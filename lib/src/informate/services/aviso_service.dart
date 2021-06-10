import 'dart:convert';

import 'package:movilaj/src/informate/models/aviso_model.dart';
import 'package:movilaj/src/informate/models/normativa_model.dart';
import 'package:movilaj/src/utils/apis.dart' as api;
import 'package:http/http.dart' as http;

class AvisoService {
  Future<List<AvisoModel>> obtenerAviso() async {
    try {
      final url = "${api.API_AJAYU}/aviso/ListarAvisosVigentesTodos";

      final resp = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: api.TIMEOUT_SECOND));
      final decodeData = json.decode(resp.body)["result"] as List;

      List<AvisoModel> lstAviso =
          decodeData.map((obj) => AvisoModel.fromJson(obj)).toList();

      return lstAviso;
    } catch (e) {
      return new List.empty();
    }
  }
}
