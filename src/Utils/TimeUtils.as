package Utils
{
	import flash.utils.setTimeout;

	public class TimeUtils
	{		
		public function TimeUtils()
		{
		}
		
		public static function delayedCall( callback:Function ):void
		{
			var intID:Number = setTimeout(callback, Config.delayedCallTime); 
		}
		
	}
}