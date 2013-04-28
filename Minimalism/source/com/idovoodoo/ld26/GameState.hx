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
	public static var LEVEL2:Map2 = null;
	public static var LEVEL3:Map3 = null;
	public static var LEVEL4:Map4 = null;
	public static var LEVEL5:Map5 = null;

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
		LEVEL0 = new Map0(LEVEL_SIZE, TILE_SIZE);
		this.add(LEVEL0);
		//LEVEL4 = new Map4(new FlxPoint(1600, 480), TILE_SIZE);
		//this.add(LEVEL4);
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
			else if (GameRegistry.level == 1) { // level 1 (map1) has finished!		
				FlxG.log("on to map2");
				GameRegistry.level = 2;
				GameRegistry.finished = false;
				LEVEL1.exists = false;
				LEVEL2 = new Map2(new FlxPoint(1600, 480), TILE_SIZE);
				this.add(LEVEL2);
			}
			else if (GameRegistry.level == 2) { // level 2 (map2) has finished!		
				FlxG.log("on to map3");
				GameRegistry.level = 3;
				GameRegistry.finished = false;
				LEVEL2.exists = false;
				LEVEL3 = new Map3(new FlxPoint(1600, 480), TILE_SIZE);
				this.add(LEVEL3);
			}
			else if (GameRegistry.level == 3) { // level 3 (map3) has finished!		
				FlxG.log("on to map4");
				GameRegistry.level = 4;
				GameRegistry.finished = false;
				LEVEL3.exists = false;
				LEVEL4 = new Map4(new FlxPoint(1600, 480), TILE_SIZE);
				this.add(LEVEL4);
			}
			else if (GameRegistry.level == 4) { // level 4 (map4) has finished!		
				FlxG.log("on to map5");
				GameRegistry.level = 5;
				GameRegistry.finished = false;
				LEVEL4.exists = false;
				LEVEL5 = new Map5(new FlxPoint(1600, 480), TILE_SIZE);
				this.add(LEVEL5);
			}
		}
		
	}	
	
}