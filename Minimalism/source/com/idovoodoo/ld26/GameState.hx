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
	public static var TILE_SIZE:FlxPoint = new FlxPoint(40, 10);
	public static var LEVEL:FlxGroup = null;

	override public function create():Void 
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.hide();
		
		super.create();
		LEVEL = new Map0(LEVEL_SIZE, TILE_SIZE);
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