class Barrios{
    const property elementos = []

    method agregarElementoAlBarrio(unElemento) {elementos.add(unElemento)}
    method elementosBuenos() = elementos.count({e => e.esBueno()})
    method elementosMalos() = elementos.count({e => !e.esBueno()})
    method esCopado() =  self.elementosBuenos() > self.elementosMalos()
}


class Hogar {
    var nivelDeMugre
    const confort

    method esBueno() = nivelDeMugre <= confort / 2
    method recibirAtaque(unaPlaga){
        nivelDeMugre += unaPlaga.nivelDeDanio()
    }
}

class Huerta{
    var capacidadDeProduccion

    method esBueno() = capacidadDeProduccion > nivelMinimoDeProduccion.valor()
    method recibirAtaque(unaPlaga) {
        capacidadDeProduccion = 0.max(capacidadDeProduccion - (unaPlaga.nivelDeDanio() / 10) + if(unaPlaga.transmiteEnfermedades()) 10 else 0)
    }
}


object nivelMinimoDeProduccion {
    var property valor = 2000
}


class Mascota{
    var salud

   method esBueno() = salud > 250
   method recibirAtaque(unaPlaga) {
        if(unaPlaga.transmiteEnfermedades()) salud = 0.max(salud - unaPlaga.nivelDeDanio())
    }
}