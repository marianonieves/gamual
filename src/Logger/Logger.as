package Logger
{
	public class Logger
	{
		public function Logger()
		{
		}
		
		public function log(msg:String):void
		{
			trace("LOG:" + msg);
		}
		
		public function error(msg:String):void
		{
			trace("### ERROR:" + msg);
		}
		
		
	}
}