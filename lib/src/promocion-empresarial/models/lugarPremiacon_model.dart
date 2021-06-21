// To parse this JSON data, do
//
//     final lugarPremiacionModel = lugarPremiacionModelFromJson(jsonString);

import 'dart:convert';

LugarPremiacionModel lugarPremiacionModelFromJson(String str) =>
    LugarPremiacionModel.fromJson(json.decode(str));

String lugarPremiacionModelToJson(LugarPremiacionModel data) =>
    json.encode(data.toJson());

class LugarPremiacionModel {
  LugarPremiacionModel({
    this.lugarPremiacionId = 0,
    this.tramiteId = 0,
    this.promocionEmpresarialId = 0,
    this.personaId = 0,
    this.departamentoId = 0,
    this.direccion = "",
    this.fechaEntrega,
    this.fechaEntregaInicio,
    this.fechaRegistro,
    this.estadoId = 0,
    this.observacion = "",
    this.departamento = "",
    this.tipoInicioPremiacionId,
    this.tipoInicioPremiacionDescripcion,
    this.esAmpliado = false,
    this.fechaE = "",
    this.fechaEFin = "",
  });

  int lugarPremiacionId;
  int tramiteId;
  int promocionEmpresarialId;
  int personaId;
  int departamentoId;
  String direccion;
  DateTime? fechaEntrega;
  dynamic fechaEntregaInicio;
  dynamic fechaRegistro;
  int estadoId;
  String observacion;
  String departamento;
  dynamic tipoInicioPremiacionId;
  dynamic tipoInicioPremiacionDescripcion;
  bool esAmpliado;
  String fechaE;
  String fechaEFin;

  factory LugarPremiacionModel.fromJson(Map<String, dynamic> json) =>
      LugarPremiacionModel(
        lugarPremiacionId: json["lugarPremiacionId"] ?? 0,
        tramiteId: json["tramiteId"] ?? 0,
        promocionEmpresarialId: json["promocionEmpresarialId"] ?? 0,
        personaId: json["personaId"] ?? 0,
        departamentoId: json["departamentoId"] ?? 0,
        direccion: json["direccion"] ?? "",
        fechaEntrega: DateTime.parse(json["fechaEntrega"]),
        fechaEntregaInicio: json["fechaEntregaInicio"],
        fechaRegistro: json["fechaRegistro"],
        estadoId: json["estadoId"] ?? 0,
        observacion: json["observacion"] ?? "",
        departamento: json["departamento"] ?? "",
        tipoInicioPremiacionId: json["tipoInicioPremiacionID"] ?? 0,
        tipoInicioPremiacionDescripcion:
            json["tipoInicioPremiacionDescripcion"] ?? "",
        esAmpliado: json["esAmpliado"] ?? false,
        fechaE: json["fechaE"] ?? "",
        fechaEFin: json["fechaEFin"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "lugarPremiacionId": lugarPremiacionId,
        "tramiteId": tramiteId,
        "promocionEmpresarialId": promocionEmpresarialId,
        "personaId": personaId,
        "departamentoId": departamentoId,
        "direccion": direccion,
        "fechaEntrega": fechaEntrega!.toIso8601String(),
        "fechaEntregaInicio": fechaEntregaInicio,
        "fechaRegistro": fechaRegistro,
        "estadoId": estadoId,
        "observacion": observacion,
        "departamento": departamento,
        "tipoInicioPremiacionID": tipoInicioPremiacionId,
        "tipoInicioPremiacionDescripcion": tipoInicioPremiacionDescripcion,
        "esAmpliado": esAmpliado,
        "fechaE": fechaE,
        "fechaEFin": fechaEFin,
      };
}
