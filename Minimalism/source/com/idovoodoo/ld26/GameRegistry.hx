package com.idovoodoo.ld26;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxGroup;
import org.flixel.FlxPoint;

/**
 * ...
 * @author Idovoodoo
 */

class GameRegistry 
{
	public static var mapGroup:FlxGroup;
	public static var guiGroup:FlxGroup;

	public static function init() {
		mapGroup = new FlxGroup();
		guiGroup = new FlxGroup();
	}
	
}