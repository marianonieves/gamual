package Navigation
{
	import Screen.IScreen;
	import Screen.Screen;

	public class NavigationNode implements IScreen
	{
		public var name:String;
		public var screen:Screen;
		public var screenClass:Class;
		
		public function NavigationNode( name:String, screenClass:Class )
		{
			this.name = name;
			this.screenClass = screenClass;
		}
		
		public function initialize():void
		{
			screen = new screenClass();
			screen.initialize();
		}
		
		public function finalize():void
		{
			screen = null;
		}
		
	}
}