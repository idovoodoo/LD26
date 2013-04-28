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
	public static var LEVEL0:Map0 = null;
	public static var LEVEL1:Map1 = null;

	override public function create():Void 
	{
		#if !neko
		FlxG.bgColor = 0xffffffff;
		#else
		FlxG.camera.bgColor = {rgb: 0xffffff, a: 0xff};
		#end		
		FlxG.mouse.hide();
		
		super.create();
		GameRegistry.init();
		GameRegistry.level = 0;
		//LEVEL0 = new Map0(LEVEL_SIZE, TILE_SIZE);
		LEVEL1 = new Map1(new FlxPoint(1200, 480), TILE_SIZE);
		//this.add(LEVEL0);
		this.add(LEVEL1);
	}
	
	override public function destroy():Void 
	{
		super.destroy();
	}

	override public function update():Void 
	{
		super.update();
		if (GameRegistry.finished) {
			if (GameRegistry.level == 0) { // level 0 (map0) has finished!		
				FlxG.log("on to map1");
				GameRegistry.level = 1;
				GameRegistry.finished = false;
				LEVEL0.exists = false;
				LEVEL1 = new Map1(new FlxPoint(1200, 480), TILE_SIZE);
				this.add(LEVEL1);
			}
		}
		
	}	
	
}