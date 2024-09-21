import camion.*

object ruta9 {
    method permiteTransporte(camion) {
        return camion.puedeCircularEnRuta(11)
    }
}

object caminoVecinal {
    var pesoMaximo = 0

    method pesoMaximo(peso) {
        pesoMaximo = peso
    }

    method permiteTransporte(camion) {
        return camion.pesoTotal() <= pesoMaximo
    }
}