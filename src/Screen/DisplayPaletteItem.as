package Screen
{
	import Utils.FormsUtils;

	public class DisplayPaletteItem extends UIElement
	{		
		public var referenceColor:uint=0x000000;
		
		public function DisplayPaletteItem( )
		{
			super();
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
		}
				
		public function initialize():void
		{
			addChild( FormsUtils.drawCircle( size.width/2, size.height/2, size.height/2, referenceColor ) );
		}
						
	}
}