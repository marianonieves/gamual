package UI
{
	public interface IUIElement
	{
		function show():void;
		function hide():void;
		function updateSize( width:Number, height:Number ):void;
		function updatePosition(  ):void;
	}
	
}