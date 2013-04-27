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
		
		//player movement > TODO: move to player class
		if (FlxG.keys.LEFT) {
			player.velocity.x = -100;
			//FlxG.log("x: " + player.x + " y: " + player.y);
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
		FlxG.log(tileBelow);
		
		switch(tileBelow) {
			case 0:
				hideAllTiles();
			case 9:
				var tileArray:Array<Int> = tiles.getTileInstances(9);
				for (i in tileArray) {
					tiles.setTileByIndex(i, 1, true);
				}
			case 10:
				var tileArray:Array<Int> = tiles.getTileInstances(10);
				for (i in tileArray) {
					tiles.setTileByIndex(i, 2, true);
				}
			case 11:
				var tileArray:Array<Int> = tiles.getTileInstances(11);
				for (i in tileArray) {
					tiles.setTileByIndex(i, 3, true);
				}
			case 12:
				var tileArray:Array<Int> = tiles.getTileInstances(12);
				for (i in tileArray) {
					tiles.setTileByIndex(i, 4, true);
				}
			case 13:
				var tileArray:Array<Int> = tiles.getTileInstances(13);
				for (i in tileArray) {
					tiles.setTileByIndex(i, 5, true);
				}
			case 14:
				var tileArray:Array<Int> = tiles.getTileInstances(14);
				for (i in tileArray) {
					tiles.setTileByIndex(i, 6, true);
				}
		}
		
	}
	
	/**
	 * Hides all the map tiles
	 */
	private function hideAllTiles():Void {
		if(tiles.getTileInstances(1) != null){
			var tileArray:Array<Int> = tiles.getTileInstances(1);
			for (i in tileArray) {
				tiles.setTileByIndex(i, 9, true);
			}
		}
		if(tiles.getTileInstances(2) != null){
			var tileArray:Array<Int> = tiles.getTileInstances(2);
			for (i in tileArray) {
				tiles.setTileByIndex(i, 10, true);
			}
		}
		if(tiles.getTileInstances(3) != null){
			var tileArray:Array<Int> = tiles.getTileInstances(3);
			for (i in tileArray) {
				tiles.setTileByIndex(i, 11, true);
			}
		}
		if(tiles.getTileInstances(4) != null){
			var tileArray:Array<Int> = tiles.getTileInstances(4);
			for (i in tileArray) {
				tiles.setTileByIndex(i, 12, true);
			}
		}
		if(tiles.getTileInstances(5) != null){
			var tileArray:Array<Int> = tiles.getTileInstances(5);
			for (i in tileArray) {
				tiles.setTileByIndex(i, 13, true);
			}
		}
		if(tiles.getTileInstances(6) != null){
			var tileArray:Array<Int> = tiles.getTileInstances(6);
			for (i in tileArray) {
				tiles.setTileByIndex(i, 14, true);
			}
		}
	}
}