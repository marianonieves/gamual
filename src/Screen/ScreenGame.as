package Screen
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	import CameraLogic.SnapshotController;
	
	import GameLogic.GameController;
	
	import UI.Docker;
	
	import Utils.FormsUtils;
	import Utils.TimeUtils;
	
	public class ScreenGame extends Screen implements IScreen
	{
		private var background:Sprite;
		
		private var snapshotController:SnapshotController;
		private var gameController:GameController;
		
		// Hidden Displays for debbuging
		public var displayCamera:DisplayCamera;
		public var displaySnapshot:DisplaySnapshot;
		public var debugDisplayPalette:DisplayPalette;
		
		// Visible Displays
		public var displayHeader:DisplayHeader;
		public var displayCard:DisplayCard;
		public var displayMenuCards:DisplayMenuCards;
		
		public function ScreenGame()
		{
			background = Utils.FormsUtils.drawRectangle(Config.stageWidth,Config.stageHeight,Config.COLOR_WHITE);
		}
		
		public override function initialize():void
		{			
			this.addChild(background);
			
			displayCamera = new DisplayCamera();
			displayCamera.hide();
			this.addChild(displayCamera);
			
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
			
			displayHeader = new DisplayHeader();
			displayHeader.hide();
			this.addChild(displayHeader);
			
			TimeUtils.delayedCall(setLayout);
		}
		
		public function setLayout():void
		{
			displayCard.horizontalAlign = Docker.DOCK_CENTER;
			displayCard.verticalAlign = Docker.DOCK_TOP;
			displayCard.updateSize( Config.stageWidth, Config.stageHeight*.8 );
			
			displayMenuCards.horizontalAlign = Docker.DOCK_CENTER;
			displayMenuCards.verticalAlign = Docker.DOCK_BOTTOM;
			displayMenuCards.updateSize( Config.stageWidth, (Config.stageHeight*.2));
			
			displayHeader.horizontalAlign = Docker.DOCK_LEFT;
			displayHeader.verticalAlign = Docker.DOCK_TOP;
			displayHeader.updateSize( displayHeader.width*.5 , displayHeader.height*.5 );

			if( Config.showDebugTools )
			{
				displaySnapshot.horizontalAlign = Docker.DOCK_RIGHT;
				displaySnapshot.verticalAlign = Docker.DOCK_TOP;
			}
			
			showDisplays();
		}
		
		public function showDisplays():void
		{
			displayCard.show();
			displayMenuCards.show();
			displayHeader.show();
			
			initializeGame();
		}
		
		
		public function initializeGame():void
		{
			// Game
			gameController = new GameController();
			gameController.referenceColorCanvas = displayCard.displayReferenceColor;
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