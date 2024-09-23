import camion.*

object ruta9 {
    const nivelDePeligrosidad = 11

    method permiteTransporte(camion) {
        return camion.puedeCircularEnRuta(nivelDePeligrosidad)
    }
}

object caminoVecinal {
    var property pesoMaximo = 0

    method permiteTransporte(camion) {
        return camion.pesoTotal() <= pesoMaximo
    }
}