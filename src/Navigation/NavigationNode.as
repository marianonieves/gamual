package Navigation
{
	import Screen.Screen;

	public class NavigationNode
	{
		public var name:String;
		public var initialize:Function;
		public var finalize:Function;
		public var screen:Screen;
		
		public function NavigationNode(name:String,initialize:Function,finalize:Function)
		{
			this.name = name;
			this.initialize = initialize;
			this.finalize = finalize;
		}
		
	}
}