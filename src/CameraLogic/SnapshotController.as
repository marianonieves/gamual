package CameraLogic
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.utils.Timer;
	
	import GameLogic.GameController;
	
	import Utils.ColourUtils;
	import Utils.MatrixUtil;
	
	public class SnapshotController
	{
		public var sourceCanvas:Sprite;
		public var targetCanvas:Sprite;
		public var gameController:GameController;
		
		public var scale:Number=1;
		public var showSnapshotCanvas:Boolean=Config.showSnapshotCanvas;
		
		private var timerObject:Timer = new Timer(1000, 10);
		private var imageData:BitmapData; 
		private var image:Bitmap;
		private var scaleMatrix:Matrix;
		
		public function SnapshotController()
		{
		}

		public function initialize():void
		{
			scale = Config.snapshotScale;
			
			imageData = new BitmapData( sourceCanvas.width*scale, sourceCanvas.height*scale ); 
			image = new Bitmap( imageData );
			
			if(showSnapshotCanvas)
				targetCanvas.addChild(image);

			scaleMatrix = new Matrix();
			scaleMatrix.scale(scale, scale)

			timerObject = new Timer( Config.snapshotRefreshTime );
			timerObject.addEventListener( TimerEvent.TIMER, snapshot );
			timerObject.start();			
		}

		public function snapshot(eventObject:TimerEvent):void 
		{ 
			image = new Bitmap( imageData , PixelSnapping.ALWAYS, true );
			image.filters = [
				MatrixUtil.setBrightness(0),
				MatrixUtil.setContrast(100),
				MatrixUtil.setSaturation(100)];
			
			imageData.draw(sourceCanvas,scaleMatrix) ;
			gameController.updateAverageColor( ColourUtils.averageColour(imageData) );
		}
		

	}
}