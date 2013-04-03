package Sound
{
	import flash.media.SoundChannel;
	
	import Utils.TimeUtils;

	public class SoundManager
	{
		
		private var currentSound:String = "";
		private var soundControl:SoundChannel = new SoundChannel();
		
		private var soundSequence:Array=new Array();
		private var sequenceIsRunning:Boolean = false;
		private var sequenceIndex:int=0;


		public function SoundManager()
		{
			
		}
		
		public function addSequenceStep(name:String):void
		{
			soundSequence.push(name);
		}
		
		public function startSequence():void
		{
			Config.logger.log(this,"startSequence() " + soundSequence.toString() );
			
			if( sequenceIsRunning ) 
			{
				Config.logger.error(this,"playSequence() a sequence is already running");
				return;
			}
			
			sequenceIndex = 0;
			sequenceIsRunning = true;
			
			playNextSequencedSound();
		}
		
		public function playNextSequencedSound():void
		{
			playSound( soundSequence[sequenceIndex] );
			
			sequenceIndex++;
			if( sequenceIndex >= soundSequence.length )
			{
				sequenceCompleted();
			} else {
				Utils.TimeUtils.delayedCall( playNextSequencedSound, 2000 );
			}
		}
		
		public function sequenceCompleted():void
		{
			Config.logger.log(this,"sequenceCompleted()");
			soundSequence = new Array();
			sequenceIsRunning = false;
		}
		
		public function playSound(name:String):void
		{
			Config.logger.log(this,"playSound() " + name);
			
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