package GameLogic
{
	import flash.display.Bitmap;

	public class GameCard
	{
		public var id:String;
		public var image:Bitmap;
		public var color:uint;		
		
		public function GameCard( id:String, image:Bitmap, color:uint )
		{
			this.id = id;
			this.image = image;
			this.color = color;			
		}
		
	}
}