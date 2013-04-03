package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import Configuration.Configuration;
	
	import GameLogic.GameCard;
	
	import Navigation.NavigationManager;
	
	import Sound.SoundManager;
	
	import Utils.TimeUtils;
	
	import br.com.stimuli.loading.BulkLoader;
	
	[SWF(frameRate="30", backgroundColor="#E51D2E")]
	public class Main extends Sprite
	{
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
			Config.loader.addEventListener(Event.COMPLETE, loadCards_onComplete);
			Config.loader.start();
		}
		
		public function loadCards_onComplete(e:Event):void
		{
			Config.loader.removeEventListener(Event.COMPLETE, loadCards_onComplete);
			
			Config.cards.push( new GameCard("card1", Config.loader.getBitmap("card1"), Config.COLOR_RED) );
			Config.cards.push( new GameCard("card2", Config.loader.getBitmap("card2"), Config.COLOR_GREEN) );
			Config.cards.push( new GameCard("card3", Config.loader.getBitmap("card3"), Config.COLOR_YELLOW) );
			Config.cards.push( new GameCard("card4", Config.loader.getBitmap("card4"), Config.COLOR_BLUE) );
			
			loadSounds();
		}			
		
		public function loadSounds():void
		{
			Config.loader.add("/Assets/sounds/click.mp3", {id:"click"});
			Config.loader.add("/Assets/sounds/voice_hello.mp3", {id:"voice_hello"});
			Config.loader.add("/Assets/sounds/voice_letsPaintTogheter.mp3", {id:"voice_letsPaintTogheter"});
			Config.loader.add("/Assets/sounds/voice_touchScreen.mp3", {id:"voice_touchScreen"});
			Config.loader.add("/Assets/sounds/voice_letsPaintA.mp3", {id:"voice_letsPaintA"});
			Config.loader.add("/Assets/sounds/voice_card1.mp3", {id:"voice_card1"});
			Config.loader.add("/Assets/sounds/voice_card2.mp3", {id:"voice_card2"});
			Config.loader.add("/Assets/sounds/voice_card3.mp3", {id:"voice_card3"});
			Config.loader.add("/Assets/sounds/voice_card4.mp3", {id:"voice_card4"});
			Config.loader.addEventListener(Event.COMPLETE, loadSounds_onComplete);
			Config.loader.start();
		}
		
		public function loadSounds_onComplete(e:Event):void
		{
			Config.soundManager = new SoundManager();
			
			Config.loader.removeEventListener(Event.COMPLETE, loadSounds_onComplete);
			loadUIAssets();
		}			
		
		public function loadUIAssets():void
		{
			Config.loader.add("/Assets/ui/logo.png", {id:"logo"});
			Config.loader.addEventListener(BulkLoader.COMPLETE, loadUIAssets_onComplete);
			Config.loader.start();
		}
		
		public function loadUIAssets_onComplete(e:Event):void
		{
			Config.loader.removeEventListener(BulkLoader.COMPLETE, loadUIAssets_onComplete);
			initializeApp();
		}
		
		public function initializeApp():void
		{
			Config.stageHeight = stage.stageHeight;
			Config.stageWidth = stage.stageWidth;
			Config.stageRatio = stage.stageHeight/stage.stageWidth;
			
			Config.navigationManager = new NavigationManager();			
			Config.navigationManager.mainStage = stage;
			Config.navigationManager.initialize(NavigationManager.NODE_PRESENTATION);
			
		}
		
	}
}