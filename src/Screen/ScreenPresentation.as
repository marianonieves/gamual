package Screen
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import Navigation.NavigationManager;
	
	import gs.TweenLite;
	import gs.easing.Back;
	
	public class ScreenPresentation extends Screen implements IScreen
	{
		
		private var logo:Sprite;
		
		public function ScreenPresentation()
		{
			
			logo = new Sprite();
			logo.addChild( Config.loader.getBitmap("logo") );
		}
		
		public override function initialize():void
		{
			Config.logger.log(this, "ScreenPresentation");
			
			this.addChild( logo );
			
			startAnimation();
		}
		
		
		public function startAnimation():void
		{
			var tox:Number = (Config.stageWidth/2) - (logo.width/2);
			var toy:Number = (Config.stageHeight/2) - (logo.height/2);
			TweenLite.to(logo, 1, { x:tox, y:toy, ease:Back.easeOut, onComplete:finishAnimation, onCompleteParams:[this] });
			
			Config.soundManager.addSequenceStep("voice_hello");
			Config.soundManager.addSequenceStep("voice_letsPaintTogheter");
			Config.soundManager.addSequenceStep("voice_touchScreen");
			Config.soundManager.startSequence();
		}
		
		public function finishAnimation(param:*):void
		{
			Config.logger.log(this," param " + param );
			param.addEventListener(MouseEvent.CLICK,onAction);
		}
		
		public function onAction(e:MouseEvent):void
		{
			Config.navigationManager.navigateTo(NavigationManager.NODE_GAME);
		}
		
		public override function finalize():void
		{
			this.removeEventListener(MouseEvent.CLICK,onAction);
		}
		
		
	}
}