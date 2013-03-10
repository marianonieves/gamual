package Screen
{
	public class DisplayCamera extends UIElement
	{
		public var videoCanvas:UIElement;
		
		public function DisplayCamera()
		{
			super();
			
			videoCanvas = new UIElement();
			addChild(videoCanvas);
		}

				
	}
}