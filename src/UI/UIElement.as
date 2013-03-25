package UI
{
	import flash.display.Sprite;
	
	import UI.IUIElement;

	public class UIElement extends Sprite implements IUIElement
	{
		public var size:Object = new Object();
		
		public function UIElement()
		{
			super();
		}
		
		public function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
			this.width = size.width;
			this.height = size.height;
		}
		
		public function show():void
		{
			this.visible = true;
		}
		
		public function hide():void
		{
			this.visible = false;
		}
		
	}
}