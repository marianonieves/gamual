package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import CameraLogic.CameraController;
	import CameraLogic.SnapshotController;
	
	import GameLogic.GameController;
	
	import Screen.ScreenController;
	
	import Utils.TimeUtils;
	
	public class Main extends Sprite
	{
		private var cameraController:CameraController;
		private var screenController:ScreenController;
		private var snapshotController:SnapshotController;
		private var gameController:GameController;
		
		public function Main()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			Utils.TimeUtils.delayedCall(initialize);
		}
		
		public function initialize():void
		{
			// Canvas, create Layout
			screenController = new ScreenController();
			screenController.mainStage = stage;
			screenController.initialize();
			
			// Camera
			cameraController = new CameraController();
			cameraController.canvas = screenController.displayCamera.videoCanvas;
			cameraController.stage = stage;
			cameraController.initialize();
			
			// Game
			gameController = new GameController();
			gameController.averageColorCanvas = screenController.displayAverageColor;
			gameController.paletteCanvas = screenController.displayPalette;
			gameController.initialize();
			
			
			Utils.TimeUtils.delayedCall(startSnapshotController);
		}
		
		public function startSnapshotController():void
		{
			// SnapshotController
			snapshotController = new SnapshotController();
			snapshotController.sourceCanvas = screenController.displayCamera;
			snapshotController.targetCanvas = screenController.displaySnapshot;
			snapshotController.gameController = gameController;
			snapshotController.initialize();
		}
		
	}
}