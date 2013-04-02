package GameLogic
{	
	import Screen.DisplayCard;
	import Screen.DisplayMenuCards;
	import Screen.DisplayPalette;
	import Screen.DisplayReferenceColor;

	public class GameController
	{
		public var referenceColor:uint;
		public var referenceColorCanvas:DisplayReferenceColor;
		public var cardCanvas:DisplayCard;
		public var menuCards:DisplayMenuCards;
		public var paletteCanvas:DisplayPalette;
		
		public var cards:Object = new Object();
		
		public function GameController()
		{
			cards = Config.cards;
		}

		public function initialize():void
		{
			menuCards.onClickCallback("card1");
		}
		
		// Called from snapshotController
		public function updateCard( cardId:String="card1" ):void
		{
			cardCanvas.updateCard( Config.loader.getBitmap(cardId) );
		}
		
		
		// Called from snapshotController
		public function updateReferenceColor( newColor:uint ):void
		{
			// Config.logger.log("GameController.referenceColor:" + newColor);
			referenceColor = newColor;
			referenceColorCanvas.updateColor( referenceColor );
		}
		
			
	}
}