package com.idovoodoo.ld26;

import org.flixel.FlxGroup;
import org.flixel.FlxPoint;
import org.flixel.FlxRect;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxG;
import org.flixel.FlxCamera;
import org.flixel.FlxTilemap;

/**
 * ...
 * @author Idovoodoo
 */
class Map0 extends FlxGroup
{
	private var tiles:FlxTilemap;
	private var state:FlxState;
	private var numTiles:FlxPoint;
	private var mapGroup:FlxGroup;
	private var guiGroup:FlxGroup;
	private var _playerStart:FlxPoint;
	private var _levelSize:FlxPoint;
	private var _tileSize:FlxPoint;
	private var player:FlxSprite;
	private static var SIZE:FlxPoint = new FlxPoint(10, 10);
	
	//map
	private static var LEVEL:Array<Int> = [
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,6,6,6,6,0,0,0,0,0,0,0,0,4,4,4,4,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,3,3,3,3,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	];
	
	/**
	 * Constructor
	 * @param	levelSize
	 * @param	tileSize
	 */
	public function new(levelSize:FlxPoint, tileSize:FlxPoint) 
	{
		super();
		mapGroup = new FlxGroup();
		guiGroup = new FlxGroup();
		_levelSize = levelSize;
		_tileSize = tileSize;
		createLevel();
	}
	
	/**
	 * Main function call to generate the level
	 */
	private function createLevel():Void 
	{
		FlxG.bgColor = 0xff8888ff;
		createMap();
		createPlayer();
		createGUI();
		addGroups();
		createCamera();
	}
	
	/**
	 * Build map components
	 */
	private function createMap():Void 
	{
		tiles = new FlxTilemap();			
		tiles.loadMap(
			FlxTilemap.arrayToCSV(LEVEL, 20), //convert array to tiles
			"assets/tiles.png",
			Std.int(_tileSize.x), //width of tiles
			Std.int(_tileSize.y), //height of tiles
			0, //dont use autotiling
			1, //start index
			0, //start index for drawings
			1 //which tile for collision
		);	
		
		mapGroup.add(tiles);
	}
	
	/**
	 * Setup the player
	 */
	private function createPlayer():Void 
	{
		player = new FlxSprite();
		player.makeGraphic(Std.int(SIZE.x), Std.int(SIZE.y), 0xff888888);
		player.x = 50;
		player.y = 50;
		player.acceleration.y = 300;
		player.drag.x = 200;
		this.add(player);
	}
	
	/**
	 * Build gui... if we are having one???
	 */
	private function createGUI():Void 
	{
	}
	
	/**
	 * Add all groups to the scene
	 */
	private function addGroups():Void 
	{
		this.add(mapGroup);
		this.add(guiGroup);
	}
	
	/**
	 * Create the camera for the game
	 */
	private function createCamera():Void
	{	
		FlxG.worldBounds = new FlxRect(0, 0, _levelSize.x, _levelSize.y);
		FlxG.camera.setBounds(0, 0, _levelSize.x, _levelSize.y, false);
		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
	}
	
	/**
	 * Update the darn thing!
	 */
	override public function update():Void 
	{
		super.update();
		FlxG.collide(mapGroup, player);
		
		if (FlxG.keys.LEFT) {
			player.velocity.x = -100;
		}
		
		if (FlxG.keys.RIGHT) {
			player.velocity.x = 100;
		}
		
		if (player.velocity.y == 0 && FlxG.keys.UP) {
			player.velocity.y = -250;
		}
	}
}