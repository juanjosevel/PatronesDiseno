#include <iostream>
#include <memory>

using namespace std;

class Player {
public:
    Player() {
        cout << "Inicializando al jugador" << endl;
    }

    void Attack() {
        cout << "¡El jugador ataca!" << endl;
    }
};

class Game 
{
    private:
        shared_ptr<Player> player;
    public:
        Game() {}
        shared_ptr<Player> GetPlayer() {
            if (!player) {
                player = make_shared<Player>();  
            }
            return player;
        }
};

int main() 
{
    Game game;
    shared_ptr<Player> player = game.GetPlayer();  
    player->Attack(); 
    // ...
    return 0;
}
