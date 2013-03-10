package Screen
{
	import flash.utils.Dictionary;
	
	import Utils.FormsUtils;

	public class DisplayPalette extends UIElement
	{		
		
		public var colorsToFind:Dictionary = new Dictionary();
		
		public function DisplayPalette()
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
			addChild ( FormsUtils.drawRectangle( size.width, size.height, 0xffffff, 0x000000 ) );
						
			var itemSize:Object = { width:(size.width/Config.colorCodes.length) , height:size.height };
			
			var currentItem:DisplayPaletteItem;
			
			for( var i:int=0; i<Config.colorCodes.length; i++)
			{
				currentItem = new DisplayPaletteItem();
				currentItem.referenceColor = Config.colorCodes[i];
				currentItem.updateSize( itemSize.width, itemSize.height );
				currentItem.x = i * itemSize.width;
				currentItem.initialize();
				
				colorsToFind[ currentItem.referenceColor ] = currentItem;
				addChild( currentItem );
				
			}
			
			
		}
		
	}
}