package UI
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class CustomTwoStateButton extends UIElement
	{
		public var onClickCallback:Function;
		
		private var stateSelected:Sprite;
		private var stateUp:Sprite;
		
		private var _selected:Boolean=false;
		
		public function CustomTwoStateButton( upState : Sprite, selectedState : Sprite = null)
		{
			
			if(selectedState == null)
			{
				selectedState = upState;
			}			
			
			this.stateUp = upState;
			this.stateUp.visible = false;

			this.stateSelected = selectedState;
			this.stateSelected.alpha = 0.2;
			this.stateSelected.visible = false;

			addChild(this.stateUp);
			addChild(this.stateSelected);
		}
		
		public function onClick(e:MouseEvent):void
		{
			Config.logger.log(this,"onClick: " + this.name);
			Config.soundManager.playSound("click");
			onClickCallback(this.name);
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = !value;
			
			if(_selected)
			{
				stateUp.visible = true;
				stateUp.addEventListener(MouseEvent.CLICK,onClick);
				stateSelected.visible = false;
			} else {
				stateUp.visible = false;
				stateUp.removeEventListener(MouseEvent.CLICK,onClick);
				stateSelected.visible = true;
			}
			updateSize(size.width, size.height);
		}		
				
	}
}