import 'dart:convert';

import 'package:movilaj/src/promocion-empresarial/models/juegoAzar_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/juegoLoteria_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/lugarPremiacon_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/lugarSorteo_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/mecanicapremiacion_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/premiosofertados_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/promocionempresarial_model.dart';
import 'package:movilaj/src/utils/apis.dart' as api;
import 'package:http/http.dart' as http;

class PromocionEmpresarialService {
  Base64Codec base64 = Base64Codec();
  Future<List<PromocionEmpresarialModel>>
      obtenerPromocionEmpresarialTodos() async {
    final url = "${api.API_NET}/GetPromocionesEmpresarialesTodos";
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body) as List;
    List<PromocionEmpresarialModel> lstPromocionEmpresarial = decodeData
        .map((obj) => PromocionEmpresarialModel.fromJson(obj))
        .toList();
    print("servicio: $url");
    return lstPromocionEmpresarial;
  }

  Future<List<PromocionEmpresarialModel>> obtenerPromocionEmpresarial(
      {required String pTextoBuscar}) async {
    print("INICIA SERVICIO: " + pTextoBuscar);
    String pTetxoBase64 = base64.encode(utf8.encode(pTextoBuscar));
    print("decodificado: " + pTetxoBase64);
    final url =
        "${api.API_NET}/GetPromocionesEmpresarialesxTextov3/$pTetxoBase64";
    print("url: " + url);
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body) as List;
    List<PromocionEmpresarialModel> lstPromocionEmpresarial = decodeData
        .map((obj) => PromocionEmpresarialModel.fromJson(obj))
        .toList();
    print("TERMINA SERVICIO: " + pTextoBuscar);
    return lstPromocionEmpresarial;
  }

  Future<MecanicaPremiacionModel> obtenerMecanicaPremiacion(
      {required int pPromocionId}) async {
    final url = "${api.API_NET}/ObtenerMecanicaPremiacion/$pPromocionId";
    print("PI MECANICA DE PARTICIAPACIÓN: " + url);
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body) as List;
    List<MecanicaPremiacionModel> lstMecanicaPremiacion =
        decodeData.map((obj) => MecanicaPremiacionModel.fromJson(obj)).toList();
    if (lstMecanicaPremiacion.length > 0)
      return lstMecanicaPremiacion[0];
    else
      return new MecanicaPremiacionModel();
  }

  Future<List<PremiosOfertadosModel>> obtenerPremiosOfertados(
      {required int pPromocionId}) async {
    final url =
        "${api.API_NET}/GetSorteoLugarPremiosxPromocionID/$pPromocionId";
    print("API PARA OBTENER PREMIOS OFERTADOS : " + url);
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body)["lstPremiosOfertados"] as List;
    List<PremiosOfertadosModel> lstPremiosOfertados =
        decodeData.map((obj) => PremiosOfertadosModel.fromJson(obj)).toList();
    return lstPremiosOfertados;
  }

  Future<List<LugarPremiacionModel>> obtenerLugarPremiacion(
      {required int pPromocionId}) async {
    final url =
        "${api.API_NET}/GetSorteoLugarPremiosxPromocionID/$pPromocionId";
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body)["lstLugarPremiacion"] as List;
    List<LugarPremiacionModel> lstLugarPremiacion =
        decodeData.map((obj) => LugarPremiacionModel.fromJson(obj)).toList();

    return lstLugarPremiacion;
  }

  Future<List<LugarSorteoModel>> obtenerLugarSorteo(
      {required int pPromocionId}) async {
    final url =
        "${api.API_NET}/GetSorteoLugarPremiosxPromocionID/$pPromocionId";
    print("API OBTENER LUGAR DE SORTEO: " + url);
    final resp = await http
        .get(Uri.parse(url))
        .timeout(Duration(seconds: api.TIMEOUT_SECOND));
    final decodeData = json.decode(resp.body)["lstLugarSorteo"] as List;
    print(decodeData);
    List<LugarSorteoModel> lstLugarSorteo =
        decodeData.map((obj) => LugarSorteoModel.fromJson(obj)).toList();
    return lstLugarSorteo;
  }

  Future<List<JuegosAzarModel>> obtenerJuegosAzar() async {
    try {
      final url = "${api.API_NET}/ObtenerAzar";
      final resp = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: api.TIMEOUT_SECOND));
      final decodeData = json.decode(resp.body) as List;
      List<JuegosAzarModel> lstJuegosAzar =
          decodeData.map((obj) => JuegosAzarModel.fromJson(obj)).toList();
      return lstJuegosAzar;
    } catch (e) {
      return new List<JuegosAzarModel>.empty();
    }
  }

  Future<List<JuegosLoteriaModel>> obtenerJuegosLoteria() async {
    try {
      final url = "${api.API_NET}/ObtenerLoteria";
      print("consumiendo servicio: " + url);
      final resp = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: api.TIMEOUT_SECOND));
      final decodeData = json.decode(resp.body) as List;
      List<JuegosLoteriaModel> lstJuegosLoteria =
          decodeData.map((obj) => JuegosLoteriaModel.fromJson(obj)).toList();
      return lstJuegosLoteria;
    } catch (e) {
      print("SE FUE POR CATH " + e.toString());
      return new List<JuegosLoteriaModel>.empty();
    }
  }
}
