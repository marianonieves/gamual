package Screen
{
	import flash.display.Stage;
	
	import Utils.TimeUtils;
	
	public class ScreenController
	{
		public var mainStage:Stage;
		public var displayCamera:DisplayCamera;
		public var displaySnapshot:DisplaySnapshot;
		public var displayAverageColor:DisplayAverageColor;
		public var displayHeader:DisplayHeader;
		public var displayPalette:DisplayPalette;
		public var debugDisplayPalette:DisplayPalette;
		
		public function ScreenController()
		{
			
		}
		
		public function initialize():void
		{
			displayHeader = new DisplayHeader();
			mainStage.addChild(displayHeader);
			
			displayCamera = new DisplayCamera();
			mainStage.addChild(displayCamera);
			
			displayAverageColor = new DisplayAverageColor();
			mainStage.addChild(displayAverageColor);
			
			displayPalette = new DisplayPalette();
			mainStage.addChild(displayPalette);
			
			if( Config.showDebugTools )
			{
				displaySnapshot = new DisplaySnapshot();
				displaySnapshot.x = mainStage.stageHeight/8 * 7;
				displaySnapshot.y = 0;
				mainStage.addChild(displaySnapshot);				
			}
			
			TimeUtils.delayedCall(setLayout);
		}
		
		public function setLayout():void
		{
			displayHeader.updateSize( mainStage.stageWidth, mainStage.stageHeight/12 );
			displayHeader.x = 0;
			displayHeader.y = 0;
			
			displayCamera.x = -10;
			displayCamera.y = displayHeader.size.height;
			displayCamera.updateSize( mainStage.stageWidth, mainStage.stageHeight/2 );
			
			displayAverageColor.x = 0;
			displayAverageColor.y = displayCamera.y + displayCamera.size.height;
			displayAverageColor.updateSize( mainStage.stageWidth, mainStage.stageHeight/2 );
			
			displayPalette.x = 0;
			displayPalette.y = displayCamera.y + displayCamera.size.height;
			displayPalette.updateSize( mainStage.stageWidth, mainStage.stageHeight/10 );
			displayPalette.initialize(Config.codeColor);

			
			if( Config.showDebugTools )
			{
				displaySnapshot.x = mainStage.stageHeight/8 * 7;
				displaySnapshot.y = 0;
				
				debugDisplayPalette = new DisplayPalette();
				debugDisplayPalette.y = 0;
				debugDisplayPalette.updateSize( mainStage.stageWidth, mainStage.stageHeight/10 );
//				debugDisplayPalette.initialize(Config.codeColor);
				mainStage.addChild(debugDisplayPalette);
			}
			
		}
		
	}
}