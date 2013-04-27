package com.idovoodoo.ld26;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxGroup;
import org.flixel.FlxPoint;

/**
 * ...
 * @author Idovoodoo
 */

class GameRegistry 
{
	public static var player:Player;
	//public static var weaponManager:WeaponManager;
	//public static var enemyManager:EnemyManager;
	public static var mapGroup:FlxGroup;
	public static var guiGroup:FlxGroup;
	public static var playerStart:FlxPoint;
	
	/**
	 * Init
	 * @param	x player start
	 * @param	y player start
	 */
	public static function init(x:Float, y:Float) {
		playerStart = new FlxPoint(x, y);
		//player = new Player(playerStart.x, playerStart.y);
		//weaponManager = new WeaponManager();
		//enemyManager = new EnemyManager();
		mapGroup = new FlxGroup();
		guiGroup = new FlxGroup();
	}
	
}