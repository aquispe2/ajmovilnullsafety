// To parse this JSON data, do
//
//     final lugarSorteoModel = lugarSorteoModelFromJson(jsonString);

import 'dart:convert';

LugarSorteoModel lugarSorteoModelFromJson(String str) =>
    LugarSorteoModel.fromJson(json.decode(str));

String lugarSorteoModelToJson(LugarSorteoModel data) =>
    json.encode(data.toJson());

class LugarSorteoModel {
  LugarSorteoModel({
    this.lugarSorteoId = 0,
    this.tramiteId = 0,
    this.promocionEmpresarialId = 0,
    this.personaId = 0,
    this.departamentoId = 0,
    this.direccion = "",
    this.fechaSorteo,
    this.fechaSorteoFin,
    this.fechaRegistro,
    this.estadoId = 0,
    this.observacion = "",
    this.esAmpliado = false,
    this.departamento = "",
    this.fechaS = "",
    this.fechaSFin = "",
    this.tipoInicioSorteoId,
    this.tipoInicioSorteoDescripcion,
  });

  int lugarSorteoId;
  int tramiteId;
  int promocionEmpresarialId;
  int personaId;
  int departamentoId;
  String direccion;
  DateTime? fechaSorteo;
  DateTime? fechaSorteoFin;
  dynamic fechaRegistro;
  int estadoId;
  String observacion;
  bool esAmpliado;
  String departamento;
  String fechaS;
  String fechaSFin;
  dynamic tipoInicioSorteoId;
  dynamic tipoInicioSorteoDescripcion;

  factory LugarSorteoModel.fromJson(Map<String, dynamic> json) =>
      LugarSorteoModel(
        lugarSorteoId: json["lugarSorteoId"],
        tramiteId: json["tramiteId"],
        promocionEmpresarialId: json["promocionEmpresarialId"],
        personaId: json["personaId"],
        departamentoId: json["departamentoId"],
        direccion: json["direccion"],
        fechaSorteo: DateTime.parse(json["fechaSorteo"]),
        fechaSorteoFin: DateTime.parse(json["fechaSorteoFin"]),
        fechaRegistro: json["fechaRegistro"],
        estadoId: json["estadoId"],
        observacion: json["observacion"],
        esAmpliado: json["esAmpliado"],
        departamento: json["departamento"],
        fechaS: json["fechaS"],
        fechaSFin: json["fechaSFin"],
        tipoInicioSorteoId: json["tipoInicioSorteoID"],
        tipoInicioSorteoDescripcion: json["tipoInicioSorteoDescripcion"],
      );

  Map<String, dynamic> toJson() => {
        "lugarSorteoId": lugarSorteoId,
        "tramiteId": tramiteId,
        "promocionEmpresarialId": promocionEmpresarialId,
        "personaId": personaId,
        "departamentoId": departamentoId,
        "direccion": direccion,
        "fechaSorteo": fechaSorteo!.toIso8601String(),
        "fechaSorteoFin": fechaSorteoFin!.toIso8601String(),
        "fechaRegistro": fechaRegistro,
        "estadoId": estadoId,
        "observacion": observacion,
        "esAmpliado": esAmpliado,
        "departamento": departamento,
        "fechaS": fechaS,
        "fechaSFin": fechaSFin,
        "tipoInicioSorteoID": tipoInicioSorteoId,
        "tipoInicioSorteoDescripcion": tipoInicioSorteoDescripcion,
      };
}
