package
{
	import System.String;
    import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.CCScene;
    import cocos2d.CCTMXTiledMap;
    import cocos2d.ScaleMode;
    import UI.Label;
    import Loom.Animation.Tween;
    import Loom.Animation.EaseType;
    import Loom.LoomTextAsset;
    
    import Loom.GameFramework.AnimatedComponent;
    import Loom.GameFramework.LoomComponent;
    import Loom.GameFramework.LoomGroup;
    import Loom.GameFramework.LoomGameObject;

//This class handle reading Tile along with Tileset
//There will be another class that will handle collision detection.
    public class ReadTile extends Cocos2DGame
    {
    	public var last:Number = 0;
    	public var delta:Number = 0;
		public var number = 0;
    	public var map:CCTMXTiledMap;
    	public var pathname:String;
    	public var game:Cocos2DGame;
    	//public var gameLayer:CCLayer;
    	protected var scene:CCScene;
//the menu will pass a path string, and we will load the path accordinly.
    	public function ReadTile(gameInstance:Cocos2DGame, path:String){
    		Console.print("here");
    		layer.scaleMode = ScaleMode.FILL;
    		layer.designWidth = 700;
    		layer.designHeight = 450;
    		var bg = CCSprite.createFromFile("assets/bg.png");
            bg.x = 640;
            bg.y = 240;
            layer.addChild(bg);
    		//load map
    		pathname = path;
    		game = gameInstance;
    		map = CCTMXTiledMap.tiledMapWithTMXFile(path);
    		layer.addChild(map);
    		scene = CCScene.create();
            scene.addChild(this.layer);
    	}
    public function getScene():CCScene
        {
            return scene;
        }
	}
}