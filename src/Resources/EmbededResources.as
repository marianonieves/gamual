package Resources
{
	import flash.display.Sprite;
	
	public class EmbededResources extends Sprite
	{
		[Embed(source = "/Assets/cards/card1.png", mimeType = "image/png")]
		public static const card1:Class;
		
		[Embed(source = "/Assets/cards/card2.png", mimeType = "image/png")]
		public static const card2:Class;

		[Embed(source = "/Assets/cards/card3.png", mimeType = "image/png")]
		public static const card3:Class;
	}
}