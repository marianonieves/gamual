package Screen
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import Navigation.NavigationManager;
		
	public class ScreenPresentation extends Screen implements IScreen
	{
		
		public function ScreenPresentation()
		{
			
		}
		
		public function initialize():void
		{
			this.addEventListener(MouseEvent.CLICK,onAction);
		}
		
		public function onAction(e:MouseEvent):void
		{
			Config.navigationManager.navigateTo(NavigationManager.NODE_GAME);
		}
		
		public function finalize():void
		{
			this.removeEventListener(MouseEvent.CLICK,onAction);
		}
		
		
	}
}