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
        lugarPremiacionId: json["lugarPremiacionId"],
        tramiteId: json["tramiteId"],
        promocionEmpresarialId: json["promocionEmpresarialId"],
        personaId: json["personaId"],
        departamentoId: json["departamentoId"],
        direccion: json["direccion"] ?? "",
        fechaEntrega: DateTime.parse(json["fechaEntrega"]),
        fechaEntregaInicio: json["fechaEntregaInicio"],
        fechaRegistro: json["fechaRegistro"],
        estadoId: json["estadoId"],
        observacion: json["observacion"] ?? "",
        departamento: json["departamento"] ?? "",
        tipoInicioPremiacionId: json["tipoInicioPremiacionID"],
        tipoInicioPremiacionDescripcion:
            json["tipoInicioPremiacionDescripcion"] ?? "",
        esAmpliado: json["esAmpliado"],
        fechaE: json["fechaE"],
        fechaEFin: json["fechaEFin"],
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
