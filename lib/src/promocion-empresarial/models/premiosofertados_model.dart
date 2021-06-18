// To parse this JSON data, do
//
//     final premiosOfertadosModel = premiosOfertadosModelFromJson(jsonString);

import 'dart:convert';

PremiosOfertadosModel premiosOfertadosModelFromJson(String str) =>
    PremiosOfertadosModel.fromJson(json.decode(str));

String premiosOfertadosModelToJson(PremiosOfertadosModel data) =>
    json.encode(data.toJson());

class PremiosOfertadosModel {
  PremiosOfertadosModel({
    this.premioOfertadoid = 0,
    this.tramiteId = 0,
    this.promocionEmpresarialId = 0,
    this.descripcionPremio = "",
    this.observacionPremio = "",
    this.cantidad = 0,
    this.precioUnitario = 0,
    this.fechaRegistro,
    this.estadoId = 0,
    this.monedaId = 0,
    this.valorTipoCambio = 0,
    this.descripcionTipoCambio,
    this.idTipoPremio = 0,
    this.descripcionTipoPremio = "",
    this.tipoPremioNormaId,
    this.tipoPremioNormaDescripcion,
    this.modalidadPremiacionId,
    this.tipoModalidadPremiacionId,
    this.total = 0,
    this.precioUniMascara = "",
    this.precioTotalMascara = "",
    this.strCantidad = "",
    this.strValorTipoCambio = "",
    this.strPrecioUnitario = "",
    this.strTotal = "",
  });

  int premioOfertadoid;
  int tramiteId;
  int promocionEmpresarialId;
  String descripcionPremio;
  String observacionPremio;
  int cantidad;
  double precioUnitario;
  DateTime? fechaRegistro;
  int estadoId;
  int monedaId;
  double valorTipoCambio;
  dynamic descripcionTipoCambio;
  int idTipoPremio;
  String descripcionTipoPremio;
  dynamic tipoPremioNormaId;
  dynamic tipoPremioNormaDescripcion;
  dynamic modalidadPremiacionId;
  dynamic tipoModalidadPremiacionId;
  double total;
  String precioUniMascara;
  String precioTotalMascara;
  String strCantidad;
  String strValorTipoCambio;
  String strPrecioUnitario;
  String strTotal;

  factory PremiosOfertadosModel.fromJson(Map<String, dynamic> json) =>
      PremiosOfertadosModel(
        premioOfertadoid: json["premioOfertadoid"] ?? 0,
        tramiteId: json["tramiteId"] ?? 0,
        promocionEmpresarialId: json["promocionEmpresarialId"] ?? 0,
        descripcionPremio: json["descripcionPremio"] ?? '',
        observacionPremio: json["observacionPremio"] ?? '',
        cantidad: json["cantidad"] ?? 0,
        precioUnitario: json["precioUnitario"] ?? 0,
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        estadoId: json["estadoId"] ?? 0,
        monedaId: json["monedaId"] ?? 0,
        valorTipoCambio: json["valorTipoCambio"] ?? 0,
        descripcionTipoCambio: json["descripcionTipoCambio"] ?? '',
        idTipoPremio: json["idTipoPremio"] ?? 0,
        descripcionTipoPremio: json["descripcionTipoPremio"] ?? '',
        tipoPremioNormaId: json["tipoPremioNormaID"] ?? 0,
        tipoPremioNormaDescripcion: json["tipoPremioNormaDescripcion"] ?? '',
        modalidadPremiacionId: json["ModalidadPremiacionId"] ?? 0,
        tipoModalidadPremiacionId: json["TipoModalidadPremiacionId"] ?? 0,
        total: json["Total"] ?? 0,
        precioUniMascara: json["precioUniMascara"] ?? '',
        precioTotalMascara: json["precioTotalMascara"] ?? '',
        strCantidad: json["strCantidad"] ?? '',
        strValorTipoCambio: json["strValorTipoCambio"] ?? '',
        strPrecioUnitario: json["strPrecioUnitario"] ?? '',
        strTotal: json["strTotal"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "premioOfertadoid": premioOfertadoid,
        "tramiteId": tramiteId,
        "promocionEmpresarialId": promocionEmpresarialId,
        "descripcionPremio": descripcionPremio,
        "observacionPremio": observacionPremio,
        "cantidad": cantidad,
        "precioUnitario": precioUnitario,
        "fechaRegistro": fechaRegistro!.toIso8601String(),
        "estadoId": estadoId,
        "monedaId": monedaId,
        "valorTipoCambio": valorTipoCambio,
        "descripcionTipoCambio": descripcionTipoCambio,
        "idTipoPremio": idTipoPremio,
        "descripcionTipoPremio": descripcionTipoPremio,
        "tipoPremioNormaID": tipoPremioNormaId,
        "tipoPremioNormaDescripcion": tipoPremioNormaDescripcion,
        "ModalidadPremiacionId": modalidadPremiacionId,
        "TipoModalidadPremiacionId": tipoModalidadPremiacionId,
        "Total": total,
        "precioUniMascara": precioUniMascara,
        "precioTotalMascara": precioTotalMascara,
        "strCantidad": strCantidad,
        "strValorTipoCambio": strValorTipoCambio,
        "strPrecioUnitario": strPrecioUnitario,
        "strTotal": strTotal,
      };
}
