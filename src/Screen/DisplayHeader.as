package Screen
{
	import flash.display.Sprite;
	
	import UI.UIElement;

	public class DisplayHeader extends UIElement
	{
		
		private var logo:Sprite;

		public function DisplayHeader()
		{
			super();

			logo = new Sprite();
			logo.addChild( Config.loader.getBitmap("logo") );
			addChild(logo);
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{			
			size.width = width;
			size.height = height;
			
			this.width = width;
			this.height = height;
			
			logo.width = width;
			logo.height = height;
			
			updatePositionByAlign(logo);
		}

				
	}
}