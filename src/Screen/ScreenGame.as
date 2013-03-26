package Screen
{
	import flash.display.Sprite;
	
	import CameraLogic.SnapshotController;
	
	import GameLogic.GameController;
	
	import Resources.EmbededResources;
	
	import Utils.TimeUtils;
	
	public class ScreenGame extends Screen implements IScreen
	{
		
		private var snapshotController:SnapshotController;
		private var gameController:GameController;
		
		public var displayCamera:DisplayCamera;
		public var displaySnapshot:DisplaySnapshot;
		public var displayAverageColor:DisplayAverageColor;
		public var displayCard:DisplayCard;
		public var displayHeader:DisplayHeader;
		public var displayPalette:DisplayPalette;
		public var debugDisplayPalette:DisplayPalette;
		
		public function ScreenGame()
		{
		}
		
		public function initialize():void
		{
			displayHeader = new DisplayHeader();
			mainStage.addChild(displayHeader);
			
			displayCamera = new DisplayCamera();
			mainStage.addChild(displayCamera);			
			
			displayAverageColor = new DisplayAverageColor();
			displayAverageColor.visible = true;
			mainStage.addChild(displayAverageColor);			
			
			displayCard = new DisplayCard();
			displayCard.card = Config.loader.getBitmap("card2");
			mainStage.addChild(displayCard.card);
			
			displayPalette = new DisplayPalette();
			mainStage.addChild(displayPalette);
			
			if( Config.showDebugTools )
			{
				displaySnapshot = new DisplaySnapshot();
				displaySnapshot.x = Config.stageHeight/8 * 7;
				displaySnapshot.y = 0;
				mainStage.addChild(displaySnapshot);				
			}
			
			TimeUtils.delayedCall(setLayout);
		}
		
		public function setLayout():void
		{
			displayHeader.updateSize( Config.stageWidth, Config.stageHeight/12 );
			displayHeader.x = 0;
			displayHeader.y = 0;
			
			displayAverageColor.x = 0;
			displayAverageColor.y = displayHeader.size.height;
			displayAverageColor.updateSize( Config.stageWidth, Config.stageHeight/2 );
			
			displayCard.x = displayAverageColor.x;
			displayCard.y = displayAverageColor.y;			
			displayCard.updateSize( Config.stageWidth, Config.stageHeight/2 );
			
			displayCamera.x = -10;
			displayCamera.y = displayCard.y + displayCard.size.height;
			displayCamera.updateSize( Config.stageWidth, Config.stageHeight/2 );
			
			displayPalette.x = 0;
			displayPalette.y = displayCamera.y + displayCamera.size.height;
			displayPalette.updateSize( Config.stageWidth, Config.stageHeight/10 );
			displayPalette.initialize(Config.codeColor);

			
			if( Config.showDebugTools )
			{
				displaySnapshot.x = Config.stageHeight/8 * 7;
				displaySnapshot.y = 0;
				
				debugDisplayPalette = new DisplayPalette();
				debugDisplayPalette.y = 0;
				debugDisplayPalette.updateSize( Config.stageWidth, Config.stageHeight/10 );
//				debugDisplayPalette.initialize(Config.codeColor);
				mainStage.addChild(debugDisplayPalette);
			}
			
			initializeGame();
		}
		
		public function initializeGame():void
		{
			// Game
			gameController = new GameController();
			gameController.referenceColorCanvas = displayAverageColor;
			gameController.paletteCanvas = displayPalette;
			gameController.paletteDebugCanvas = debugDisplayPalette;
			gameController.initialize();
			
			// SnapshotController
			snapshotController = new SnapshotController();
			snapshotController.sourceCanvas = displayCamera;
			snapshotController.targetCanvas = displaySnapshot;
			snapshotController.debugCanvas = debugDisplayPalette;
			snapshotController.gameController = gameController;
			
			Utils.TimeUtils.delayedCall(startSnapshotController);
		}
		
		public function startSnapshotController():void
		{
			snapshotController.initialize();
		}				
		
		
		public function finalize():void
		{
			
		}			
		
	}
}