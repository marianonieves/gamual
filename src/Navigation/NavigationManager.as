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
		
		private var screenGame:ScreenGame;
		private var screenPresentation:ScreenPresentation;
		private var nodeReferences:Object;
		
		public static const NODE_PRESENTATION:String = "NODE_START";
		public static const NODE_GAME:String = "NODE_GAME";
		
		public function NavigationManager()
		{
			
		}
		
		public function initialize(initialNode:String=NavigationManager.NODE_PRESENTATION):void
		{
			
			nodeReferences = new Object();
			nodeReferences[NavigationManager.NODE_PRESENTATION] = new NavigationNode( NavigationManager.NODE_PRESENTATION, presentationInitialize, presentationFinalize );
			nodeReferences[NavigationManager.NODE_GAME] = new NavigationNode( NavigationManager.NODE_PRESENTATION, gameInitialize, gameFinalize );
			
			navigateTo(initialNode);
		}
		
		public function navigateTo(node:String):void
		{
			if( currentNode != null)
			{
				currentNode = nodeReferences[currentNode];
				currentNode.finalize();
				mainStage.removeChild( currentNode.screen );
			}

			currentNode = nodeReferences[node];
			currentNode.initialize();
			mainStage.addChild(currentNode.screen);
		}
		
		public function presentationInitialize():void
		{
			// Create the Presentation Screen
			screenPresentation = new ScreenPresentation();
			screenPresentation.mainStage = mainStage;
			currentNode.screen = screenPresentation;
		}
		
		public function presentationFinalize():void
		{
			
		}
		
		public function gameInitialize():void
		{
			// Canvas, create Layout
			screenGame = new ScreenGame();
			screenGame.mainStage = mainStage;
			screenGame.initialize();
			
			currentNode.screen = screenGame;
			
		}
		
		public function gameFinalize():void
		{
			
		}
		
	}
}