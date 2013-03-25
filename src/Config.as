package
{
	import Logger.Logger;
	
	import Navigation.NavigationManager;

	public class Config
	{
		public static var logger:Logger = new Logger();
		public static var pathConfigurationFile:String="Assets/configuration/configuration.xml";
		public static var navigationManager:NavigationManager;
		
		public static var stageHeight:Number = 100;
		public static var stageWidth:Number = 100;
		
		public static var snapshotRefreshTime:Number=500;
		public static var snapshotScale:Number = .1;
		public static var delayedCallTime:Number=1000;
		public static var showDebugTools:Boolean=true;
		
		public static var similarityTolerance:Number=0.05;

		public static var codeColor:Array = new Array();
		Config.codeColor.push( new DataColor("blanco",0xffffff) );
		Config.codeColor.push( new DataColor("rojo",0xff0000) );
		Config.codeColor.push( new DataColor("naranja",0xFF8000) );
		Config.codeColor.push( new DataColor("amarillo",0xF3F781) );
		Config.codeColor.push( new DataColor("verde",0x81F781) );
		Config.codeColor.push( new DataColor("azul",0x2E64FE) );
		Config.codeColor.push( new DataColor("rosa",0xF5A9F2) );
		Config.codeColor.push( new DataColor("marron",0x8A4B08) );
		Config.codeColor.push( new DataColor("negro",0x000000) );
		
		
		
	}

}

