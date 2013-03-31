package
{
	import GameLogic.GameCard;
	import GameLogic.GameController;
	
	import Logger.Logger;
	
	import Navigation.NavigationManager;
	
	import br.com.stimuli.loading.BulkLoader;

	public class Config
	{
		public static var logger:Logger = new Logger();
		public static var pathConfigurationFile:String="Assets/configuration/configuration.xml";
		public static var navigationManager:NavigationManager;
		public static var loader:BulkLoader = new BulkLoader("gamual");
		public static var gameController:GameController;
		
		public static var stageHeight:Number = 100;
		public static var stageWidth:Number = 100;
		
		public static var snapshotRefreshTime:Number=500;
		public static var snapshotScale:Number = .1;
		public static var delayedCallTime:Number=1000;
		public static var showDebugTools:Boolean=true;
		
		public static var similarityTolerance:Number=0.05;

		public static const COLOR_WHITE:uint = 0xffffff;
		public static const COLOR_RED:uint = 0xff0000;
		public static const COLOR_ORANGE:uint = 0xFF8000;
		public static const COLOR_YELLOW:uint = 0xF3F781;
		public static const COLOR_GREEN:uint = 0x81F781;
		public static const COLOR_BLUE:uint = 0x2E64FE;
		public static const COLOR_PINK:uint = 0xF5A9F2;
		public static const COLOR_BROWN:uint = 0x8A4B08;
		public static const COLOR_BLACK:uint = 0x000000;
		
		
		public static var cards:Vector.<GameCard> = new Vector.<GameCard>();
		Config.cards.push( new GameCard("card1", Config.loader.getBitmap("card1"), Config.COLOR_RED) );
		Config.cards.push( new GameCard("card2", Config.loader.getBitmap("card2"), Config.COLOR_GREEN) );
		Config.cards.push( new GameCard("card3", Config.loader.getBitmap("card3"), Config.COLOR_YELLOW) );
		Config.cards.push( new GameCard("card4", Config.loader.getBitmap("card4"), Config.COLOR_BLUE) );
		
	}

}

