package systems;

import utils.GameHelper;
import components.Team;
import components.Sprite;
import components.Position;
import echoes.Entity;
import utils.AssetHelper;

class GameSystem extends echoes.System {
	public function new() {
		loadLevel();
	}

	public function loadLevel() {
		
		var sprite:Sprite = AssetHelper.getSprite("circle_green", 30);
		var personTest = new Entity().add(GameHelper.createPosition(200,200)).add(sprite);

		var teamASpawner = new Entity();
		GameHelper.assignTeamA(teamASpawner);


		var teamBSpawner = new Entity();
		GameHelper.assignTeamB(teamBSpawner);

	}
    
	public function update() {

    }
}
