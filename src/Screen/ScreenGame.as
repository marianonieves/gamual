package Screen
{
	import CameraLogic.SnapshotController;
	
	import GameLogic.GameController;
	
	import Utils.TimeUtils;
	
	public class ScreenGame extends Screen implements IScreen
	{
		
		private var snapshotController:SnapshotController;
		private var gameController:GameController;
		
		// Hidden Displays for debbuging
		public var displayCamera:DisplayCamera;
		public var displaySnapshot:DisplaySnapshot;
		public var debugDisplayPalette:DisplayPalette;
		// 		public var displayPalette:DisplayPalette;
		
		// Visible Displays
		// public var displayHeader:DisplayHeader;
		public var displayReferenceColor:DisplayReferenceColor;
		public var displayCard:DisplayCard;
		public var displayMenuCards:DisplayMenuCards;
		
		public function ScreenGame()
		{
		}
		
		public override function initialize():void
		{			
			displayCamera = new DisplayCamera();
			displayCamera.hide();
			this.addChild(displayCamera);
			
/*			displayHeader = new DisplayHeader();
			displayHeader.hide();
			this.addChild(displayHeader);*/
			
			
			displayReferenceColor = new DisplayReferenceColor();
			displayReferenceColor.hide();
			this.addChild(displayReferenceColor);			
			
			displayCard = new DisplayCard();
			displayCard.hide();
			this.addChild(displayCard);
			
			displayMenuCards = new DisplayMenuCards();
			displayMenuCards.hide();
			this.addChild(displayMenuCards);
			
			if( Config.showDebugTools )
			{
				displaySnapshot = new DisplaySnapshot();
				this.addChild(displaySnapshot);				
			}
			
			TimeUtils.delayedCall(setLayout);
		}
		
		public function setLayout():void
		{
/*			displayHeader.updateSize( Config.stageWidth, Config.stageHeight*.05 );
			displayHeader.x = 0;
			displayHeader.y = 0;*/

			displayCard.x = 0;
			displayCard.y = 0;
			displayCard.updateSize( Config.stageWidth, Config.stageHeight*.8 );
			
			displayReferenceColor.x = displayCard.x;
			displayReferenceColor.y = displayCard.y;
			displayReferenceColor.updateSize( Config.stageWidth, Config.stageHeight*.8 );
			
			displayMenuCards.x = 0;
			displayMenuCards.y = Config.stageHeight - (Config.stageHeight*.2);
			displayMenuCards.updateSize( Config.stageWidth, (Config.stageHeight*.2));

			if( Config.showDebugTools )
			{
				displaySnapshot.x = 0;
				displaySnapshot.y = 0;
				
				/*
				displayPalette = new DisplayPalette();
				this.addChild(displayPalette);
				displayPalette.x = 0;
				displayPalette.y = displayCamera.y + displayCamera.size.height;
				displayPalette.updateSize( Config.stageWidth, Config.stageHeight/10 );
				displayPalette.initialize(Config.codeColor);
				
				displayCamera.x = -10;
				displayCamera.y = displayCard.y + displayCard.size.height;
				displayCamera.updateSize( Config.stageWidth, Config.stageHeight/2 );				
				*/
			}
			
			showDisplays();
		}
		
		public function showDisplays():void
		{
			// displayHeader.show();
			displayCard.show();
			displayReferenceColor.show();
			displayMenuCards.show();
			
			initializeGame();
		}
		
		
		public function initializeGame():void
		{
			// Game
			gameController = new GameController();
			gameController.referenceColorCanvas = displayReferenceColor;
			gameController.cardCanvas = displayCard;
			gameController.menuCards = displayMenuCards;
			Config.gameController = gameController;
			
			// SnapshotController
			snapshotController = new SnapshotController();
			snapshotController.sourceCanvas = displayCamera;
			snapshotController.targetCanvas = displaySnapshot;
			snapshotController.gameController = gameController;
			
			Utils.TimeUtils.delayedCall(startSnapshotController);
		}
		
		public function startSnapshotController():void
		{
			snapshotController.initialize();
			Config.gameController.initialize();
			
		}
		
		public override function finalize():void
		{
			
		}			
		
	}
}