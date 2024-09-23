import cosas.*
import camion.*

object almacen {
  const property almacenamiento = []
  var maximoDeBultos = 3
  
  method agregarCosas(cosas) {
    almacenamiento.addAll(cosas)
  }
  
  method maximoDeBultos() {
    return maximoDeBultos
  } 

  method superaElMaximoDeBultos() = self.cantidadDeBultos() >= maximoDeBultos
  
  method cantidadDeBultos() = cosas.sum({ cosa => cosa.bulto() })
}