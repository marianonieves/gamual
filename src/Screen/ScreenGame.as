package Screen
{
	import CameraLogic.SnapshotController;
	
	import GameLogic.GameController;
	
	import Utils.TimeUtils;
	
	public class ScreenGame extends Screen implements IScreen
	{
		
		private var snapshotController:SnapshotController;
		private var gameController:GameController;
		
		public var displayCamera:DisplayCamera;
		public var displaySnapshot:DisplaySnapshot;
		public var displayReferenceColor:DisplayReferenceColor;
		public var displayCard:DisplayCard;
		public var displayHeader:DisplayHeader;
// 		public var displayPalette:DisplayPalette;
		public var debugDisplayPalette:DisplayPalette;
		
		public function ScreenGame()
		{
		}
		
		public override function initialize():void
		{			
			displayHeader = new DisplayHeader();
			this.addChild(displayHeader);
			
			displayCamera = new DisplayCamera();
			displayCamera.visible = false;
			this.addChild(displayCamera);
			
			displayReferenceColor = new DisplayReferenceColor();
			displayReferenceColor.visible = true;
			this.addChild(displayReferenceColor);			
			
			displayCard = new DisplayCard();
			this.addChild(displayCard);
			
			if( Config.showDebugTools )
			{
				displaySnapshot = new DisplaySnapshot();
				this.addChild(displaySnapshot);				
			}
			
			TimeUtils.delayedCall(setLayout);
		}
		
		public function setLayout():void
		{
			displayHeader.updateSize( Config.stageWidth, Config.stageHeight/12 );
			displayHeader.x = 0;
			displayHeader.y = 0;
			
			displayReferenceColor.x = 0;
			displayReferenceColor.y = displayHeader.size.height;
			displayReferenceColor.updateSize( Config.stageWidth, Config.stageHeight );
			
			displayCard.x = displayReferenceColor.x;
			displayCard.y = displayHeader.size.height;			
			displayCard.updateSize( Config.stageWidth, Config.stageHeight );

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
				*/
				
				displayCamera.x = -10;
				displayCamera.y = displayCard.y + displayCard.size.height;
				displayCamera.updateSize( Config.stageWidth, Config.stageHeight/2 );				
			}
			
			initializeGame();
		}
		
		public function initializeGame():void
		{
			// Game
			gameController = new GameController();
			gameController.referenceColorCanvas = displayReferenceColor;
			gameController.cardCanvas = displayCard;
			gameController.initialize();
			
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
		}
		
		public override function finalize():void
		{
			
		}			
		
	}
}