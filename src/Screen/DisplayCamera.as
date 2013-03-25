package Screen
{
	import flash.media.Camera;
	import flash.media.Video;
	
	import UI.UIElement;

	public class DisplayCamera extends UIElement
	{
		public var videoCanvas:UIElement;
		private var camera:Camera = Camera.getCamera();
		private var video:Video;
		
		public function DisplayCamera()
		{
			super();
			
			videoCanvas = new UIElement();
			addChild(videoCanvas);
			
			initializeCamera();
		}
		
		public function initializeCamera():void
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
			
			videoCanvas.addChild(video); 
		}
				
	}
}