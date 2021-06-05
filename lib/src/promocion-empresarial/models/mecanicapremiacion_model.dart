// To parse this JSON data, do
//
//     final mecanicaPremiacionModel = mecanicaPremiacionModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

MecanicaPremiacionModel mecanicaPremiacionModelFromJson(String str) =>
    MecanicaPremiacionModel.fromJson(json.decode(str));

String mecanicaPremiacionModelToJson(MecanicaPremiacionModel data) =>
    json.encode(data.toJson());

class MecanicaPremiacionModel {
  MecanicaPremiacionModel({
    this.mecanicaPremiacionId = 0,
    this.promocionEmpresarialId = 0,
    this.tramiteId = 0,
    this.tipoModalidadPremiacionId = 0,
    this.tipoClasificacionId = 0,
    this.tipoClasificacionDescripcion = "",
    this.tipoModalidadSorteoId = 0,
    this.tipoModalidadSorteoDescripcion = "",
    this.tipoPremiacionDirectaId = 0,
    this.tipoPremiacionDirectaDescripcion = "",
    this.mecanica = "",
    this.fechaRegistro,
    this.estadoId = 0,
    this.tipoModalidadAzarId = 0,
    this.tipoModalidadAzarDescripcion = "",
    this.tipoPremiacionDirectaAzar = "",
  });

  int mecanicaPremiacionId;
  int promocionEmpresarialId;
  int tramiteId;
  int tipoModalidadPremiacionId;
  int? tipoClasificacionId;
  String tipoClasificacionDescripcion;
  int tipoModalidadSorteoId;
  String tipoModalidadSorteoDescripcion;
  int tipoPremiacionDirectaId;
  String tipoPremiacionDirectaDescripcion;
  String mecanica;
  var fechaRegistro;
  int estadoId;
  int tipoModalidadAzarId;
  String tipoModalidadAzarDescripcion;
  String tipoPremiacionDirectaAzar;

  factory MecanicaPremiacionModel.fromJson(Map<String, dynamic> json) =>
      MecanicaPremiacionModel(
        mecanicaPremiacionId: json["mecanicaPremiacionId"],
        promocionEmpresarialId: json["promocionEmpresarialId"],
        tramiteId: json["tramiteId"],
        tipoModalidadPremiacionId: json["tipoModalidadPremiacionId"],
        tipoClasificacionId: json["tipoClasificacionId"],
        tipoClasificacionDescripcion: json["tipoClasificacionDescripcion"],
        tipoModalidadSorteoId: json["tipoModalidadSorteoId"],
        tipoModalidadSorteoDescripcion: json["tipoModalidadSorteoDescripcion"],
        tipoPremiacionDirectaId: json["tipoPremiacionDirectaId"],
        tipoPremiacionDirectaDescripcion:
            json["tipoPremiacionDirectaDescripcion"],
        mecanica: json["mecanica"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        estadoId: json["estadoId"],
        tipoModalidadAzarId: json["tipoModalidadAzarId"],
        tipoModalidadAzarDescripcion: json["tipoModalidadAzarDescripcion"],
        tipoPremiacionDirectaAzar: json["tipoPremiacionDirectaAzar"],
      );

  Map<String, dynamic> toJson() => {
        "mecanicaPremiacionId": mecanicaPremiacionId,
        "promocionEmpresarialId": promocionEmpresarialId,
        "tramiteId": tramiteId,
        "tipoModalidadPremiacionId": tipoModalidadPremiacionId,
        "tipoClasificacionId": tipoClasificacionId,
        "tipoClasificacionDescripcion": tipoClasificacionDescripcion,
        "tipoModalidadSorteoId": tipoModalidadSorteoId,
        "tipoModalidadSorteoDescripcion": tipoModalidadSorteoDescripcion,
        "tipoPremiacionDirectaId": tipoPremiacionDirectaId,
        "tipoPremiacionDirectaDescripcion": tipoPremiacionDirectaDescripcion,
        "mecanica": mecanica,
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "estadoId": estadoId,
        "tipoModalidadAzarId": tipoModalidadAzarId,
        "tipoModalidadAzarDescripcion": tipoModalidadAzarDescripcion,
        "tipoPremiacionDirectaAzar": tipoPremiacionDirectaAzar,
      };
}
