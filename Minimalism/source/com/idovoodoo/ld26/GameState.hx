package com.idovoodoo.ld26;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxPoint;
import org.flixel.FlxU;

/**
 * ...
 * @author Idovoodoo
 */
class GameState extends FlxState
{
	public static var LEVEL_SIZE:FlxPoint = new FlxPoint(800, 480);	
	public static var BLOCK_SIZE:FlxPoint = new FlxPoint(40, 10);
	public static var LEVEL:FlxGroup = null;

	override public function create():Void 
	{
		super.create();
		LEVEL = new Map0(LEVEL_SIZE, BLOCK_SIZE);
		this.add(LEVEL);
	}
	
	override public function destroy():Void 
	{
		super.destroy();
	}

	override public function update():Void 
	{
		super.update();
	}	
	
}