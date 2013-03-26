package Screen
{
	import flash.display.Bitmap;
	import UI.UIElement;	
	import Utils.FormsUtils;

	public class DisplayCard extends UIElement
	{
		public var card:Bitmap;
		
		public function DisplayCard()
		{
			super();
			card = new Bitmap();
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
			card.width = width;
			card.height = height;
		}
		
		public function updateColor(newColor:uint):void
		{
			// TODO: recycle
			addChild ( FormsUtils.drawRectangle( size.width, size.height, newColor ) );
		}
		
	}
}