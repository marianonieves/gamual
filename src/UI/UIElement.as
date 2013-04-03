package UI
{
	import flash.display.Sprite;
	
	public class UIElement extends Sprite implements IVisible,IResizable,IDockable
	{
		public var size:Object = new Object();
		public var horizontalAlign:String = Docker.DOCK_NO_ALIGN;
		public var verticalAlign:String = Docker.DOCK_NO_ALIGN;
		
		public function UIElement()
		{
			super();
			
		}
				
		// Resizable
		public function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;
			this.width = size.width;
			this.height = size.height;
			updatePositionByAlign(size);
		}
		
		// Dockable		
		public function updatePositionByAlign(refObject:*=null):void
		{
			if( refObject == null ) refObject=this;
				
			if( horizontalAlign != Docker.DOCK_NO_ALIGN )
			{
				if ( horizontalAlign == Docker.DOCK_LEFT ){
					x = 0;
				} else if( horizontalAlign == Docker.DOCK_CENTER ){
					x = (Config.stageWidth/2) - (size.width/2);
				} else if( horizontalAlign == Docker.DOCK_RIGHT ){
					x = (Config.stageWidth) - (size.width);
				}
			}
			
			if( verticalAlign != Docker.DOCK_NO_ALIGN )
			{
				if ( verticalAlign == Docker.DOCK_TOP){
					y = 0;
				} else if( verticalAlign == Docker.DOCK_MIDDLE ){
					y = (Config.stageHeight/2) - (size.height/2);
				} else if( verticalAlign == Docker.DOCK_BOTTOM ){
					y = (Config.stageHeight) - (size.height);
				}
			}
			
		}
		
		
		// Visible
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