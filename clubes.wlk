class Club {
    var property predios 

    method mejorPredio(persona){
        return predios.max({predio => predio.caloriasTotalesAGastar(persona)})
    }
    method predioTranqui(persona){
        return predios.filter({predio => predio.esTranqui(persona)})
    }
    method rutinasMasExigentes(persona){
        return predios.map({predio => predio.rutinaMasExigente(persona)})
    }
}

class Predio{
    var property rutinas

    method caloriasTotalesAGastar(persona){
        return rutinas.sum({rutina => persona.cantCaloriasPerdidasPorRutina(rutina)})
    }

    method esTranqui(persona){
        return rutinas.any({rutina => persona.cantCaloriasPerdidasPorRutina(rutina) < 500})
    }

    method rutinaMasExigente(persona){
        return rutinas.max({rutina => persona.cantCaloriasPerdidasPorRutina(rutina)})
    }
}