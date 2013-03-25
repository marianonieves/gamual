package Configuration
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import __AS3__.vec.Vector;
	
	public class Configuration implements IEventDispatcher {
		
		private var xml:XML;
		private var loader:URLLoader;
		
		function Configuration(xml:Object=null) {
			this.xml = new XML(xml);
			this.xml.ignoreWhitespace = true;
			eventDispatcher = new EventDispatcher();
		}
		
		/**
		 * load configurations from an xml file
		 * @param	source (String) url of the xml file
		 */
		public function load(source:String):void
		{
			loader = new URLLoader(new URLRequest(source) );
			loader.addEventListener(Event.COMPLETE, loader_onComplete);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, loader_onStatus);
			loader.addEventListener(IOErrorEvent.IO_ERROR , loader_onError);
		}
		
		
		
		/**
		* returns a Configuration object with the node off the key
		* 
		* @param key (String) key parameter.
		* @return Configuration
		*/
		public function getGroup(id:String):Configuration
		{
			var node:XML = xml..config.(@id == id)[0];
			
			if (!node) {
				Config.logger.error("GROUP '" + id + "' Not Found" )
				return new Configuration();
			}
			return new Configuration(node);
		}
		
		
		/**
		* returns an Array with all values of nodes
		* 
		* @param key (String) key parameter.
		* @return Array
		*/
		public function getGroupAsArrayOfValues(id:String):Array
		{
			// trace("Configuration.getGroupAsArray(), id: " + id );
			
			var keys:Array = new Array();
			
			var node:XML = xml..config.(@id == id)[0];
			
			for each (var child:XML in node.elements()) 
			{
				// trace("Configuration.getGroupAsArray(), child: " + child.@value );
				keys.push( child.@value );
			}			
			return keys;
		}
		
		/**
		* returns an Array with objects with .key and .value
		* 
		* @param id (String) key parameter.
		* @return Array
		*/
		public function getGroupAsArrayOfObjects(id:String):Vector.<Resource>
		{
			// trace("Configuration.getGroupAsArray(), id: " + id );
			
			var keys:Vector.<Resource> = new Vector.<Resource>();
			
			var node:XML = xml..config.(@id == id)[0];
			
			for each (var child:XML in node.elements()) 
			{
				// trace("Configuration.getGroupAsArray(), child: " + child.@value );
				keys.push(new Resource(String(child.@key), String(child.@value)) );
			}			
			return keys;
		}
		
		public function getGroupAsArrayOfKeys(id:String):Array
		{
			// trace("Configuration.getGroupAsArray(), id: " + id );
			
			var keys:Array = new Array();
			
			var node:XML = xml..config.(@id == id)[0];
			
			for each (var child:XML in node.elements()) 
			{
				// trace("Configuration.getGroupAsArray(), child: " + child.@value );
				keys.push(String(child.@key) );
			}			
			return keys;
		}

		/**
		* returns the value of the key
		* 
		* @param key (String) key parameter.
		* @return String
		*/
		public function getKey(key:String):String {
			var node:XML = xml..item.(@key == key)[0];
			if (!node) return null;
			return node.@value;
		}
		
		/**
		* returns the nodeValue of the key
		* 
		* @param key (String) key parameter.
		* @return String
		*/
		public function getNodeValue(key:String):String {
			var node:XML = xml..item.(@key == key)[0];
			if (!node) return null;
			return node;
		}
		
		//{ Events
		private function loader_onComplete(e:Event):void
		{
			xml = new XML(loader.data);
			xml.ignoreWhitespace = true;
			dispatchEvent(e);
		}
		private function loader_onStatus(e:HTTPStatusEvent):void 
		{
			dispatchEvent(e);
		}
		private function loader_onError(e:IOErrorEvent):void 
		{
			dispatchEvent(e);
		}
		//}

		
		//{ EventDispatcher implementation
		private var eventDispatcher:EventDispatcher;
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		public function dispatchEvent(event:Event):Boolean {
			return eventDispatcher.dispatchEvent(event);
		}
			   
		public function hasEventListener(type:String):Boolean {
			return eventDispatcher.hasEventListener(type);
		}
			   
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			eventDispatcher.removeEventListener(type, listener, useCapture);
		}
			   
		public function willTrigger(type:String):Boolean {
			return eventDispatcher.willTrigger(type);
		}
		//}

	}	
}

class Resource
{
	public var key:String;
	public var value:String;
	
	public function Resource(key,value)
	{
		this.key = key;
		this.value = value;
	}
	
}
