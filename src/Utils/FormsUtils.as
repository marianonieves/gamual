package Utils
{
	import flash.display.Graphics;
	import flash.display.Sprite;

	public class FormsUtils
	{
		
		public function FormsUtils()
		{
		}
		
		public static function drawRectangle( formWidth:Number, formHeight:Number, fillColor:uint , lineColor:uint=0xffffff ):Sprite
		{
			var g:Graphics;
			var sprite:Sprite;
			sprite = new Sprite();
			g = sprite.graphics;
			if( lineColor!=0xffffff) g.lineStyle(1,lineColor);
			g.beginFill( fillColor );
			g.drawRect( 0, 0, formWidth, formHeight);
			g.endFill();
			return sprite;
		}

		public static function drawCircle( pos_x:Number, pos_y:Number, radius:Number , fillColor:uint=0x888888 ):Sprite
		{
			var circle:Sprite = new Sprite();
			circle.graphics.lineStyle(.1,0x000000);
			circle.graphics.beginFill(fillColor);
			circle.graphics.drawCircle(pos_x, pos_y, radius);
			circle.graphics.endFill();
			return circle;
		}
		
	}
}