package GameLogic
{	
	import Screen.DisplayAverageColor;
	import Screen.DisplayPalette;
	import Screen.DisplayPaletteItem;
	
	import Utils.ColourUtils;

	public class GameController
	{
		public var referenceColor:uint;
		public var referenceColorCanvas:DisplayAverageColor;
		public var paletteCanvas:DisplayPalette;
		public var paletteDebugCanvas:DisplayPalette;
		public var colorCodes:Array = new Array();
		
		public function GameController()
		{
			
		}

		public function initialize():void
		{
			colorCodes = Config.codeColor;
		}
		
		public function updateReferenceColor( newColor:uint ):void
		{
			trace("GameController.referenceColor:" + newColor);
			referenceColor = newColor;
			referenceColorCanvas.updateColor( referenceColor );
			
			var displayPaletteItem:DisplayPaletteItem = new DisplayPaletteItem()
			var index:int=0;
			for( index in paletteCanvas.colorsToFind )
			{
				displayPaletteItem = paletteCanvas.colorsToFind[index];
				if( displayPaletteItem.visible && ColourUtils.similar( displayPaletteItem.referenceColor, referenceColor, Config.similarityTolerance ) )
				{
					displayPaletteItem.hide();
					break;
				}
			}
			
		}
		
			
	}
}