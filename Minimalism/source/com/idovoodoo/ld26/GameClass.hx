package com.idovoodoo.ld26;

import nme.Lib;
import org.flixel.FlxGame;
	
class GameClass extends FlxGame 
{
	
	public function new() 
	{
		super(640, 480, MenuState, 1, 30, 30);
		forceDebugger = true;
	}
}
