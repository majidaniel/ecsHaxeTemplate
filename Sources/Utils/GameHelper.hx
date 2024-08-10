package utils;

import components.Position;
import echoes.Entity;
import components.Team;

class GameHelper {
	public static function assignTeamA(entity:Entity) {
		var teamA:Team = {team: TeamIdentifier.A};
		entity.add(teamA);
	}

	public static function assignTeamB(entity:Entity) {
		var teamB:Team = {team: TeamIdentifier.B};
		entity.add(teamB);
	}
    public static function createPosition(x:Float,y:Float):Position{
        return {x:x, y:y};
    }
}
