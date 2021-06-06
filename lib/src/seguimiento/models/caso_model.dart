// To parse this JSON data, do
//
//     final casoModel = casoModelFromJson(jsonString);

import 'dart:convert';

CasoModel casoModelFromJson(String str) => CasoModel.fromJson(json.decode(str));

String casoModelToJson(CasoModel data) => json.encode(data.toJson());

class CasoModel {
  CasoModel({
     this.casoId=0,
     this.numeroCaso="",
     this.nombreCompleto="",
     this.telefono="",
     this.mail="",
     this.descripcion="",
    this.conclusion="",
     this.fechaRegistro="",
    this.fechaConclusion,
    this.fechaRespuesta,
     this.usuarioActualId=0,
     this.oficinaId=0,
     this.tipoRegistroId=0,
     this.descripcionRegistro="",
     this.tipoProcesoId=0,
     this.descripcionProceso="",
     this.departamentoId=0,
     this.descripcionDepartamento="",
     this.estadoCasoId=0,
     this.descripcionEstadoCaso="",
     this.estadoId=0,
     this.medioConsulta=0,
     this.descripcionMedioConsulta="",
    this.numeroFormulario,
    this.medioConclusion,
    this.accionCorrectiva,
    this.domicilio,
    this.ci,
     this.esReservaDeIdentidad=false,
     this.esAntiCorrupcion=false,
    this.analisisConclusion,
    this.tieneVistoBueno,
    this.respuestaParcial,
    this.fechaRespuestaParcial,
    this.usuarioRespuestaParcialId,
    this.fechaSuceso,
    this.descripcionDerechosVulnerados,
    this.identificacionReclamado,
    this.tramiteId,
  });

  int casoId;
  String numeroCaso;
  String nombreCompleto;
  String telefono;
  String mail;
  String descripcion;
  dynamic conclusion;
  String fechaRegistro;
  dynamic fechaConclusion;
  dynamic fechaRespuesta;
  int usuarioActualId;
  int oficinaId;
  int tipoRegistroId;
  String descripcionRegistro;
  int tipoProcesoId;
  String descripcionProceso;
  int departamentoId;
  String descripcionDepartamento;
  int estadoCasoId;
  String descripcionEstadoCaso;
  int estadoId;
  int medioConsulta;
  String descripcionMedioConsulta;
  dynamic numeroFormulario;
  dynamic medioConclusion;
  dynamic accionCorrectiva;
  dynamic domicilio;
  dynamic ci;
  bool esReservaDeIdentidad;
  bool esAntiCorrupcion;
  dynamic analisisConclusion;
  dynamic tieneVistoBueno;
  dynamic respuestaParcial;
  dynamic fechaRespuestaParcial;
  dynamic usuarioRespuestaParcialId;
  dynamic fechaSuceso;
  dynamic descripcionDerechosVulnerados;
  dynamic identificacionReclamado;
  dynamic tramiteId;

  factory CasoModel.fromJson(Map<String, dynamic> json) => CasoModel(
        casoId: json["casoId"],
        numeroCaso: json["numeroCaso"],
        nombreCompleto: json["nombreCompleto"],
        telefono: json["telefono"],
        mail: json["mail"],
        descripcion: json["descripcion"],
        conclusion: json["conclusion"],
        fechaRegistro: json["fechaRegistro"],
        fechaConclusion: json["fechaConclusion"],
        fechaRespuesta: json["fechaRespuesta"],
        usuarioActualId: json["usuarioActualId"],
        oficinaId: json["oficinaId"],
        tipoRegistroId: json["tipoRegistroId"],
        descripcionRegistro: json["descripcionRegistro"],
        tipoProcesoId: json["tipoProcesoId"],
        descripcionProceso: json["descripcionProceso"],
        departamentoId: json["departamentoId"],
        descripcionDepartamento: json["descripcionDepartamento"],
        estadoCasoId: json["estadoCasoId"],
        descripcionEstadoCaso: json["descripcionEstadoCaso"],
        estadoId: json["estadoId"],
        medioConsulta: json["medioConsulta"],
        descripcionMedioConsulta: json["descripcionMedioConsulta"],
        numeroFormulario: json["numeroFormulario"],
        medioConclusion: json["medioConclusion"],
        accionCorrectiva: json["accionCorrectiva"],
        domicilio: json["domicilio"],
        ci: json["ci"],
        esReservaDeIdentidad: json["esReservaDeIdentidad"],
        esAntiCorrupcion: json["esAntiCorrupcion"],
        analisisConclusion: json["analisisConclusion"],
        tieneVistoBueno: json["tieneVistoBueno"],
        respuestaParcial: json["respuestaParcial"],
        fechaRespuestaParcial: json["fechaRespuestaParcial"],
        usuarioRespuestaParcialId: json["usuarioRespuestaParcialId"],
        fechaSuceso: json["fechaSuceso"],
        descripcionDerechosVulnerados: json["descripcionDerechosVulnerados"],
        identificacionReclamado: json["identificacionReclamado"],
        tramiteId: json["tramiteId"],
      );

  Map<String, dynamic> toJson() => {
        "casoId": casoId,
        "numeroCaso": numeroCaso,
        "nombreCompleto": nombreCompleto,
        "telefono": telefono,
        "mail": mail,
        "descripcion": descripcion,
        "conclusion": conclusion,
        "fechaRegistro": fechaRegistro,
        "fechaConclusion": fechaConclusion,
        "fechaRespuesta": fechaRespuesta,
        "usuarioActualId": usuarioActualId,
        "oficinaId": oficinaId,
        "tipoRegistroId": tipoRegistroId,
        "descripcionRegistro": descripcionRegistro,
        "tipoProcesoId": tipoProcesoId,
        "descripcionProceso": descripcionProceso,
        "departamentoId": departamentoId,
        "descripcionDepartamento": descripcionDepartamento,
        "estadoCasoId": estadoCasoId,
        "descripcionEstadoCaso": descripcionEstadoCaso,
        "estadoId": estadoId,
        "medioConsulta": medioConsulta,
        "descripcionMedioConsulta": descripcionMedioConsulta,
        "numeroFormulario": numeroFormulario,
        "medioConclusion": medioConclusion,
        "accionCorrectiva": accionCorrectiva,
        "domicilio": domicilio,
        "ci": ci,
        "esReservaDeIdentidad": esReservaDeIdentidad,
        "esAntiCorrupcion": esAntiCorrupcion,
        "analisisConclusion": analisisConclusion,
        "tieneVistoBueno": tieneVistoBueno,
        "respuestaParcial": respuestaParcial,
        "fechaRespuestaParcial": fechaRespuestaParcial,
        "usuarioRespuestaParcialId": usuarioRespuestaParcialId,
        "fechaSuceso": fechaSuceso,
        "descripcionDerechosVulnerados": descripcionDerechosVulnerados,
        "identificacionReclamado": identificacionReclamado,
        "tramiteId": tramiteId,
      };
}
