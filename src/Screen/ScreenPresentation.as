package Screen
{
	import flash.events.MouseEvent;
	
	import Navigation.NavigationManager;
	
	import Utils.FormsUtils;
		
	public class ScreenPresentation extends Screen implements IScreen
	{
		
		public function ScreenPresentation()
		{
			
		}
		
		public override function initialize():void
		{
			Config.logger.log("ScreenPresentation");
			this.addChild( Utils.FormsUtils.drawRectangle(Config.stageWidth,Config.stageHeight,0x330000) );
			
			this.addEventListener(MouseEvent.CLICK,onAction);
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