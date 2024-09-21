import cosas.*
import camion.*

object almacen {
  const property almacenamiento = []
  const maximoDeBultos = 3
  
  method agregarCosa(cosa) {
    almacenamiento.add(cosa)
  }
  
  method superaElMaximoDeBultos() = self.cantidadDeBultos() >= maximoDeBultos
  
  method cantidadDeBultos() = cosas.sum({ cosa => cosa.bulto() })
}