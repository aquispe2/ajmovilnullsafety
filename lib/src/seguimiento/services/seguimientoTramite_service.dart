import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movilaj/src/seguimiento/models/derivacionFisico_model.dart';
import 'package:movilaj/src/seguimiento/models/derivacion_model.dart';
import 'package:movilaj/src/seguimiento/models/oficina_model.dart';
import 'package:movilaj/src/seguimiento/models/seguimientoTramiteFisico_model.dart';
import 'package:movilaj/src/seguimiento/models/seguimientoTramitePlataforma_model.dart';
import 'package:movilaj/src/utils/apis.dart' as api;

class SeguimientoTramiteService {
  Future<List<SeguimientoTramiteFisicoModel>> obtenerSeguimientoTramiteFisico(
      int pGestion, int pOficinaId, int pNroHr) async {
    final url = "${api.API_JAVA}/receptions/$pGestion/$pOficinaId/$pNroHr";
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    if (resp.body == "Lista de recepciones vacia") {
      return new List<SeguimientoTramiteFisicoModel>.empty();
    }
    final decodeData = json.decode(resp.body) as List;
    List<SeguimientoTramiteFisicoModel> lstSeguimientoTramiteFisico = decodeData
        .map((obj) => SeguimientoTramiteFisicoModel.fromJson(obj))
        .toList();

    return lstSeguimientoTramiteFisico;
  }

  Future<List<SeguimientoTramitePlataformaModel>>
      obtenerSeguimientoTramitePlataforma(int pTramiteId) async {
    final url = "${api.API_JAVA}/receptions/$pTramiteId";
    print("API REST SEG PLATAFORMA X TRAMITE: " + url);
    try {
      final resp = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: api.TIMEOUT_SECOND));
      print("resultado: " + resp.body);

      if (resp.body == "Lista de recepciones vacia") {
        return new List<SeguimientoTramitePlataformaModel>.empty();
      }
      final decodeData = json.decode(resp.body) as List;
      List<SeguimientoTramitePlataformaModel> lstSeguimientoTramitePlataforma =
          decodeData
              .map((obj) => SeguimientoTramitePlataformaModel.fromJson(obj))
              .toList();

      return lstSeguimientoTramitePlataforma;
    } catch (e) {
      print("error " + e.toString());
      return List<SeguimientoTramitePlataformaModel>.empty();
    }
  }

  Future<List<OficinaModel>> obtenerOficinas() async {
    final url = "${api.API_JAVA}/offices";
    print("ejecutando: $url");
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body) as List;
    List<OficinaModel> lstOficinas =
        decodeData.map((obj) => OficinaModel.fromJson(obj)).toList();

    return lstOficinas;
  }

  Future<List<DerivacionModel>> obtenerDerivacionTramite(int pTramiteId) async {
    final url = "${api.API_JAVA}/extras/generic_derivations_v3/$pTramiteId";
    try {
      final resp = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: api.TIMEOUT_SECOND));
      final decodeData = json.decode(resp.body) as List;
      List<DerivacionModel> lstDerivaciones =
          decodeData.map((obj) => DerivacionModel.fromJson(obj)).toList();
      return lstDerivaciones;
    } catch (e) {
      return List<DerivacionModel>.empty();
    }
  }

  Future<List<DerivacionFisicoModel>> obtenerDerivacionTramiteFisico(
      int pTramiteId) async {
    final url = "${api.API_JAVA}/extras/stages/$pTramiteId";
    print("urlll: " + url);
    try {
      final resp = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: api.TIMEOUT_SECOND));
      final decodeData = json.decode(resp.body) as List;
      List<DerivacionFisicoModel> lstDerivaciones =
          decodeData.map((obj) => DerivacionFisicoModel.fromJson(obj)).toList();
      return lstDerivaciones;
    } catch (e) {
      return List<DerivacionFisicoModel>.empty();
    }
  }
}
