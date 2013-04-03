package Utils
{
	import flash.utils.setTimeout;

	public class TimeUtils
	{		
		public function TimeUtils()
		{
		}
		
		public static function delayedCall( callback:Function, delayedCallTime:Number=1000 ):void
		{
			var intID:Number = setTimeout(callback, delayedCallTime); 
		}
		
	}
}