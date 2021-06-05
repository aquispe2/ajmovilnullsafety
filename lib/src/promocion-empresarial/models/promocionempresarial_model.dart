// To parse this JSON data, do
//
//     final promocionEmpresarialModel = promocionEmpresarialModelFromJson(jsonString);

import 'dart:convert';

PromocionEmpresarialModel promocionEmpresarialModelFromJson(String str) =>
    PromocionEmpresarialModel.fromJson(json.decode(str));

String promocionEmpresarialModelToJson(PromocionEmpresarialModel data) =>
    json.encode(data.toJson());

class PromocionEmpresarialModel {

  PromocionEmpresarialModel(){

  }

  PromocionEmpresarialModel.condatos({
     this.sigla,
     this.promocionEmpresarialId,
     this.nombreEmpresa,
     this.nombrePromocion,
     this.fechaDesde,
     this.fechaHasta,
     this.estado,
     this.documentoAdjuntoTramiteId,
     this.cadenaCiteResolucion,
     this.codificacionRaa,
     this.direccion,
     this.modalidadPremiacion,
  });

  var sigla;
  var promocionEmpresarialId;
  var nombreEmpresa;
  var nombrePromocion;
  var fechaDesde;
  var fechaHasta;
  var estado;
  var documentoAdjuntoTramiteId;
  var cadenaCiteResolucion;
  var codificacionRaa;
  var direccion;
  var modalidadPremiacion;

  factory PromocionEmpresarialModel.fromJson(Map<String, dynamic> json) =>
      PromocionEmpresarialModel.condatos(
        sigla: json["Sigla"],
        promocionEmpresarialId: json["PromocionEmpresarialID"],
        nombreEmpresa: json["NombreEmpresa"],
        nombrePromocion: json["NombrePromocion"],
        fechaDesde: DateTime.parse(json["FechaDesde"]),
        fechaHasta: DateTime.parse(json["FechaHasta"]),
        estado: json["Estado"],
        documentoAdjuntoTramiteId: json["DocumentoAdjuntoTramiteID"],
        cadenaCiteResolucion: json["CadenaCiteResolucion"],
        codificacionRaa: json["CodificacionRAA"],
        direccion: json["Direccion"],
        modalidadPremiacion: json["ModalidadPremiacion"],
      );

  Map<String, dynamic> toJson() => {
        "Sigla": sigla,
        "PromocionEmpresarialID": promocionEmpresarialId,
        "NombreEmpresa": nombreEmpresa,
        "NombrePromocion": nombrePromocion,
        "FechaDesde": fechaDesde.toIso8601String(),
        "FechaHasta": fechaHasta.toIso8601String(),
        "Estado": estado,
        "DocumentoAdjuntoTramiteID": documentoAdjuntoTramiteId,
        "CadenaCiteResolucion": cadenaCiteResolucion,
        "CodificacionRAA": codificacionRaa,
        "Direccion": direccion,
        "ModalidadPremiacion": modalidadPremiacion,
      };
}
