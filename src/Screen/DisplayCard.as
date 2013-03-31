package Screen
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import UI.UIElement;
	
	public class DisplayCard extends UIElement
	{
		public var canvas:Bitmap;
		public var referenceColor:Sprite;
		
		public function DisplayCard()
		{
			super();
			canvas = new Bitmap();
			addChild(canvas);
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
			canvas.width = width;
			canvas.height = height;
		}
		
		public function updateCard(card:Bitmap):void
		{
			// Recycle
			removeChild( canvas )
			canvas = card;
			updateSize( size.width,size.height);
			addChild ( canvas );
		}		
		
	}
}