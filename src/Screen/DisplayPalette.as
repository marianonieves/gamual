package Screen
{
	import flash.utils.Dictionary;
	
	import Utils.FormsUtils;

	public class DisplayPalette extends UIElement
	{		
		
		public var colorsToFind:Dictionary = new Dictionary();
		public var colorsToShow:Array;
		
		public function DisplayPalette()
		{
			super();
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
		}

		private var debugColorList:Array = new Array();
		
		public function initializeDebug(debugColorsToShow:Array):void
		{
			for ( var i:int=0; i<10; i++)
			{
				debugColorList[i] = new DataColor("default",debugColorsToShow[i]);
			}
			
			initialize(debugColorList);
		}
		
		public function initialize(colorsToShow:Array):void
		{
			this.colorsToShow = colorsToShow;
			if(size.width==null) return;
			
			addChild ( FormsUtils.drawRectangle( size.width, size.height, 0xffffff, 0x000000 ) );
						
			var itemSize:Object = { width:(size.width/colorsToShow.length) , height:size.height };
			
			var currentItem:DisplayPaletteItem;
			
			for( var i:int=0; i<colorsToShow.length; i++)
			{
				currentItem = new DisplayPaletteItem();
				currentItem.referenceColor = DataColor(colorsToShow[i]).value;
				currentItem.updateSize( itemSize.width, itemSize.height );
				currentItem.x = i * itemSize.width;
				currentItem.initialize();
				
				colorsToFind[ currentItem.referenceColor ] = currentItem;
				addChild( currentItem );
				
			}
		}
		
		public function similarTo(i):void
		{
			DisplayPaletteItem( colorsToFind[ colorsToShow[i].value ] ).hide();
		}
		
	}
}