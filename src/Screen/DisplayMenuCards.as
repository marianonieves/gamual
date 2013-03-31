package Screen
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import UI.UIElement;
	
	import Utils.FormsUtils;

	public class DisplayMenuCards extends UIElement
	{
		private var background:Sprite;
		private var btn1:Sprite;
		private var btn2:Sprite;
		private var btn3:Sprite;
		private var btn4:Sprite;
		
		public function DisplayMenuCards()
		{
			super();
			
			// Background
			background = FormsUtils.drawRectangle( 10, 10, 0x333366 );
			addChild(background);
		}
				
		public override function updateSize(width:Number, height:Number ):void
		{
			size.width = width;
			size.height = height;			
			background.width = size.width;
			background.height = size.height;
			this.width = size.width;
			this.height = size.height;
			
			createButtons();
		}
		
		public function createButtons():void
		{
			var btn_width:Number = size.width*.25;
			var btn_height:Number = size.height;
			
			var spriteBtn:Sprite;
			// btns
			for(var i:int=1; i<=Config.cards.length; i++)
			{
				spriteBtn = this["btn"+i];
				spriteBtn = FormsUtils.drawRectangle( btn_width, btn_height, Config.cards[(i-1)].color );
				spriteBtn.name = Config.cards[(i-1)].id;
				spriteBtn.x = btn_width * (i-1);
				spriteBtn.addEventListener(MouseEvent.CLICK,onClick);
				addChild(spriteBtn);
			}
			
		}
		
		public function onClick(e:MouseEvent):void
		{
			Config.logger.log("DisplayMenuCards.onClick:" + e.target.name);
			Config.gameController.updateCard(e.target.name);
		}
		
	}
}