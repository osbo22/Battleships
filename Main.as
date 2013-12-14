 package 
{
	import flash.accessibility.ISearchableText;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.engine.FontLookup;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import Tile;
	
	/**
	 * ...
	 * @author Oskar Bohlin
	 */
	public class Main extends Sprite 
	{
		public var map:Vector.<Vector.<Sprite>> = new Vector.<Vector.<Sprite>>();
		public static var missScore:int = new int(0);
		public static var hitScore:int = new int(0);
		public static var mScoreText:TextField = new TextField();
		public static var hScoreText:TextField = new TextField();
		public static var mainFont:TextFormat = new TextFormat();
		public var shipX:int;
		public var shipY:int;
		public static  var checkIfShip:Boolean = false;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			missScore = 0;
			hitScore = 0;   
			mainFont.font = "Segoe UI";
			mainFont.size = 25;
			
			mScoreText.x = 560;
			mScoreText.y = 200;
			mScoreText.width = 300;
			mScoreText.height = 100;
			mScoreText.defaultTextFormat = mainFont;
			mScoreText.text = "Misses:";
			
			hScoreText.x = 560;
			hScoreText.y = 250;
			hScoreText.width = 300;
			hScoreText.height = 100;
			hScoreText.defaultTextFormat = mainFont;
			hScoreText.text = "Hits: ";
			addChild(mScoreText);
			addChild(hScoreText);
			
			mapCreator();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, tileSpawner);
		}
		
		private function createShip():void {
			shipX = Math.random() * 9;
			shipY = Math.random() * 9;
			map[shipX][shipY].checkIfShip = true;
			
		}
		
		public function mapCreator():void {
			
			for (var i:int = 0; i < 10; i++) {
				
				var oneRow:Vector.<Sprite> = new Vector.<Sprite>();
				for (var j:int = 0; j < 10; j++) {
					
					var mapTile:Tile = new Tile(i,j);
					addChild(mapTile);
					oneRow.push(mapTile);
				}
				map.push(oneRow);	
			}
			
			createShip();
		}
		private function tileSpawner(key:KeyboardEvent):void {
			if (key.keyCode == 32) {
				reMap();
				
			
			}
		}
		
		private function reMap():void {
			for (var y:int = 0; map.length > y; y++) {
				
				for (var x:int = 0; map.length > x; x++) {
					removeChild(map[y][x]);
				}
			}
			map.length = 0;
			mScoreText.text = "Misses: ";
			hScoreText.text = "Hits: ";
			missScore = 0;
			hitScore = 0;
			mapCreator();
		}
		
	
		
		
	}
	
}