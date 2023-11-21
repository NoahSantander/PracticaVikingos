import Vikingos.*

class Lugar {
	method botin(invasores)
	method valeLaPena(invasores)
	method serInvadido(expedicion) {
		expedicion.aumentarRiquezas(self.botin(expedicion.participantes()))
	}
}

class Capital inherits Lugar {
	const factorDeRiqueza
	
	method defensoresDerrotados(invasores) = invasores.size()
	override method botin(invasores) = self.defensoresDerrotados(invasores) * factorDeRiqueza
	override method valeLaPena(invasores) = self.botin(invasores) > 3 * invasores.size()
	override method serInvadido(expedicion) {
		super(expedicion) 
		expedicion.cobrarVidas()
	}
}

class Aldea inherits Lugar {
	const cantidadDeCrucifijos
	
	override method botin(invasores) = cantidadDeCrucifijos
	override method valeLaPena(invasores) = self.botin(invasores) > 15
	
}

class AldeaAmurallada inherits Aldea {
	const invasoresMinimos
	
	method tieneLosInvasoresMinimos(invasores) = invasores.size() > invasoresMinimos
	override method valeLaPena(invasores) = self.tieneLosInvasoresMinimos(invasores)
}