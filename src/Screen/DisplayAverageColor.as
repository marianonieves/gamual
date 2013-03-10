package Screen
{
	import Utils.FormsUtils;

	public class DisplayAverageColor extends UIElement
	{
		
		public function DisplayAverageColor()
		{
			super();
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
		}
		
		public function updateColor(newColor:uint):void
		{
			addChild ( FormsUtils.drawRectangle( size.width, size.height, newColor ) );
		}
		
	}
}