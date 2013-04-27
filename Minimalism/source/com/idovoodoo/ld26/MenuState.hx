package com.idovoodoo.ld26;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSound;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.system.input.FlxTouch;

class MenuState extends FlxState 
{
	private var music:FlxSound;
	private var startSound:FlxSound;
	
	override public function create():Void 
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.hide();
			
		var txt:FlxText = new FlxText(0, 200, FlxG.width, "The Forgetful Little Square");
		txt.setFormat(null, 16, 0xffffffff, "center");
		this.add(txt);
		
		txt = new FlxText(0, 240, FlxG.width, "A Ludum Dare 26 Game by");
		txt.setFormat(null, 16, 0xffffffff, "center");
		this.add(txt);
		
		txt = new FlxText(0, 280, FlxG.width, "@idovoodoo");
		txt.setFormat(null, 16, 0xff8888ff, "center");
		this.add(txt);
		
		#if (android || ios)
			txt = new FlxText(0, 320, FlxG.width, "TAP TO START");
		#else
			txt = new FlxText(0, 320, FlxG.width, "PRESS SPACE TO START");
		#end
		
		txt.setFormat(null, 8, 0xffffffff, "center");
		this.add(txt);
		
		//setup sound and music
		music = new FlxSound();
		music.loadEmbedded("assets/music.mp3", true);
		music.fadeIn(1);
		startSound = new FlxSound();
		startSound.loadEmbedded("assets/platform-hit2.mp3", false);
	}
	
	private function onFade():Void 
	{
		music.stop();
		FlxG.switchState(new GameState());
	}
	
	private function kbmInput():Void 
	{
		if (FlxG.keys.SPACE) {
			startSound.play();
			FlxG.flash(0xFFFFFFFF, 0.75);
			FlxG.fade(0xff000000, 1, onFade);
		}
	}
	
	private function touchInput():Void {
		var touches:Array<FlxTouch> = FlxG.touchManager.touches;
		var touch:FlxTouch;
 
		for(touch in touches)
		{
			if (touch.pressed())
			{
				// get touch position (relative to screen)
				var px:Int = touch.screenX;
				var py:Int = touch.screenY;
	 
				// get position in world space
				
				var worldX:Float = touch.getWorldPosition().x;
				var worldY:Float = touch.getWorldPosition().y;
				
				FlxG.flash(0xFFFFFFFF, 0.75);
				FlxG.fade(0xff000000, 1, onFade);
			}
		}
	}
	
	override public function update():Void 
	{
		#if (ios || android)
			touchInput();
		#else
			kbmInput();
		#end
		
		super.update();
	}	
	
	override public function destroy():Void 
	{
		super.destroy();
	}
}