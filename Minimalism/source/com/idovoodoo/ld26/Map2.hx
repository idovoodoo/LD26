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
class Map2 extends FlxGroup
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
	private var platSeven:Bool = false;
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
	private var messageText:FlxText;
	private var gameEndTime:Float = 3;
	private var gameEndCounter:Float = 0;
	private var backgroundImage:FlxSprite;
	private var endState:Bool = false;
	
	//map
	private static var LEVEL:Array<Int> = [
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,9,9,9,0,0,0,10,10,10,0,0,0,11,11,11,0,0,0,12,12,12,0,0,0,13,13,13,0,0,0,14,14,14,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,15,15,15,15,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
		//FlxG.bgColor = 0xffffffff;
		createMap();
		createGUI();
		addGroups();
		createPlayer();
		createObjects();
		createCamera();
		
	}
	
	/**
	 * Build map components
	 */
	private function createMap():Void 
	{
		backgroundImage = new FlxSprite(0, 0, "assets/map2-background.png");
		backgroundImage.scrollFactor.x = 0.5;
		mapGroup.add(backgroundImage);
		
		tiles = new FlxTilemap();			
		tiles.loadMap(FlxTilemap.arrayToCSV(LEVEL, 40), // << don't forget to change this!
			"assets/tiles.png", Std.int(_tileSize.x), Std.int(_tileSize.y), 0, 1, 0, 1);
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
		player.y = 160;
		player.acceleration.y = 350;
		player.drag.x = 200;
		//add to scene
		this.add(player);
		FlxG.log("player created");
		createCamera();
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
		potato.x = 200;
		potato.y = 350;
		potato.acceleration.y = 200;
		potato.visible = false;
		//this.add(potato);
		
		//exit
		exitDoor = new FlxSprite();
		exitDoor.loadGraphic("assets/exit-new.png", false, false, 50, 50, true);
		//exitDoor.addAnimation("default", [0, 1], 1, true);
		exitDoor.angularVelocity = -90;
		exitDoor.antialiasing = true;
		exitDoor.x = 1500;
		exitDoor.y = 380 + _tileSize.y - exitDoor.height; 
		//exitDoor.play("default");
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
	 * Build gui
	 */
	private function createGUI():Void 
	{
		timerText = new FlxText(10, 20, FlxG.width, Std.string(Std.int(potatoCounter)));
		timerText.setFormat(null, 24, 0x968888ff, "center");
		timerText.scrollFactor = new FlxPoint(0, 0);
		timerText.visible = false;
		guiGroup.add(timerText);
		
		messageText = new FlxText(10, FlxG.height - 70, FlxG.width - 10, "Just run and jump Little Square.");
		messageText.setFormat(null, 16, 0x968888ff, "center");
		messageText.scrollFactor = new FlxPoint(0, 0);
		guiGroup.add(messageText);
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
			
			//exit back to the main menu
			if (FlxG.keys.ESCAPE) {
				music.stop();
				FlxG.switchState(new MenuState());
			}
			
			//FlxG.log(tileBelow);
			//set map tile types
			switch(tileBelow) {
				case 0:
					hideAllTiles();
				case 9:
					messageText.text = "Just run and jump Little Square.";
					platOne = true;
					potato.visible = true;
				case 10:
					messageText.text = "Keep going.";
					platTwo = true;
				case 11:
					platThree = true;
					messageText.text = "If this was Ludum Dare 25, I would tell you to fall off the end ;)";
				case 12:
					platFour = true;
					messageText.text = "Keep going.";
				case 13:
					platFive = true;
					messageText.text = "Another jump.";
				case 14:
					platSix = true;
					messageText.text = "You know what to do.";
				case 15:
					platSeven = true;
					messageText.text = ":)";
			}
						
			changeCurrentTile(tileBelow);
			
			//check if player has moved out of game area
			if (player.x < 0 || player.x > _levelSize.x || player.y > _levelSize.y) {
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
				messageText.text = "Just have faith and jump.";
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
				messageText.text = "Well done Little Square!";
				exitDoor.exists = false;
				player.exists = false;
				mapGroup.exists = false;
				if (timerText.exists)
					timerText.exists = false;
				explosion.play();
				music.fadeOut(1);
				FlxG.flash(0xFFFFFFFF, 0.75);
				endState = true;
				FlxG.log("end of map2");
			}
		}
		
		if (endState)
		{
			gameEndCounter += FlxG.elapsed;
			if (gameEndCounter >= gameEndTime)
			{
				music.stop();
				GameRegistry.finished = true;
			}
		}
	}
	
	/**
	 * Change the tile index that is underneath the player
	 * @param	value
	 */
	private function changeCurrentTile(value:Int):Void
	{
		if (value == 9 || value == 10 || value == 11 || value == 12 || value == 13 || value == 14 || value == 15) {
			var tileArray:Array<Int> = tiles.getTileInstances(value);
			for (i in tileArray) {
				tiles.setTileByIndex(i, value - 8, true);
			}
		}
		else if (value == 17 || value == 18 || value == 19 || value == 20 || value == 21 || value == 22 || value == 23) {
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
		if (platSeven)
			changeTile(7);
			
		potato.visible = false;
	}
}