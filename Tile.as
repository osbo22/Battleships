package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import Main;
	
	/**
	 * ...
	 * @author osbo22
	 */
	public class Tile extends Sprite {
		public static const TILESIZE:int = 40;
		[Embed(source = "../lib/hit.png")] public static const HITTILE:Class;
		[Embed(source = "../lib/miss.png")]	public static const MISSTILE:Class;
		[Embed(source = "../lib/water.png")] public static const WATERTILE:Class;
		public var checkIfShip:Boolean = false;
		
		//This function creates generell setings fot the tile that is used in the mapCreator function in the main class.
		public function Tile(i:int, j:int){
			
			var water:Bitmap = new WATERTILE();
			this.addChild(water);
			this.buttonMode = true;
			this.checkIfShip = false;
			this.x = 100 + j * (this.width +5);
			this.y = 100 + i * (this.height +5);
			this.addEventListener(MouseEvent.CLICK, tileClick);		
		}
		//The functoin is there to handle what happens if you click on the tile on the map.
		//Also to handle which of the tiles that are clicked and checks if it is a ship or just water.
		public function tileClick(e:MouseEvent):void{
			if (this.buttonMode == true) {
				if ( checkIfShip == false) {
					
				var miss:Bitmap = new MISSTILE();
				addChild(miss);
				Main.missScore += 1;	
				Main.mScoreText.text = "Misses: " + String(Main.missScore); 
				this.buttonMode = false;
				}
				else if (checkIfShip == true) {
					var hit:Bitmap = new HITTILE();
					addChild(hit);
					Main.hitScore += 1;
					Main.hScoreText.text = "Hits: " + String(Main.hitScore);
					this.buttonMode = false;
				}
			}
		}
		
	}

}