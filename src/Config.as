package
{
	public class Config
	{
		public static var snapshotRefreshTime:Number=500;
		public static var snapshotScale:Number = .1;
		public static var delayedCallTime:Number=1000;
		public static var showDebugTools:Boolean=false;
		
		public static var similarityTolerance:Number=0.05;
		
		// blanco, rojo , naranja , amarillo, verde, azul, rosa, marron, negro
		// public static var codeColor:Array = new Array(0xffffff, 0xff0000, 0xFF6600, 0xFFFF00, 0x00ff00, 0x0000ff, 0xFF33FF, 0x996633, 0x000000 );

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

