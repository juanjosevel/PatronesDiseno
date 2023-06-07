#include <iostream>

using namespace std;

enum TipoOponente {
	OT_Boo,
	OT_Koopa,
	OT_Goomba
};


class Oponente {
	
public:
	
	virtual void imprimirInfoOponente() = 0;
	virtual ~Oponente() {}
};

class Boo : public Oponente {
public:
	void imprimirInfoOponente()
	{
		cout << "Soy Boo" << endl;
	}
};

class Koopa : public Oponente {
public:
	void imprimirInfoOponente()
	{
		cout << "Soy Koopa" << endl;
	}
};

class Goomba : public Oponente {
public:
	void imprimirInfoOponente()
	{
		cout << "Soy Goomba" << endl;
	}
};

class OponenteFactory {
public:
	Oponente* build(TipoOponente tipoOponente)
	{
		if (tipoOponente == OT_Boo)
			return new Boo();
		else if (tipoOponente == OT_Koopa)
			return new Koopa();
		else if (tipoOponente == OT_Goomba)
			return new Goomba();
		else
			return nullptr;
	}
};

class Cliente {
public:
	Cliente() { pOponente = nullptr; }
	
	void ConstruirOponente(TipoOponente tipoOponente)
	{
		OponenteFactory* vf = new OponenteFactory();
		pOponente = vf->build(tipoOponente);
		
		delete vf;
	}
	
	~Cliente()
	{
		if (pOponente) {
			delete pOponente;
			pOponente = NULL;
		}
	}
	
	Oponente* obtenerOponente() { return pOponente; }
	
private:
		Oponente* pOponente;
};


int main()
{
	Cliente* pCliente = new Cliente();
	
	pCliente->ConstruirOponente(OT_Boo);
	pCliente->obtenerOponente()->imprimirInfoOponente();
	
	pCliente->ConstruirOponente(OT_Koopa);
	pCliente->obtenerOponente()->imprimirInfoOponente();
	
	pCliente->ConstruirOponente(OT_Goomba);
	pCliente->obtenerOponente()->imprimirInfoOponente();
	
	delete pCliente;
	return 0;
}
