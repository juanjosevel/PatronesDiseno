#include <iostream>
using namespace std;

// Clase abstracta Arma
class Arma {
public:
    virtual void atacar() = 0;
};

// Clase concreta Detective que implementa Arma
class DetectiveArma : public Arma {
public:
    void atacar() override {
        cout << "Detective usando arma" << endl;
    }
};
// Clase concreta Zommbie que implementa Arma
class ZombieArma : public Arma {
public:
    void atacar() override {
        cout << "Zombie usando arma" << endl;
    }
};

class Habilidades{
public:
    virtual void powerup() = 0;
};

class DetectiveHabilidades: public Habilidades{
public:
    void powerup() override {
        cout << "Detective incrementando habilidades"<<endl;
    }
};

class ZombieHabilidades: public Habilidades{
public:
    void powerup() override {
        cout << "Zombie incrementando habilidades"<<endl;
    }
};

// Clase abstracta AbstractFactory
class AbstractFactory {
public:
    virtual Arma* crearArma() = 0;
    virtual Habilidades* crearHabilidad() = 0;
};

// Clase concreta DetectiveFactory que implementa AbstractFactory
class DetectiveFactory : public AbstractFactory {
public:
    Arma* crearArma() override {
        return new DetectiveArma();
    }

    Habilidades* crearHabilidad() override {
        return new DetectiveHabilidades();
    }
};

// Clase concreta ZombieFactory que implementa AbstractFactory
class ZombieFactory : public AbstractFactory {
public:
    Arma* crearArma() override {
        return new ZombieArma();
    }
    Habilidades* crearHabilidad() override {
        return new ZombieHabilidades();
    }
};

int main() {
    // Crear la fábrica de detectives
    AbstractFactory* detectiveFactory = new DetectiveFactory();
    // Crear un arma de detective
    Arma* armaDetective = detectiveFactory->crearArma();
    // Crear unas habilidades de detective
    Habilidades* habilidadesDetective = detectiveFactory->crearHabilidad();

    // Usar el arma y las habilidades del detective
    armaDetective->atacar();
    habilidadesDetective->powerup();

    // Crear la fábrica de zombies
    AbstractFactory* zombieFactory = new ZombieFactory();
    // Crear un arma de zombie
    Arma* armaZombie = zombieFactory->crearArma();
    // Crear unas habilidades de zombie
    Habilidades* habilidadesZombie = zombieFactory->crearHabilidad();

    // Usar el arma y las habilidades del zombie
    armaZombie->atacar();
    habilidadesZombie->powerup();

    // Liberar memoria
    delete detectiveFactory;
    delete armaDetective;
    delete habilidadesDetective;
    delete zombieFactory;
    delete armaZombie;
    delete habilidadesZombie;

    return 0;
}
