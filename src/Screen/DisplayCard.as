package Screen
{
	import flash.display.Sprite;
	
	import UI.UIElement;
	
	import Utils.FormsUtils;

	public class DisplayCard extends UIElement
	{
		public var card:Sprite;
		
		public function DisplayCard()
		{
			super();
			card = new Sprite();
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			card.width = width;
			card.height = height;
			size.width = width;
			size.height = height;
		}
		
		public function updateColor(newColor:uint):void
		{
			// TODO: recycle
			addChild ( FormsUtils.drawRectangle( size.width, size.height, newColor ) );
		}
		
	}
}