package Screen
{
	import flash.display.Sprite;
	
	import GameLogic.GameCard;
	
	import UI.CustomTwoStateButton;
	import UI.UIElement;
	
	import Utils.FormsUtils;

	public class DisplayMenuCards extends UIElement
	{
		private var background:Sprite;
		
		public function DisplayMenuCards()
		{
			super();
			
			// Background
			background = FormsUtils.drawRectangle( 10, 10, 0x333333 );
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
			Config.logger.log(this,"createButtons()");
			var btn_width:Number = size.width*.25;
			var btn_height:Number = size.height;
			
			// btns
			var gameCard:GameCard;
			for(var i:int=0; i<Config.cards.length; i++)
			{
				gameCard = Config.cards[(i)];
				Config.logger.log(this,"gameCard: " + gameCard.id);
				gameCard.button = new CustomTwoStateButton( Utils.FormsUtils.drawRectangle(btn_width,btn_height,gameCard.color), Utils.FormsUtils.drawRectangle(btn_width,btn_height,gameCard.color) );
				gameCard.button.name = gameCard.id;
				gameCard.button.updateSize( btn_width, btn_height);
				gameCard.button.selected  = false;
				gameCard.button.x = btn_width * (i);
				gameCard.button.onClickCallback = onClickCallback;
				addChild(gameCard.button);				
			}
			
		}
		
		public function onClickCallback(name:String):void
		{
			var gameCard:GameCard;
			for(var i:int=0; i<Config.cards.length; i++)
			{
				gameCard = Config.cards[(i)];
				gameCard.button.selected = (gameCard.button.name==name);
			}
			
			Config.logger.log(this, "DisplayMenuCards.onClick: " + name);
			Config.gameController.updateCard(name);
		}
		
	}
}