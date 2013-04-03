package Screen
{
	import UI.UIElement;

	public class DisplaySnapshot extends UIElement
	{

		public function DisplaySnapshot()
		{
			super();
		}

		// Resizable
		override public function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
			this.width = size.width;
			this.height = size.height;
			updatePositionByAlign(size);
		}		
	}
}