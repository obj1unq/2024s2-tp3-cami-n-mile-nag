import cosas.*
import almacen.*
import caminos.*

object camion {
	const property cosas = []
	const pesoMaximo = 2500
	var cantTotalDeBultos = 0
	const tara = 100

	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.serCargada()
	}
	
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	
	method todoPesoPar() = cosas.all({ cosa => cosa.peso().even() })
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method elDelNivel(nivel) = cosas.find(
		{ cosa => cosa.nivelDePeligrosidad() == nivel }
	)
	
	method pesoTotal() = cosas.sum({ cosa => cosa.peso() }) + tara
	
	method excedidoDePeso() = self.pesoTotal() >= pesoMaximo
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter(
		{ cosa => cosa.nivelDePeligrosidad() == nivel }
	)
	
	//method objetoMasPeligrosoQue(algunaCosa) = cosas.filter(
	//	{ cosa => cosa.nivelDePeligrosidad() < algunaCosa.nivelDePeligrosidad() }
	//)
	
	method objetoMasPeligrosoQue(algunaCosa) = cosas.filter(
		{ cosa => self.objetosQueSuperanPeligrosidad(cosa.nivelDePeligrosidad()) }
	)

	//method puedeCircularEnRuta(
	//	nivelMaximoDePeligrosidad
	//) = (!self.excedidoDePeso()) and (!self.ningunObjetoEsMuyPeligroso(
	//	nivelMaximoDePeligrosidad
	//))

	method puedeCircularEnRuta(
		nivelMaximoDePeligrosidad
	 ) = (!self.excedidoDePeso()) and (self.objetosQueSuperanPeligrosidad(nivelMaximoDePeligrosidad).isEmpty())

	
	
	method ningunObjetoEsMuyPeligroso(nivelMaximoDePeligrosidad) = cosas.all(
		{ cosa => cosa.nivelDePeligrosidad() <= nivelMaximoDePeligrosidad }
	)
	
	method tieneAlgoQuePesaEntre(min, max) = (self.pesos().between(min, max)) 
	//CONSULTA, si la lista es vacía esto es un error. 
	
	//como puedo hacer para que funcione? debería agarrar el error?
	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })
	
	method pesos() = cosas.map({ cosa => cosa.peso() })
	
	method totalDeBultos() = cosas.sum({ cosa => cosa.bulto() })
	
	method transportar(camino, destino) {
		self.verificarSiPuedeTransportar(camino, destino)
		self.llegadaADestino(destino)
	}

/* 
    -------------------------------------------------------------------------------
	method verificarSiPuedeTransportar(camino, destino) {
		if (self.excedidoDePeso() and (not camino.permiteTransporte(self))){
			self.error("El camión no puede realizar el transporte.")
		} 
		if ((destino.totalBultos() + cantTotalDeBultos) > destino.maximoBultos()){
			self.error("El almacén no puede recibir más bultos.")
		}
	}
	-------------------------------------------------------------------------------

	** lo hice de esta manera y despues de la forma que se muestra abajo, de ninguna manera me corre el test 
	pero creo que el error lo tengo en otra parte y no lo puedo ver.
*/ 

	method verificarPesoYSiPuedeCircular(camino){
		if (self.excedidoDePeso() and (not camino.permiteTransporte(self))){
			self.error("El camión no puede realizar el transporte.")
		} 
	}

	method verificarElAlmacen(destino) {
	  	if ((destino.totalBultos() + cantTotalDeBultos) > destino.maximoBultos()){
			self.error("El almacén no puede recibir más bultos.")
		}
	}

	method verificarSiPuedeTransportar(camino, destino) {
		self.verificarPesoYSiPuedeCircular(camino)
		self.verificarElAlmacen(destino)
	}
	
	method llegadaADestino(destino) {
		destino.agregarCosas(cosas)
		self.vaciarCamion()
	}
	
	method vaciarCamion() {
		cosas.clear()
	}
} 
