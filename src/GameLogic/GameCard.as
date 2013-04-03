package GameLogic
{
	import flash.display.Bitmap;
	
	import UI.CustomTwoStateButton;

	public class GameCard
	{
		public var id:String;
		public var image:Bitmap;
		public var color:uint;
		public var button:CustomTwoStateButton;
		
		public function GameCard( id:String, image:Bitmap, color:uint, button:CustomTwoStateButton=null)
		{
			this.id = id;
			this.image = image;
			this.color = color;
			this.button = button;
		}
		
	}
}