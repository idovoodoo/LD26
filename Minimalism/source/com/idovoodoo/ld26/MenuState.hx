package com.idovoodoo.ld26;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxPoint;
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
	private var logo:FlxSprite;
	
	override public function create():Void 
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.hide();
			
		
		
		var txt:FlxText = new FlxText(0, 100, FlxG.width, "The Forgetful Little Square");
		txt.setFormat(null, 28, 0xffff0000, "center");
		this.add(txt);
		
		txt = new FlxText(0, 140, FlxG.width, "By Idovoodoo");
		txt.setFormat(null, 16, 0xff8888ff, "center");
		this.add(txt);
		
		txt = new FlxText(0, 290, FlxG.width, "USE CURSOR KEYS TO PLAY");
		txt.setFormat(null, 12, 0xffffffff, "center");
		this.add(txt);
		
		#if (android || ios)
			txt = new FlxText(0, 320, FlxG.width, "TAP TO START");
		#else
			txt = new FlxText(0, 320, FlxG.width, "PRESS SPACE TO START");
		#end
		
		txt.setFormat(null, 12, 0xffffffff, "center");
		this.add(txt);
		
		txt = new FlxText(0, 380, FlxG.width, "A Game Created in 48 Hours for Ludum Dare 26: Minimalism");
		txt.setFormat(null, 10, 0xffffffff, "center");
		this.add(txt);
		
		txt = new FlxText(0, 400, FlxG.width, "Music and audio created using WolframTones and FXR.");
		txt.setFormat(null, 10, 0xffffffff, "center");
		this.add(txt);
		
		txt = new FlxText(0, 420, FlxG.width, "Twitter: @idovoodoo");
		txt.setFormat(null, 10, 0xff8888ff, "center");
		this.add(txt);
		
		logo = new FlxSprite((FlxG.width / 2) - 128, 80, "assets/logo.png");
		logo.scale = new FlxPoint(0.3, 0.3);
		this.add(logo);
		
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