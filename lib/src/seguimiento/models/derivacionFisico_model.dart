import 'package:flutter/foundation.dart';

@immutable
class DerivacionFisicoModel {
  const DerivacionFisicoModel({
    required this.fechaRecepcion,
    required this.flujoID,
    required this.etapa,
    required this.flujoEtapaID,
    required this.flujoEtapaAlternoID,
    required this.estadoTareaID,
    required this.tramiteID,
    required this.descripcion,
    required this.estadoID,
  });

  final String fechaRecepcion;
  final int flujoID;
  final String etapa;
  final int flujoEtapaID;
  final int flujoEtapaAlternoID;
  final int estadoTareaID;
  final int tramiteID;
  final String descripcion;
  final int estadoID;

  factory DerivacionFisicoModel.fromJson(Map<String, dynamic> json) =>
      DerivacionFisicoModel(
          fechaRecepcion: json['fechaRecepcion'] as String,
          flujoID: json['flujoID'] as int,
          etapa: json['etapa'] as String,
          flujoEtapaID: json['flujoEtapaID'] as int,
          flujoEtapaAlternoID: json['flujoEtapaAlternoID'] as int,
          estadoTareaID: json['estadoTareaID'] as int,
          tramiteID: json['tramiteID'] as int,
          descripcion: json['descripcion'] as String,
          estadoID: json['estadoID'] as int);

  Map<String, dynamic> toJson() => {
        'fechaRecepcion': fechaRecepcion,
        'flujoID': flujoID,
        'etapa': etapa,
        'flujoEtapaID': flujoEtapaID,
        'flujoEtapaAlternoID': flujoEtapaAlternoID,
        'estadoTareaID': estadoTareaID,
        'tramiteID': tramiteID,
        'descripcion': descripcion,
        'estadoID': estadoID
      };

  DerivacionFisicoModel clone() => DerivacionFisicoModel(
      fechaRecepcion: fechaRecepcion,
      flujoID: flujoID,
      etapa: etapa,
      flujoEtapaID: flujoEtapaID,
      flujoEtapaAlternoID: flujoEtapaAlternoID,
      estadoTareaID: estadoTareaID,
      tramiteID: tramiteID,
      descripcion: descripcion,
      estadoID: estadoID);

  DerivacionFisicoModel copyWith(
          {String? fechaRecepcion,
          int? flujoID,
          String? etapa,
          int? flujoEtapaID,
          int? flujoEtapaAlternoID,
          int? estadoTareaID,
          int? tramiteID,
          String? descripcion,
          int? estadoID}) =>
      DerivacionFisicoModel(
        fechaRecepcion: fechaRecepcion ?? this.fechaRecepcion,
        flujoID: flujoID ?? this.flujoID,
        etapa: etapa ?? this.etapa,
        flujoEtapaID: flujoEtapaID ?? this.flujoEtapaID,
        flujoEtapaAlternoID: flujoEtapaAlternoID ?? this.flujoEtapaAlternoID,
        estadoTareaID: estadoTareaID ?? this.estadoTareaID,
        tramiteID: tramiteID ?? this.tramiteID,
        descripcion: descripcion ?? this.descripcion,
        estadoID: estadoID ?? this.estadoID,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DerivacionFisicoModel &&
          fechaRecepcion == other.fechaRecepcion &&
          flujoID == other.flujoID &&
          etapa == other.etapa &&
          flujoEtapaID == other.flujoEtapaID &&
          flujoEtapaAlternoID == other.flujoEtapaAlternoID &&
          estadoTareaID == other.estadoTareaID &&
          tramiteID == other.tramiteID &&
          descripcion == other.descripcion &&
          estadoID == other.estadoID;

  @override
  int get hashCode =>
      fechaRecepcion.hashCode ^
      flujoID.hashCode ^
      etapa.hashCode ^
      flujoEtapaID.hashCode ^
      flujoEtapaAlternoID.hashCode ^
      estadoTareaID.hashCode ^
      tramiteID.hashCode ^
      descripcion.hashCode ^
      estadoID.hashCode;
}
