import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AvisoModel {
  const AvisoModel({
    this.avisoMovilId = 0,
    this.fechaAviso = "",
    this.enlace = "",
    this.nombreArchivo = "",
    this.titulo = "",
    this.contenido = "",
    this.mensajeCorto = "",
  });

  final int avisoMovilId;
  final String fechaAviso;
  final String enlace;
  final String nombreArchivo;
  final String titulo;
  final String contenido;
  final String mensajeCorto;

  factory AvisoModel.fromJson(Map<String, dynamic> json) => AvisoModel(
      avisoMovilId: json['avisoMovilId'] as int,
      fechaAviso: json['fechaAviso'] as String,
      enlace: json['enlace'] as String,
      nombreArchivo: json['nombreArchivo'] as String,
      titulo: json['titulo'] as String,
      contenido: json['contenido'] as String,
      mensajeCorto: json['mensajeCorto'] as String);

  Map<String, dynamic> toJson() => {
        'avisoMovilId': avisoMovilId,
        'fechaAviso': fechaAviso,
        'enlace': enlace,
        'nombreArchivo': nombreArchivo,
        'titulo': titulo,
        'contenido': contenido,
        'mensajeCorto': mensajeCorto
      };

  AvisoModel clone() => AvisoModel(
      avisoMovilId: avisoMovilId,
      fechaAviso: fechaAviso,
      enlace: enlace,
      nombreArchivo: nombreArchivo,
      titulo: titulo,
      contenido: contenido,
      mensajeCorto: mensajeCorto);

  AvisoModel copyWith(
          {int? avisoMovilId,
          String? fechaAviso,
          String? enlace,
          String? nombreArchivo,
          String? titulo,
          String? contenido,
          String? mensajeCorto}) =>
      AvisoModel(
          avisoMovilId: avisoMovilId ?? this.avisoMovilId,
          fechaAviso: fechaAviso ?? this.fechaAviso,
          enlace: enlace ?? this.enlace,
          nombreArchivo: nombreArchivo ?? this.nombreArchivo,
          titulo: titulo ?? this.titulo,
          contenido: contenido ?? this.contenido,
          mensajeCorto: mensajeCorto ?? this.mensajeCorto);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvisoModel &&
          avisoMovilId == other.avisoMovilId &&
          fechaAviso == other.fechaAviso &&
          enlace == other.enlace &&
          nombreArchivo == other.nombreArchivo &&
          titulo == other.titulo &&
          contenido == other.contenido &&
          mensajeCorto == other.mensajeCorto;

  @override
  int get hashCode =>
      avisoMovilId.hashCode ^
      fechaAviso.hashCode ^
      enlace.hashCode ^
      nombreArchivo.hashCode ^
      titulo.hashCode ^
      contenido.hashCode ^
      mensajeCorto.hashCode;
}
