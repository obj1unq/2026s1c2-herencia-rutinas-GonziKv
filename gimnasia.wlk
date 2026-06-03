class Rutina {
    var property descanso
    var property intensidad
    var property rutinaActual
    method calorias(tiempo){
        return self.calcularCalorias(tiempo)
    }
    method calcularCalorias(tiempo){
        return 100 * (tiempo - descanso) * self.intensidad()
    }
    method calcularDescanso(tiempo){
        descanso = 0
    }
    method intensidad(){
        return rutinaActual.intensidad()
    }
}

class Running inherits Rutina {  
    override method calcularDescanso(tiempo){
        if (tiempo > 20) {
            descanso = 5
        } else {
            descanso = 2
        }
    }

}

class Maraton inherits Running{
    override method calcularCalorias(tiempo){
        return super(tiempo) * 2
    }
}