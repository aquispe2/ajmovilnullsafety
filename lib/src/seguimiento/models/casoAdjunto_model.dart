// To parse this JSON data, do
//
//     final casoAdjuntoModel = casoAdjuntoModelFromJson(jsonString);

import 'dart:convert';

CasoAdjuntoModel casoAdjuntoModelFromJson(String str) =>
    CasoAdjuntoModel.fromJson(json.decode(str));

String casoAdjuntoModelToJson(CasoAdjuntoModel data) =>
    json.encode(data.toJson());

class CasoAdjuntoModel {
  CasoAdjuntoModel({
    this.casoAdjuntoId = 0,
    this.ruta = "",
    this.nombreArchivo = "",
    this.extensionArchivo = "",
    this.fechaRegistro = "",
    this.casoId = 0,
    this.estadoId = 0,
  });

  int casoAdjuntoId;
  String ruta;
  String nombreArchivo;
  String extensionArchivo;
  String fechaRegistro;
  int casoId;
  int estadoId;

  factory CasoAdjuntoModel.fromJson(Map<String, dynamic> json) =>
      CasoAdjuntoModel(
        casoAdjuntoId: json["casoAdjuntoId"],
        ruta: json["ruta"],
        nombreArchivo: json["nombreArchivo"],
        extensionArchivo: json["extensionArchivo"],
        fechaRegistro: json["fechaRegistro"],
        casoId: json["casoId"],
        estadoId: json["estadoId"],
      );

  Map<String, dynamic> toJson() => {
        "casoAdjuntoId": casoAdjuntoId,
        "ruta": ruta,
        "nombreArchivo": nombreArchivo,
        "extensionArchivo": extensionArchivo,
        "fechaRegistro": fechaRegistro,
        "casoId": casoId,
        "estadoId": estadoId,
      };
}
