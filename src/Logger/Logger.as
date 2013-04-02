package Logger
{
	public class Logger
	{
		public function Logger()
		{
		}
		
		public function log(target:*, msg:String):void
		{
			trace("LOG :: " + target + " :: " + msg);
		}
		
		public function error(target:*, msg:String):void
		{
			trace("### ERROR :: " + target + " :: " + msg);
		}
		
		
	}
}