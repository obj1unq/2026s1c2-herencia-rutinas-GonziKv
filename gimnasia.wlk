class Rutina {
    var property intensidad = 0
    method calorias(tiempo){
        return self.calcularCalorias(tiempo)
    }
    method calcularCalorias(tiempo){
        return 100 * (tiempo - self.calcularDescanso(tiempo)) * self.intensidad()
    }
    method calcularDescanso(tiempo){
       return 0
    }
    method intensidad(){
        return intensidad
    }

}

class Running inherits Rutina {  
    override method calcularDescanso(tiempo){
        if (tiempo > 20) {
            return 5
        } else {
            return  2
        }
    }

}

class Maraton inherits Running{
    override method calcularCalorias(tiempo){
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina {
    override method intensidad(){
        return 1.3
    }
    override method calcularDescanso(tiempo){
        return tiempo / 5
    }
}

class RemoDeCompeticion inherits Remo{
    override method intensidad(){
        return 1.7
    }

    override method calcularDescanso(tiempo){
        return 2.max(super(tiempo) - 3)
    }
}