package com.idovoodoo.ld26;

import org.flixel.FlxGroup;
import org.flixel.FlxPoint;
import org.flixel.FlxRect;
import org.flixel.FlxState;
import org.flixel.FlxG;
import org.flixel.FlxCamera;

/**
 * ...
 * @author Idovoodoo
 */
class BaseLevel extends FlxGroup
{
	private var state:FlxState;
	private var numTiles:FlxPoint;
	private var mapGroup:FlxGroup;
	private var guiGroup:FlxGroup;
	private var _playerStart:FlxPoint;
	private var _levelSize:FlxPoint;
	private var _tileSize:FlxPoint;
	
	public function new(levelSize:FlxPoint, tileSize:FlxPoint) 
	{
		super();
		_levelSize = levelSize;
		_tileSize = tileSize;
		createLevel();		
	}
	
	private function createLevel():Void
	{
		createMap();
		createPlayer();
		createGUI();
		addGroups();
		createCamera();
	}
	
	private function createMap():Void
	{
	}
	
	private function createPlayer():Void
	{
	}
	
	private function createGUI():Void
	{
	}
	
	private function addGroups(): Void
	{
		this.add(mapGroup);
		this.add(guiGroup);	
	}
	
	private function createCamera():Void
	{	
		FlxG.worldBounds = new FlxRect(0, 0, _levelSize.x, _levelSize.y);
		FlxG.camera.setBounds(0, 0, _levelSize.x, _levelSize.y, false);
		//FlxG.camera.follow(GameRegistry.player, FlxCamera.STYLE_PLATFORMER);
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
}