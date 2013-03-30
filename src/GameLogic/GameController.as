package GameLogic
{	
	import Screen.DisplayReferenceColor;
	import Screen.DisplayCard;
	import Screen.DisplayPalette;

	public class GameController
	{
		public var referenceColor:uint;
		public var referenceColorCanvas:DisplayReferenceColor;
		public var cardCanvas:DisplayCard;
		public var paletteCanvas:DisplayPalette;
		
		public var cards:Object = new Object();
		
		public function GameController()
		{
			cards["card1"] = new GameCard("card1", Config.loader.getBitmap("card1"), Config.COLOR_RED);
			cards["card2"] = new GameCard("card2", Config.loader.getBitmap("card2"), Config.COLOR_YELLOW);
		}

		public function initialize():void
		{
			updateCard("card2");
			
		}
		
		// Called from snapshotController
		public function updateCard( cardId:String="card1" ):void
		{
			cardCanvas.updateCard( Config.loader.getBitmap(cardId) );
			cardCanvas.updateSize(Config.stageWidth,Config.stageHeight);
		}
		
		
		// Called from snapshotController
		public function updateReferenceColor( newColor:uint ):void
		{
			Config.logger.log("GameController.referenceColor:" + newColor);
			referenceColor = newColor;
			referenceColorCanvas.updateColor( referenceColor );
		}
		
			
	}
}