package
{
	import System.Void;
	import cocos2d._BMFontDef;
    import UI.Atlas;
    import UI.AtlasSprite;
    import cocos2d.Cocos2D;
    import cocos2d.Cocos2DGame;
    import cocos2d.CCLayer;
    import cocos2d.CCScaledLayer;
    import cocos2d.ScaleMode;
    import cocos2d.CCDirector;
    import cocos2d.CCTMXTiledMap;
    import Loom.Animation.Tween;
    import Loom.Animation.EaseType;
    import UI.Label;

    public class TribeWarrior extends Cocos2DGame
    {
    	public var uiLayer:CCScaledLayer;
    	public var playButton:AtlasSprite;
    	public var loadButton:AtlasSprite;
    	public var aboutButton:AtlasSprite;
    	public var Maploading:ReadTile = null;
    	public var map:CCTMXTiledMap;
        override public function run():void
        {
            //root game run
            super.run();
            //UI atlast
            Atlas.register("UI","assets/");
			aboutButton = new AtlasSprite();
    		loadButton = new AtlasSprite();
    		playButton = new AtlasSprite();
    		
			// Comment out this line to turn off automatic scaling.
            layer.scaleMode = ScaleMode.LETTERBOX;
            
            // Create Mainmenu layer
            uiLayer = new CCScaledLayer();
            uiLayer.scaleMode = ScaleMode.LETTERBOX;
            uiLayer.designWidth = 700;
            uiLayer.designHeight = 450;
            group.registerManager(uiLayer, null, "overlay");
            Cocos2D.addLayer(uiLayer);
            
            //background
            var bg = new AtlasSprite();
            bg.atlasID = "UI";
            bg.texture = "bg";
            bg.x = 240;
            bg.y = 160;
            bg.scale = 0.70;
            layer.addChild(bg);
//label
            var label = new Label("assets/Curse.fnt");
            label.text = "Tribe Warrior";
            label.x = 110;
            label.y = 270;
            label.scale = 0.9;
            label.setRotation(-7);
            layer.addChild(label);
//playButton sprite
            playButton.atlasID = "UI";
            playButton.texture = "Playbutton.png";
            playButton.y = 200;
            playButton.scale = 0.5;
            layer.addChild(playButton);
			playButton.x = -200;
//Load button sprite
            loadButton.atlasID = "UI";
            loadButton.texture = "loadbutton";
            loadButton.y = 140;
            loadButton.scale = 0.5;
            layer.addChild(loadButton);
			loadButton.x = 600;
//About Button sprite		
           	aboutButton.atlasID = "UI";
            aboutButton.texture = "about";
            aboutButton.y = 80;
            aboutButton.scale = 0.5;
            layer.addChild(aboutButton);
			aboutButton.x = -400;

//Animated Button
			Tween.to(playButton, 1, {"x": 260,"ease":EaseType.EASE_OUT_BACK});
			Tween.to(loadButton, 1, {"x": 370,"ease":EaseType.EASE_OUT_BACK, "delay": 0.1});
			Tween.to(aboutButton, 1, {"x": 260,"ease":EaseType.EASE_OUT_BACK,"delay": 0.2});

//make buttons from those sprites
			playButton.onTouchBegan += goToStartGame;
			//loadButton.onTouchBegan += goToLoadGame;
			//aboutButton.onTouchBegan += goToAbout;
            }
//when user hit button all the tween should disappear.
       protected function onAlreadyClick():void
       {
       	Tween.to(playButton,1,{"x":-400,"ease":EaseType.EASE_IN_BACK});
       	Tween.to(loadButton,1,{"x":600,"ease":EaseType.EASE_IN_BACK});
       	Tween.to(aboutButton,1,{"x":-400,"ease":EaseType.EASE_IN_BACK});
       	}
       
       	protected function goToStartGame():void{
       		onAlreadyClick();
       		//don't know if it's necessary to detele the old layer?
       		//layer.removeAllChildrenWithCleanup(true);
       	//Choosing LEVEL class go here.
       	
  		 	//Maploading = new ReadTile(this,"assets/action_map_1.tmx");
  		 	//this method is to replace the whole layer with the tilemap scene
    		//CCDirector.sharedDirector().replaceScene(Maploading.getScene());
       	}
    }
}