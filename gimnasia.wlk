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

class Persona{
    var property peso
    method realizarRutina(rutina){
        peso = (peso - self.cantCaloriasPerdidasPorRutina(rutina)).truncate(3)
    }

    method cantCaloriasPerdidasPorRutina(rutina){
        return  rutina.calcularCalorias(self.tiempoDePractica()) / self.kilosPorCaloriasQuePierde()
    }
    method tiempoDePractica()
    method kilosPorCaloriasQuePierde()
}

class PSedentaria inherits Persona {
    var property minutos
    override method kilosPorCaloriasQuePierde(){
        return 7000
    }
    override method tiempoDePractica(){
        return minutos
    }
    override method realizarRutina(rutina){
        if (peso > 50){
            super(rutina)
        } else {
            self.error("No puedo realizar la rutina ya que peso muy poco")
        }
        
    }
}

class PAtleta inherits Persona{

    override method kilosPorCaloriasQuePierde(){
        return 8000
    }

    override method tiempoDePractica(){
        return 90
    }
    override method cantCaloriasPerdidasPorRutina(rutina){
        return super(rutina) - 1
    }
    override method realizarRutina(rutina){
        if (rutina.calcularCalorias(self.tiempoDePractica()) > 10000){
            super(rutina)
        } else {
            self.error("No quiero realizar la rutina ya que no cumple la cuota calorica")
        }
    }

}