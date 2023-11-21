import Lugares.*

class Expedicion {
	const participantes
	const lugaresAInvadir
	
	method participantes() = participantes
	
	method anotar(vikingo) {
		participantes.add(vikingo)
	}
	
	method valeLaPena() = lugaresAInvadir.all({ lugar => lugar.valeLaPena(participantes) })
	
	method dividirBotin(botin) = botin/participantes.size()
	
	method cobrarVidas() {
		participantes.forEach({ vikingo => vikingo.cobrarVida() })
	}
	
	method aumentarRiquezas(botin) {
		participantes.forEach({ vikingo => vikingo.aumentarRiqueza(self.dividirBotin(botin)) })
	}
	
	method realizarExpedicion() {
		lugaresAInvadir.forEach({ lugar => lugar.serInvadido(self) })
	}
}