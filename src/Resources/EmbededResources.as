package Resources
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class EmbededResources
	{
		[Embed(source = "/Assets/cards/card1.png", mimeType = "image/png")]
		public static const Card1:Class;
		
		[Embed(source = "/Assets/cards/card2.png", mimeType = "image/png")]
		public static const Card2:Class;

		[Embed(source = "/Assets/cards/card3.png", mimeType = "image/png")]
		public static const Card3:Class;
		
		
		public static function getCards(cardName:String) : Bitmap
		{
			var bdImage:BitmapData = new BitmapData( 1024, 1024, false);
			bdImage.draw( new EmbededResources[cardName], null, null, flash.display.BlendMode.LAYER);
			return new Bitmap(bdImage);
/*			var image:Bitmap = new EmbededResources[cardName];
			return image;*/
		}		
		
	}
	
}
