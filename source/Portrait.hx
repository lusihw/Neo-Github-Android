package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;

using StringTools;

class Portrait extends FlxSprite
{

    private var refx:Float;
    private var refy:Float;

    private var resize = 0.35;

    private var characters:Array<String> = ["bf", "gf", "dad", "spooky", "monster", "pico"];

    var posTween:FlxTween;
    var alphaTween:FlxTween;
	
    public function new(_x:Float, _y:Float, _character:String){

        super(_x, _y);

        defineCharacter(_character);
      //  setGraphicSize(Std.int(width * resize));
        //updateHitbox();
        scrollFactor.set();
        antialiasing = true;

        refx = x;
        refy = y + height;

        playFrame();
        posTween = FlxTween.tween(this, {x: x}, 0.1);
        alphaTween = FlxTween.tween(this, {alpha: alpha}, 0.1);
        hide();

    }

    function defineCharacter(_character){

        _character = characters.contains(_character) ? _character : "bf";
        frames = Paths.getSparrowAtlas("portrait/" + _character, "dialogue");

        switch(_character){

            case "noChar":
                addAnim("default", "noChar instance 1");
            case "bf":
                addAnim('happy','Neo bf happy');
                addAnim('grimace','Neo bf grimace');
                addAnim('sweat','Neo bf sweat');
                addAnim('angry','Neo bf angry');
                addAnim('confused','Neo bf angy');
                animation.play("happy");
                //resize = 0.4;
            case "gf":
                addAnim("happy", "Neo gf happy");
                addAnim("sad", "Neo gf sad");
                addAnim("blush", "Neo gf blush");
                animation.play("happy");
            case "dad":
                addAnim("point", "Neo dad point");
                addAnim("fist", "Neo dad fist");
                addAnim("unhappy", "Neo dad unhappy");
                addAnim("smirk", "Neo dad smirk");
                animation.play("default");
            case "spooky":
                addAnim("default", "skump default.png");
                addAnim("happy", "skump happy.png");
                addAnim("sad", "skump sad.png");
                animation.play("default");
            case "monster":
                addAnim("default", "monster default.png");
                addAnim("laugh", "monster laugh.png");
                addAnim("smile", "monster smile.png");
                addAnim("glare", "monster glare.png");
                animation.play("default");
            case "pico":
                addAnim("default", "pico default.png");
                addAnim("angry", "pico angry.png");
                addAnim("blush", "pico blush.png");
                addAnim("choke", "pico choke.png");
                addAnim("disappearing", "pico disappearing.png");
                addAnim("furious2", "pico furious 2.png");
                addAnim("furious", "pico furious.png");
                addAnim("gloom", "pico gloom.png");
                addAnim("grimace", "pico grimace.png");
                addAnim("happy", "pico happy.png");
                addAnim("bruh", "pico bruh.png");
                addAnim("scoff", "pico scoff.png");
                addAnim("shout", "pico shout.png");
                addAnim("smile", "pico smile.png");
                animation.play("default");
            
        }

     

    }
    
    function addAnim(anim:String, prefix:String){
        animation.addByPrefix(anim,prefix, 0, false);
    }    

    public function playFrame(?_frame:String = "default"){

        visible = true;

        animation.play(_frame);
        flipX = false;
        updateHitbox();

        x = refx;
        y = refy - height;

    }

    public function hide(){

        alphaTween.cancel();
        posTween.cancel();
        alpha = 1;
        visible = false;

    }

    public function effectFadeOut(?time:Float = 1){

        alphaTween.cancel();
        alpha = 1;
        alphaTween = FlxTween.tween(this, {alpha: 0}, time);

    }

    public function effectFadeIn(?time:Float = 1){

        alphaTween.cancel();
        alpha = 0;
        alphaTween = FlxTween.tween(this, {alpha: 1}, time);

    }

    public function effectExitStageLeft(?time:Float = 1){

        posTween.cancel();
        posTween = FlxTween.tween(this, {x: 0 - width}, time, {ease: FlxEase.circIn});

    }

    public function effectExitStageRight(?time:Float = 1){

        posTween.cancel();
        posTween = FlxTween.tween(this, {x: FlxG.width}, time, {ease: FlxEase.circIn});

    }

    public function effectFlipRight(){

        x = FlxG.width - refx - width;
        y = refy - height;

    }

    public function effectFlipDirection(){
        
        flipX = true;

    }

    public function effectEnterStageLeft(?time:Float = 1){
        
        posTween.cancel();
        var finalX = x;
        x = 0 - width;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.circOut});

    }

    public function effectEnterStageRight(?time:Float = 1){
        
        posTween.cancel();
        var finalX = x;
        x = FlxG.width;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.circOut});
    }

    public function effectToRight(?time:Float = 1){
        
        posTween.cancel();
        var finalX = FlxG.width - refx - width;
        x = refx;
        y = refy - height;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.quintOut});
    }

    public function effectToLeft(?time:Float = 1){
        
        posTween.cancel();
        var finalX = refx;
        x = FlxG.width - refx - width;
        y = refy - height;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.quintOut});
    }

   
}