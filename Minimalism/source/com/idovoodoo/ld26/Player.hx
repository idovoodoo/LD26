package com.idovoodoo.ld26;

import org.flixel.FlxPoint;
import org.flixel.FlxSprite;
import org.flixel.FlxG;

/**
 * ...
 * @author Idovoodoo
 */
class Player extends Character
{
	private static var SIZE:FlxPoint = new FlxPoint(10, 10);
	private var _playerStart:FlxPoint;
	private var jumping:Bool = false;
	
	public function new(x:Int, y:Int) 
	{	
		_playerStart = new FlxPoint(x, y);
		makeGraphic(Std.int(SIZE.x), Std.int(SIZE.y), 0xFFFF0000);
		
		super(x, y);
	}
	
	override private function updateControls():Void 
	{
		super.updateControls();
		
		/**var movement:FlxPoint = new FlxPoint();
		if (FlxG.keys.pressed("A")){
			movement.x -= 1;
		}
		if (FlxG.keys.pressed("D")){
			movement.x += 1;
		}

		if (!jumping && velocity.y == 0 && FlxG.keys.pressed("SPACE"))
			jumping = true;
		else
			jumping = false;
			
		// check final movement direction
		if (movement.x < 0)
			moveLeft();
		else if (movement.x > 0)
			moveRight();			
						
		if (jumping) {
			jump();
		}**/
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
}