package Screen
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import UI.Docker;
	import UI.UIElement;
	
	public class DisplayCard extends UIElement
	{
		public var canvas:Bitmap;
		public var referenceColor:Sprite;
		public var displayReferenceColor:DisplayReferenceColor;
		
		public function DisplayCard()
		{
			super();
			
			displayReferenceColor = new DisplayReferenceColor();
			addChild( displayReferenceColor );
				
			canvas = new Bitmap();
			addChild(canvas);
		}
		
		public function updateCard(card:Bitmap):void
		{
			// Recycle
			removeChild( canvas )
			canvas = card;
			updateSize( size.height / Config.stageRatio, size.height );
			addChild ( canvas );
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
			canvas.width = width;
			canvas.height = height;
			displayReferenceColor.updateSize( size.width, size.height );
			
			updatePositionByAlign();
		}		
		
	}
}