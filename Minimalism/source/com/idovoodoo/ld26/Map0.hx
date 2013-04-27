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
class Map0 extends BaseLevel
{
	/**
	 * Constructor
	 * @param	levelSize
	 * @param	tileSize
	 */
	public function new(levelSize:FlxPoint, tileSize:FlxPoint) 
	{
		super(levelSize, tileSize);
		_levelSize = levelSize;
		_tileSize = tileSize;
		
	}
	
	/**
	 * Main function call to generate the level
	 */
	override private function createLevel():Void 
	{
		super.createLevel();
		
		FlxG.bgColor = 0xff8888ff;
	}
	
	/**
	 * Build map components
	 */
	override private function createMap():Void 
	{
		super.createMap();
	}
	
	/**
	 * Setup the player
	 */
	override private function createPlayer():Void 
	{
		super.createPlayer();
	}
	
	/**
	 * Build gui... if we are having one???
	 */
	override private function createGUI():Void 
	{
		super.createGUI();
	}
	
	/**
	 * Add all groups to the scene
	 */
	override private function addGroups():Void 
	{
		super.addGroups();
	}
	
	/**
	 * Update the darn thing!
	 */
	override public function update():Void 
	{
		super.update();
	}
}