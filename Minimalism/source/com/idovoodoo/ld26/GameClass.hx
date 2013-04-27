package com.idovoodoo.ld26;

import nme.Lib;
import org.flixel.FlxGame;
	
class GameClass extends FlxGame 
{
	
	public function new() 
	{
		super(800, 480, GameState, 1, 30, 30);
	}
}
