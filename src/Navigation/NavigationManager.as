package Navigation
{
	import flash.display.Stage;
	
	import Screen.ScreenGame;
	import Screen.ScreenPresentation;
	
	public class NavigationManager
	{
		public var mainStage:Stage;
		
		private var currentNodeName:String="";
		private var currentNode:NavigationNode;		
		private var nodeReferences:Object;
		
		public static const NODE_PRESENTATION:String = "NODE_PRESENTATION";
		public static const NODE_GAME:String = "NODE_GAME";
		
		public function NavigationManager()
		{
			
		}
		
		public function initialize(initialNode:String=NavigationManager.NODE_PRESENTATION):void
		{
			nodeReferences = new Object();
			nodeReferences[NavigationManager.NODE_PRESENTATION] = new NavigationNode( NavigationManager.NODE_PRESENTATION, ScreenPresentation );
			nodeReferences[NavigationManager.NODE_GAME] = new NavigationNode( NavigationManager.NODE_PRESENTATION, ScreenGame );
			
			navigateTo(initialNode);
		}
		
		public function navigateTo(node:String):void
		{
			if( currentNode != null)
			{
				mainStage.removeChild( currentNode.screen );
				currentNode.finalize();
			}
			
			Config.logger.log(this, "currentNode: " + currentNode);

			currentNode = nodeReferences[node];
			currentNode.initialize();
			mainStage.addChild(currentNode.screen);
		}
		
	}
}