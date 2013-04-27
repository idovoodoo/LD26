package com.idovoodoo.ld26;

import org.flixel.FlxPoint;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Idovoodoo
 */
class Player extends Character
{
	private static var SIZE:FlxPoint = new FlxPoint(10, 10);
	private var _playerStart:FlxPoint;
	
	public function new(playerStart:FlxPoint) 
	{
		
		_playerStart = playerStart;
		makeGraphic(Std.int(SIZE.x), Std.int(SIZE.y), 0xffffffff);
		
		super(_playerStart);
	}
	
	override private function updateControls():Void 
	{
		super.updateControls();
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
}