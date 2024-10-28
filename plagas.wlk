class Plagas{
    var poblacion

    method transmiteEnfermedades() = poblacion >= 10
    method poblacion() = poblacion
    method sufrirConsecuencias() {poblacion = poblacion + (poblacion / 10)}
    method atacar(elemento){
        elemento.recibirAtaque(self)
        self.sufrirConsecuencias()
    }
}

class Cucarachas inherits Plagas{
    var peso = 0.26
    method nivelDeDanio() = poblacion / 2

    override method transmiteEnfermedades() = super() && poblacion * peso >= 10
    override method sufrirConsecuencias() {
        super()
        peso += 2
    }
    method peso() = peso
}

class Pulgas inherits Plagas{
    method nivelDeDanio() = poblacion * 2
}

class Garrapatas inherits Pulgas{
    override method sufrirConsecuencias() {
        poblacion = poblacion * 1.2
    }
}


class Mosquitos inherits Plagas{
    method nivelDeDanio() = poblacion
    override method transmiteEnfermedades() = super() && poblacion % 3 == 0
}