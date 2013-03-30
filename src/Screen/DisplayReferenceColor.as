package Screen
{
	import flash.display.Sprite;
	
	import UI.UIElement;
	
	import Utils.FormsUtils;

	public class DisplayReferenceColor extends UIElement
	{
		private var canvas:Sprite;
		
		public function DisplayReferenceColor()
		{
			super();
			canvas = new Sprite();
			canvas.cacheAsBitmap = true;
			addChild(canvas);
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
		}
		
		public function updateColor(newColor:uint):void
		{
			// Recycle
			removeChild( canvas )
			canvas = FormsUtils.drawRectangle( size.width, size.height, newColor );
			addChild ( canvas );
		}
		
	}
}