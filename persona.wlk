class Persona{
    var property peso
    method realizarRutina(rutina){
        peso = peso - self.cantCaloriasPerdidasPorRutina(rutina)
    }

    method cantCaloriasPerdidasPorRutina(rutina){
        return rutina.calcularCalorias(self.tiempoDePractica()) / self.kilosPorCaloriasQuePierde()
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