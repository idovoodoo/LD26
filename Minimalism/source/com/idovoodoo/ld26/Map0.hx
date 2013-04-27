package com.idovoodoo.ld26;

import org.flixel.FlxEmitter;
import org.flixel.FlxGroup;
import org.flixel.FlxParticle;
import org.flixel.FlxPoint;
import org.flixel.FlxRect;
import org.flixel.FlxSound;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxG;
import org.flixel.FlxCamera;
import org.flixel.FlxText;
import org.flixel.FlxTilemap;
import org.flixel.FlxTimer;

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
	private var exitDoor:FlxSprite;
	private var exitReached:Bool = false;
	private var pEmitter:FlxEmitter;
	private var particle:FlxParticle;
	private var music:FlxSound;
	private var platformHit:FlxSound;
	private var explosion:FlxSound;
	private var previousPlat:Int = 0;
	private var hitSoundPlayed:Bool = false;
	private var potatoTime:Float = 10;
	private var potatoCounter:Float = 0;
	private static var SIZE:FlxPoint = new FlxPoint(10, 10);
	private var timerText:FlxText;
	
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
		FlxG.bgColor = 0xffffffff;
		createMap();
		createPlayer();
		createObjects();
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
		player.makeGraphic(Std.int(SIZE.x), Std.int(SIZE.y), 0xff8888ff);
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
	private function createObjects():Void
	{
		//setup sound and music
		music = new FlxSound();
		music.loadEmbedded("assets/music.mp3", true);
		music.fadeIn(1);
		platformHit = new FlxSound();
		platformHit.loadEmbedded("assets/platform-hit2.mp3", false);
		explosion = new FlxSound();
		explosion.loadEmbedded("assets/explode.mp3", false);
		
		//potato pickup
		potato = new FlxSprite();
		potato.loadGraphic("assets/potato-4.png", false, false, 15, 15, true);
		potato.x = 400;
		potato.y = 250;
		potato.acceleration.y = 200;
		potato.visible = false;
		this.add(potato);
		
		//exit
		exitDoor = new FlxSprite();
		exitDoor.loadGraphic("assets/exit.png", true, false, 50, 50, true);
		exitDoor.addAnimation("default", [0, 1], 1, true);
		exitDoor.x = 700;
		exitDoor.y = 70 + _tileSize.y - exitDoor.height; 
		exitDoor.play("default");
		this.add(exitDoor);
		
		//setup particle emitter for collisions
		pEmitter = new FlxEmitter();
		pEmitter.setRotation(0, 0);
		pEmitter.makeParticles("assets/particles.png", 1200, 0, true, 0);
		add(pEmitter);
	}
	
	private function explode(x:Float = 0, y:Float = 0):Void
	{			
		pEmitter.x = x;
		pEmitter.y = y;
		pEmitter.start(true, 2, 0, 400);
		pEmitter.update();
	}
	
	/**
	 * Build gui... if we are having one???
	 */
	private function createGUI():Void 
	{
		timerText = new FlxText(10, 10, FlxG.width, Std.string(Std.int(potatoCounter)));
		timerText.setFormat(null, 32, 0x968888ff, "center");
		timerText.scrollFactor = new FlxPoint(0, 0);
		timerText.visible = false;
		guiGroup.add(timerText);
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
		if (!exitReached) {
			//check which tile player is on
			var center:FlxPoint = player.getMidpoint();
			var tileBelow:Int = tiles.getTile(Std.int(center.x / _tileSize.x), Std.int((center.y + (player.height / 2)) / _tileSize.y));
				
			//player and platform collisions
			if (FlxG.collide(mapGroup, player)) {
				if (!hitSoundPlayed) {
					previousPlat = tileBelow;
					platformHit.play();
					hitSoundPlayed = true;
				}
				else {
					if (previousPlat != tileBelow)
						hitSoundPlayed = false;
				}
			}
			
			//potato and platform collisions
			FlxG.collide(mapGroup, potato);
		
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
		
			//FlxG.log(tileBelow);
			//set map tile types
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
			
			//check if player has moved out of game area
			if (player.x < 0 || player.x > FlxG.width) {
				//silly player has fallen off, tsk
				//TODO: play noise
				createPlayer();
			}
			
			
			//check for potato collision
			if (FlxG.collide(player, potato))
			{
				potatoFound = true;
				explode(potato.getMidpoint().x, potato.getMidpoint().y);				
				potato.exists = false;
				explosion.play();
			}
			
			//set timer for potato counter
			if (potatoFound) {
				potatoCounter += FlxG.elapsed;
				timerText.visible = true;
				var timeLeft:Float = potatoTime - potatoCounter;
				timerText.text = Std.string(Std.int(timeLeft));
				if (potatoCounter >= potatoTime)
				{
					potatoFound = false;
					timerText.visible = false;
				}
			}
			
			//check for exit collision
			if (FlxG.collide(player, exitDoor))
			{
				exitReached = true;
				explode(exitDoor.getMidpoint().x, exitDoor.getMidpoint().y);
				exitDoor.exists = false;
				player.exists = false;
				mapGroup.exists = false;
				explosion.play();
				music.fadeOut(1);
			}
		}
	}
	
	/**
	 * Change the tile index that is underneath the player
	 * @param	value
	 */
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
	 * Hides all of the map tiles
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