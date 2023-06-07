#include <iostream>
#include <string>
using namespace std;

class Enemigo{
public:
	void definirNombre(const string &nombre){
		m_nombre = nombre;
	}	
	void definirArma(const string &arma){
		m_arma = arma;
	}	
	void definirDificultad(const string &dificultad){
		m_dificultad = dificultad;
	}	
	void definirNumero(const int &numero){
		m_numero = numero;
	}	
	void definirTamano(const int &tamano){
		m_tamano = tamano;
	}	
	void definirVelocidad(const string &velocidad){
		m_velocidad = velocidad;
	}	
	void definirDano(const string &dano){
		m_dano = dano;
	}	
	void imprimirDetalles(){
		cout << "Nombre: " << m_nombre << endl;
		cout << "Arma: " << m_arma << endl;
		cout << "Dificultad: " << m_dificultad << endl;
		cout << "Numero: " << m_numero << endl;
		cout << "Tamano: " << m_tamano << endl;
		cout << "Velocidad: " << m_velocidad << endl;
		cout << "Dano: " << m_dano << endl;
	}
	
private:
		string m_nombre;
		string m_arma;
		string m_dificultad;
		int m_numero;
		int m_tamano;
		string m_velocidad;
		string m_dano;
};


class EnemigoBuilder{
public:
	virtual void definirNombre() = 0;
	virtual void definirArma() = 0;
	virtual void definirDificultad() = 0;
	virtual void definirNumero() = 0;
	virtual void definirTamano() = 0;
	virtual void definirVelocidad() = 0;
	virtual void definirDano() = 0;
	
	virtual Enemigo *generarEnemigo() = 0;
};


class SoldadoBuilder : public EnemigoBuilder{
public:
	SoldadoBuilder(){
		nuevoSoldado = new Enemigo();
	}	
	void definirNombre(){
		nuevoSoldado->definirNombre("Marcus fenix");
	}	
	void definirArma(){
		nuevoSoldado->definirArma("Ametralladora");
	}	
	void definirDificultad(){
		nuevoSoldado->definirDificultad("Media");
	}	
	void definirNumero(){
		nuevoSoldado->definirNumero(8);
	}	
	void definirTamano(){
		nuevoSoldado->definirTamano(3);
	}	
	void definirVelocidad(){
		nuevoSoldado->definirVelocidad("Rapido");
	}	
	void definirDano(){
		nuevoSoldado->definirDano("Grave");
	}	
		Enemigo *generarEnemigo(){
		return nuevoSoldado;
	}
	
private:
			Enemigo *nuevoSoldado;
};


class CazadorBuilder : public EnemigoBuilder{
public:
	CazadorBuilder(){
		nuevoCazador = new Enemigo();
	}	
	void definirNombre(){
		nuevoCazador->definirNombre("Morgan");
	}	
	void definirArma(){
		nuevoCazador->definirArma("Lanzallamas");
	}	
	void definirDificultad(){
		nuevoCazador->definirDificultad("Alta");
	}	
	void definirNumero(){
		nuevoCazador->definirNumero(4);
	}	
	void definirTamano(){
		nuevoCazador->definirTamano(5);
	}	
	void definirVelocidad(){
		nuevoCazador->definirVelocidad("rapida");
	}	
	void definirDano(){
		nuevoCazador->definirDano("Leve");
	}	
		Enemigo *generarEnemigo(){
		return nuevoCazador;
	}
	
private:
			Enemigo *nuevoCazador;
};

class Director{
public:
	Enemigo *crearEnemigo(EnemigoBuilder *constructor){
		constructor->definirNombre();
		constructor->definirArma();
		constructor->definirDificultad();
		constructor->definirNumero();
		constructor->definirTamano();
		constructor->definirVelocidad();
		constructor->definirDano();
		return constructor->generarEnemigo();
	}
};

int main(){
	Director director;
	SoldadoBuilder construirSoldado;
	Enemigo *soldado = director.crearEnemigo(&construirSoldado);
	cout << "\nCaracteristicas del enemigo Soldado: \n";
	soldado->imprimirDetalles();
	
	CazadorBuilder construirCazador;
	Enemigo *cazador = director.crearEnemigo(&construirCazador);
	cout << "\nCaracteristicas del enemigo Cazador: \n";
	cazador->imprimirDetalles();
}
