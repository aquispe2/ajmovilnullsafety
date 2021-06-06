// To parse this JSON data, do
//
//     final seguimientoTramitePlataformaModel = seguimientoTramitePlataformaModelFromJson(jsonString);

import 'dart:convert';

SeguimientoTramitePlataformaModel seguimientoTramitePlataformaModelFromJson(
        String str) =>
    SeguimientoTramitePlataformaModel.fromJson(json.decode(str));

String seguimientoTramitePlataformaModelToJson(
        SeguimientoTramitePlataformaModel data) =>
    json.encode(data.toJson());

class SeguimientoTramitePlataformaModel {
  SeguimientoTramitePlataformaModel({
    this.recepcionId = 0,
    this.usuarioId = 0,
    this.oficinaId = 0,
    this.tipoJerarquiaId = 0,
    this.tipoRecepcionId = 0,
    this.tipoDocumentoProcesoId = 0,
    this.remitidoA = 0,
    this.entregadoPor = "",
    this.gestion = "",
    this.numeroHojaRuta = 0,
    this.origen = "",
    this.referencia = "",
    this.cite = "",
    this.fechaRegistro,
    this.fechaRecepcion,
    this.flujoId = 0,
    this.tipoTramiteDescripcion = "",
    this.tramiteId = 0,
    this.fechaInicio,
    this.fechaFin,
    this.estadoId = 0,
  });

  int recepcionId;
  int usuarioId;
  int oficinaId;
  int tipoJerarquiaId;
  int tipoRecepcionId;
  int tipoDocumentoProcesoId;
  int remitidoA;
  String entregadoPor;
  String gestion;
  int numeroHojaRuta;
  String origen;
  String referencia;
  String cite;
  DateTime? fechaRegistro;
  DateTime? fechaRecepcion;
  int flujoId;
  String tipoTramiteDescripcion;
  int tramiteId;
  DateTime? fechaInicio;
  dynamic fechaFin;
  int estadoId;

  factory SeguimientoTramitePlataformaModel.fromJson(
          Map<String, dynamic> json) =>
      SeguimientoTramitePlataformaModel(
        recepcionId: json["recepcionID"],
        usuarioId: json["usuarioID"],
        oficinaId: json["oficinaID"],
        tipoJerarquiaId: json["tipoJerarquiaID"],
        tipoRecepcionId: json["tipoRecepcionID"],
        tipoDocumentoProcesoId: json["tipoDocumentoProcesoID"],
        remitidoA: json["remitidoA"],
        entregadoPor: json["entregadoPor"],
        gestion: json["gestion"],
        numeroHojaRuta: json["numeroHojaRuta"],
        origen: json["origen"],
        referencia: json["referencia"],
        cite: json["cite"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        fechaRecepcion: DateTime.parse(json["fechaRecepcion"]),
        flujoId: json["flujoID"],
        tipoTramiteDescripcion: json["tipoTramiteDescripcion"],
        tramiteId: json["tramiteID"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: json["fechaFin"],
        estadoId: json["estadoID"],
      );

  Map<String, dynamic> toJson() => {
        "recepcionID": recepcionId,
        "usuarioID": usuarioId,
        "oficinaID": oficinaId,
        "tipoJerarquiaID": tipoJerarquiaId,
        "tipoRecepcionID": tipoRecepcionId,
        "tipoDocumentoProcesoID": tipoDocumentoProcesoId,
        "remitidoA": remitidoA,
        "entregadoPor": entregadoPor,
        "gestion": gestion,
        "numeroHojaRuta": numeroHojaRuta,
        "origen": origen,
        "referencia": referencia,
        "cite": cite,
        "fechaRegistro":
            "${fechaRegistro!.year.toString().padLeft(4, '0')}-${fechaRegistro!.month.toString().padLeft(2, '0')}-${fechaRegistro!.day.toString().padLeft(2, '0')}",
        "fechaRecepcion":
            "${fechaRecepcion!.year.toString().padLeft(4, '0')}-${fechaRecepcion!.month.toString().padLeft(2, '0')}-${fechaRecepcion!.day.toString().padLeft(2, '0')}",
        "flujoID": flujoId,
        "tipoTramiteDescripcion": tipoTramiteDescripcion,
        "tramiteID": tramiteId,
        "fechaInicio": fechaInicio!.toIso8601String(),
        "fechaFin": fechaFin,
        "estadoID": estadoId,
      };
}
