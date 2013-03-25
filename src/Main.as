package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import Configuration.Configuration;
	
	import Navigation.NavigationManager;
	
	import Utils.TimeUtils;
	
	public class Main extends Sprite
	{
		private var navigationManager:NavigationManager;
		private var configuration:Configuration;
		
		public function Main()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			Utils.TimeUtils.delayedCall(configurationFileLoad);
		}
		
		public function configurationFileLoad():void
		{
			// The Set of data could change by Game Mode
			configuration = new Configuration();
			configuration.addEventListener(Event.COMPLETE,configurationFile_onLoaded);
			configuration.load(Config.pathConfigurationFile);			
		}
		
		public function configurationFile_onLoaded(e:Event):void
		{
			// Screen Manager is in charge of initialize Screen and Logic
			navigationManager = new NavigationManager();
			navigationManager.mainStage = stage;
			navigationManager.initialize(NavigationManager.NODE_GAME);
			
			initializeApp();
		}
		
		public function initializeApp():void
		{
			Config.stageHeight = stage.stageHeight;
			Config.stageWidth = stage.stageWidth;
			Config.navigationManager = navigationManager;
		}
		
	}
}