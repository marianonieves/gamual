package Screen
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import UI.UIElement;

	public class DisplayHeader extends UIElement
	{
		
		private var background:Sprite;
		private var txtTitle:TextField;
		private var txtformat:TextFormat;
		
		public function DisplayHeader()
		{
			super();
			
			txtformat = new TextFormat();
			
/*			// Background
			background = FormsUtils.drawRectangle( Config.stageWidth, Config.stageHeight, 0xcccccc );
			addChild(background);
*/			
			// Text
			txtTitle = new TextField();
			txtTitle.text = "GAMUAL";
			txtTitle.cacheAsBitmap = true;
			addChild(txtTitle);
		}
		
		public override function updateSize(width:Number, height:Number ):void
		{			
			size.width = width;
			size.height = height;
			this.width = size.width;
			this.height = size.height;
			
			txtformat.bold = true;
			txtformat.color  = 0x000000;
			txtformat.font = "Arial";
			txtformat.size = 100;
			txtTitle.setTextFormat(txtformat);
			
		}

				
	}
}