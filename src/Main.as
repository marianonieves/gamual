package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import Configuration.Configuration;
	
	import Navigation.NavigationManager;
	
	import Utils.TimeUtils;
	
	import br.com.stimuli.loading.BulkLoader;
	
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
			loadCards();
		}
		
		public function loadCards():void
		{
			Config.loader.logLevel = BulkLoader.LOG_INFO;

			Config.loader.add("/Assets/cards/card1.png", {id:"card1"});
			Config.loader.add("/Assets/cards/card2.png", {id:"card2"});
			Config.loader.add("/Assets/cards/card3.png", {id:"card3"});
			Config.loader.add("/Assets/cards/card4.png", {id:"card4"});
			Config.loader.addEventListener(BulkLoader.COMPLETE, loadCards_onComplete);
			Config.loader.start();
		}
		
		public function loadCards_onComplete(e:Event):void
		{
			initializeApp();
		}
		
		public function initializeApp():void
		{
			Config.stageHeight = stage.stageHeight;
			Config.stageWidth = stage.stageWidth;
			
			navigationManager = new NavigationManager();
			navigationManager.mainStage = stage;
			
			Config.navigationManager = navigationManager;			
			Config.navigationManager.initialize(NavigationManager.NODE_GAME);
		}
		
		
	}
}