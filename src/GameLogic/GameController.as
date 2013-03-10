package GameLogic
{	
	import Screen.DisplayAverageColor;
	import Screen.DisplayPalette;
	import Screen.DisplayPaletteItem;
	
	import Utils.ColourUtils;

	public class GameController
	{
		public var averageColor:uint;
		public var averageColorCanvas:DisplayAverageColor;
		public var paletteCanvas:DisplayPalette;
		public var colorCodes:Array = new Array();
		
		public function GameController()
		{
			
		}

		public function initialize():void
		{
			colorCodes = Config.codeColor;
		}
		
		public function updateAverageColor( newColor:uint ):void
		{
			averageColor = newColor;
			averageColorCanvas.updateColor( averageColor );
			
			var displayPaletteItem:DisplayPaletteItem = new DisplayPaletteItem()
			for( var i:int in paletteCanvas.colorsToFind )
			{
				displayPaletteItem = paletteCanvas.colorsToFind[i];
				if( displayPaletteItem.visible && ColourUtils.similar( displayPaletteItem.referenceColor, averageColor, Config.similarityTolerance ) )
				{
					displayPaletteItem.hide();
					break;
				}				
			}

		}
			
	}
}