import 'package:get/get.dart';
import 'package:movilaj/src/promocion-empresarial/models/juegoAzar_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/juegoLoteria_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/lugarPremiacon_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/lugarSorteo_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/mecanicapremiacion_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/premiosofertados_model.dart';
import 'package:movilaj/src/promocion-empresarial/models/promocionempresarial_model.dart';
import 'package:movilaj/src/promocion-empresarial/services/PromocionEmpresarialServices.dart';

class PromocionEmpresarialController extends GetxController {
  final _promocionEmpresarialService = new PromocionEmpresarialService();

  // PARA JUEGOS DE LOTERIA
  var lstJuegoDeLoteria = new List<JuegosLoteriaModel>.empty().obs;
  var descargandoJuegosLoteria = false.obs;
  // ==================================

  // PARA JUEGOS DE AZAR
  var lstJuegoDeAzar = new List<JuegosAzarModel>.empty().obs;
  var descargandoJuegosAzar = false.obs;
  // =================================

  // PARA MECANICA DE PREMIACIÓN
  var vMecanicaPremiacion = "".obs;
  var descargandoMecanica = false.obs;
  // ==========================

  // PARA PREMIOS OFERTADOS
  var lstPremiosOfertados = new List<PremiosOfertadosModel>.empty().obs;
  var descargandoPremioOfertado = false.obs;
  // ======================

  // PARA LUGAR PREMIACION
  var lstLugarPremiacion = new List<LugarPremiacionModel>.empty().obs;
  var descargandoLugarPremiacion = false.obs;
  // =========================

  // PARA LUGAR DE SORTEO
  var lstLugarSorteo = new List<LugarSorteoModel>.empty().obs;
  var descargandoLugarSorteo = false.obs;
  // ========================

  // PARA LISTA DE PRMOCUIONES EMPRESARIALES
  var lstPromociones = new List<PromocionEmpresarialModel>.empty().obs;
  var objPromocion = new PromocionEmpresarialModel();
  var estaProceso = false.obs;
  // ====================================

  String mensajeBusqueda = "";

  Future cargarPromocionesEmpresarialesTodos() async {
    lstPromociones.value = List.empty();
    estaProceso.value = true;
    lstPromociones.value =
        await _promocionEmpresarialService.obtenerPromocionEmpresarialTodos();
    estaProceso.value = false;
  }

  Future<bool> cargarPromocionesEmpresarialesByTextoBusqueda(
      String pTextoBuscar) async {
    print("INICIA BUSQUEDA");
    estaProceso.value = true;
    lstPromociones.value = await _promocionEmpresarialService
        .obtenerPromocionEmpresarial(pTextoBuscar: pTextoBuscar);
    estaProceso.value = false;
    print("TERMINA BUSQUEDA");
    if (lstPromociones.length > 0)
      return true;
    else
      return false;
  }

  String getMensajeBusqueda() {
    return mensajeBusqueda;
  }

  void setMensajeBusqueda(String pMensaje) {
    mensajeBusqueda = pMensaje;
  }

  void setObjPromocion(PromocionEmpresarialModel obj) {
    objPromocion = obj;
  }

  // metodo para listar mecanica de premiación por pPromocionId
  void cargarMecanicaPremiacionByPromocionId(int pPromocionId) async {
    descargandoMecanica.value = true;
    vMecanicaPremiacion.value = await _promocionEmpresarialService
        .obtenerMecanicaPremiacion(pPromocionId: pPromocionId);

    descargandoMecanica.value = false;
  }

  void cargarPremiosOfertadosByPromocionId(int pPromocionId) async {
    descargandoPremioOfertado.value = true;
    final premiosOfertados = await _promocionEmpresarialService
        .obtenerPremiosOfertados(pPromocionId: pPromocionId);
    lstPremiosOfertados.value = premiosOfertados;
    descargandoPremioOfertado.value = false;
  }

  void cargarLugaresPremiacionByPromocionId(int pPromocionId) async {
    descargandoLugarPremiacion.value = true;
    final lugaresPremiacion = await _promocionEmpresarialService
        .obtenerLugarPremiacion(pPromocionId: pPromocionId);
    lstLugarPremiacion.value = lugaresPremiacion;
    descargandoLugarPremiacion.value = false;
  }

  // metodo para listar lugar de sorteo por pPromocionId
  void cargarLugaresSorteoByPromocionId(int pPromocionId) async {
    descargandoLugarSorteo.value = true;
    final lugarSorteo = await _promocionEmpresarialService.obtenerLugarSorteo(
        pPromocionId: pPromocionId);
    lstLugarSorteo.value = lugarSorteo;
    descargandoLugarSorteo.value = false;
  }

  // limpiarDetallePremios
  void limpiarDetallePremios() {
    vMecanicaPremiacion.value = "";
    lstPremiosOfertados.value = new List.empty();
    lstLugarPremiacion.value = new List.empty();
    lstLugarSorteo.value = new List.empty();
  }

  void limpiarPromocion() {
    lstPromociones.value = new List.empty();
  }

  //PARA JUEGOS DE LOTERIA
  void cargarJuegosLoteriaTodos() async {
    descargandoJuegosLoteria.value = true;
    lstJuegoDeLoteria.value =
        await _promocionEmpresarialService.obtenerJuegosLoteria();
    descargandoJuegosLoteria.value = false;
  }

  //PARA JUEGOS DE AZAS
  void cargarJuegosAzarTodos() async {
    descargandoJuegosAzar.value = true;
    lstJuegoDeAzar.value =
        await _promocionEmpresarialService.obtenerJuegosAzar();
    descargandoJuegosAzar.value = false;
  }
}
