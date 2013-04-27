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
	//TODO: move into platform class
	private var platOne:Bool = false;
	private var platTwo:Bool = false;
	private var platThree:Bool = false;
	private var platFour:Bool = false;
	private var platFive:Bool = false;
	private var platSix:Bool = false;
	private var potato:FlxSprite;
	private var potatoFound:Bool = false;
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
		0,0,0,0,0,0,0,0,0,0,0,14,14,14,14,14,14,14,14,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,13,13,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,11,11,11,11,0,0,0,0,0,0,0,0,12,12,12,12,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,10,10,10,10,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,
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
		createPickups();
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
		//tiles.setTileByIndex(1, 6, true);
		
		mapGroup.add(tiles);
		FlxG.log("map created");
	}
	
	/**
	 * Setup the player
	 */
	private function createPlayer():Void 
	{
		//TODO: move to player class
		player = new FlxSprite();
		player.makeGraphic(Std.int(SIZE.x), Std.int(SIZE.y), 0xffffffff);
		//spawn position and player properties
		player.x = 50;
		player.y = 350;
		player.acceleration.y = 350;
		player.drag.x = 200;
		//add to scene
		this.add(player);
		FlxG.log("player created");
	}
	
	/**
	 * Setup any pickups
	 */
	private function createPickups():Void
	{
		potato = new FlxSprite();
		potato.loadGraphic("assets/potato.png", false, false, 30, 39, true);
		potato.x = 400;
		potato.y = 250;
		potato.acceleration.y = 200;
		potato.visible = false;
		this.add(potato);
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
		FlxG.collide(mapGroup, potato);
		
		//player movement > TODO: move to player class
		if (FlxG.keys.LEFT) {
			player.velocity.x = -100;
			FlxG.log("x: " + player.x + " y: " + player.y);
		}
		if (FlxG.keys.RIGHT) {
			player.velocity.x = 100;
			//FlxG.log("x: " + player.x + " y: " + player.y);
		}
		if (player.velocity.y == 0 && FlxG.keys.UP) {
			player.velocity.y = -275;
			//FlxG.log("x: " + player.x + " y: " + player.y);
		}
		
		//check which tile player is on
		var center:FlxPoint = player.getMidpoint();
		var tileBelow:Int = tiles.getTile(Std.int(center.x / _tileSize.x), Std.int((center.y + (player.height / 2)) / _tileSize.y));
		//FlxG.log(tileBelow);
		
		//TODO: REFACTOR!!!!!!!!
		switch(tileBelow) {
			case 0:
				hideAllTiles();
			case 9:
				platOne = true;
			case 10:
				platTwo = true;
				potato.visible = true;
			case 11:
				platThree = true;
			case 12:
				platFour = true;
			case 13:
				platFive = true;
			case 14:
				platSix = true;
		}
		
		changeCurrentTile(tileBelow);
		
		//check for potato collision
		if (FlxG.collide(player, potato))
		{
			potato.exists = false;
			potatoFound = true;
		}
	}
	
	private function changeCurrentTile(value:Int):Void
	{
		if (value == 9 || value == 10 || value == 11 || value == 12 || value == 13 || value == 14) {
			var tileArray:Array<Int> = tiles.getTileInstances(value);
			for (i in tileArray) {
				tiles.setTileByIndex(i, value - 8, true);
			}
		}
		else if (value == 17 || value == 18 || value == 19 || value == 20 || value == 21 || value == 22) {
			var tileArray:Array<Int> = tiles.getTileInstances(value);
			for (i in tileArray) {
				tiles.setTileByIndex(i, value - 16, true);
			}
		}
		
		
	}
	
	/**
	 * Change a map tile based on if you found the potato or not
	 * @param	value
	 */
	private function changeTile(value:Int):Void 
	{
		if(tiles.getTileInstances(value) != null){
			var tileArray:Array<Int> = tiles.getTileInstances(value);
			for (i in tileArray) {
				if(potatoFound)
					tiles.setTileByIndex(i, 16 + value, true);
				else
					tiles.setTileByIndex(i, 8 + value, true);
			}
		}
	}
	
	/**
	 * Hides all the map tiles
	 */
	private function hideAllTiles():Void 
	{
		if (platOne)
			changeTile(1);
		if (platTwo)
			changeTile(2);
		if (platThree)
			changeTile(3);
		if (platFour)
			changeTile(4);
		if (platFive)
			changeTile(5);
		if (platSix)
			changeTile(6);
			
		potato.visible = false;
	}
}