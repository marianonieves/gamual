package CameraLogic
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.media.Camera;
	import flash.media.Video;

	public class CameraController
	{
		public var canvas:Sprite;
		public var stage:Stage;
		
		private var camera:Camera = Camera.getCamera();
		private var video:Video;
		
		public function CameraController()
		{
		}
		
		public function initialize():void
		{
			if (camera == null)
			{
				Config.logger.error("No camera is installed.");
			} 
			else 
			{
				Config.logger.log("Camera is installed.");
				camera.setMode( 800, 400, 15, true );
				connectCamera();
			}
		}
		
		private function connectCamera():void 
		{
			camera = Camera.getCamera();
			
			video = new Video(camera.width, camera.height);
			video.x = 10;
			video.y = 10;
			video.attachCamera(camera);
			
			canvas.addChild(video); 
		}
				
	}
}