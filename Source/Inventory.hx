package;

import openfl.text.TextField;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import openfl.display.Sprite;

enum Weapon{gun;grenade;}
class Inventory
{
    var weapon:Weapon = gun;
    public var panel:Sprite; 
    var gunIndicator:Sprite;
    var gunReload:Sprite;
    var grenadeIndicator:Sprite;
    var grenadeReload:Sprite;
    var indicatorSize = 50.0;

    public function new() 
    {
        panel = new Sprite();
        gunIndicator = new Sprite();
        gunIndicator.graphics.beginFill(0xBBBBBB);
        gunIndicator.graphics.drawRect(0,0,indicatorSize,indicatorSize);
        gunIndicator.graphics.endFill();
        panel.addChild(gunIndicator);
        gunReload = new Sprite();

        grenadeIndicator = new Sprite();
        grenadeIndicator.graphics.beginFill(0xBBBBBB);
        grenadeIndicator.graphics.drawRect(0,0,indicatorSize,indicatorSize);
        grenadeIndicator.graphics.endFill();
        grenadeIndicator.x = 55;
        panel.addChild(grenadeIndicator);
        grenadeReload = new Sprite();

        var textGun = new TextField();
        textGun.text = "GUN";
        textGun.width = 50;
        textGun.height =50;
        textGun.mouseEnabled = false;
        panel.addChild(textGun);
        var textGrenade = new TextField();
        textGrenade.text = "GRE\nNA\nDE";
        textGrenade.width = 50;
        textGrenade.height =50;
        textGrenade.x = 55;
        textGrenade.mouseEnabled = false;
        panel.addChild(textGrenade);

        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
    }

    public function update(player:Player) 
    {
        if(player.get_gunCounter() != 0)
        {
            gunIndicator.addChild(gunReload);
            gunReload.graphics.clear();
            gunReload.graphics.beginFill(0x666666);
            gunReload.graphics.drawRect(0,0,indicatorSize,indicatorSize/(Main.get_FPS()/player.get_rateOfFire())* player.get_gunCounter());
            gunReload.graphics.endFill();
        }
        if(player.get_grenadeCounter() != 0)
        {
            grenadeIndicator.addChild(grenadeReload);
            grenadeReload.graphics.clear();
            grenadeReload.graphics.beginFill(0x666666);
            grenadeReload.graphics.drawRect(0,0,indicatorSize,indicatorSize/(Main.get_FPS()/player.get_rateOfThrow())* player.get_grenadeCounter());
            grenadeReload.graphics.endFill();
        }
        
        panel.graphics.clear();
        if(weapon == gun)
        {
            panel.graphics.lineStyle(4,0xFFFFFF);
            panel.graphics.drawRect(0,0,50,50);
            panel.graphics.endFill();
        }
        else if(weapon == grenade)
        {
            panel.graphics.lineStyle(4,0xFFFFFF);
            panel.graphics.drawRect(55,0,50,50);
            panel.graphics.endFill();
        }
    }
    public function onDown(e:KeyboardEvent) 
    {
        if(e.keyCode == 49)
            weapon = gun;
        else if(e.keyCode == 50)
            weapon = grenade;
    }
    public function get_weapon() 
    {
        return weapon;    
    }
}