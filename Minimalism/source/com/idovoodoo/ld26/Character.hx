package com.idovoodoo.ld26;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxPath;
import org.flixel.FlxPoint;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.FlxTilemap;
import org.flixel.FlxObject;

/**
 * ...
 * @author Idovoodoo
 */

 /**
  * Base class for all characters
  */
class Character extends FlxSprite
{	
	public var RUNSPEED:Int = 150;	
	public var JUMPSPEED:Float = 200;
	public var GRAVITY_ACCELERATION:Float = 450;
	
	/**
	 * Constructor
	 * @param	x
	 * @param	y
	 */
	public function new(x:Int, y:Int) 
	{
		super(x, y);
		maxVelocity = new FlxPoint(RUNSPEED, JUMPSPEED);
		drag = new FlxPoint(RUNSPEED * 4, JUMPSPEED * 4);
		acceleration.y = GRAVITY_ACCELERATION;
		createAnimations();
	}
	
	/**
	 * Update loop
	 */
	override public function update():Void 
	{
		super.update();
		updateControls();
		updateAnimations();
		
	}
	
	/**
	 * Update character animations
	 */
	private function updateAnimations():Void 
	{		
	}
	
	/**
	 * Create character animations
	 */
	private function createAnimations() {
		
	}
	
	/**
	 * Update character controls
	 */
	private function updateControls():Void 
	{
		acceleration.x = 0;
		acceleration.y = GRAVITY_ACCELERATION;
	}
	
	/**
	 * Character jumps
	 */
	public function jump():Void 
	{
		velocity.y -= JUMPSPEED;
	}
	
	/**
	 * Move character left
	 */
	public function moveLeft():Void
	{
		facing = FlxObject.LEFT;
		acceleration.x = -RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
	}
	 
	/**
	 * Move character right
	 */
	public function moveRight():Void {
		facing = FlxObject.RIGHT;
		acceleration.x = RUNSPEED * 4; // accelerate to top speed in 1/4 of a second
	}
	 
	/**
	 * Move character up
	 */
	public function moveUp():Void {
		facing = FlxObject.UP;
		acceleration.y = -RUNSPEED * 2; // accelerate to top speed in 1/4 of a second	
	}
	 
	/**
	 * Move character down
	 */
	public function moveDown():Void {
		facing = FlxObject.DOWN;
		acceleration.y = RUNSPEED * 2; // accelerate to top speed in 1/4 of a second
	}

	
}