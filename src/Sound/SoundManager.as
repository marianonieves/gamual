package Sound
{
	import flash.media.SoundChannel;

	public class SoundManager
	{
		
		private var currentSound:String = "";
		private var soundControl:SoundChannel = new SoundChannel();

		public function SoundManager()
		{
			
		}
				
		public function playSound(name:String):void
		{
			if( currentSound != name )
			{
				soundControl.stop();
				soundControl = Config.loader.getSound(name).play();
			}
		}
		
		public function stopSong(name:String=""):void
		{
			if( currentSound == name || name=="" )
			{
				soundControl.stop();
			}
		}
		
	}
}