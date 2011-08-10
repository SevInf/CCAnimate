package com.goodnamesaretaken.CCAnimate
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	
	[RemoteClass]
	[Bindable]
	public class Frame extends Object implements IExternalizable
	{
		public var name: String;
		 
		public var bitmapData: BitmapData;
		
		private var _filePath: String; 
		
		public static function fromFile(f: File): Frame {
			var result: Frame = new Frame();
			result.name = f.name;
			result._filePath = f.nativePath;
			result.loadBitmapData();
			return result;
			
		}
		
		private function loadBitmapData(): void {
			var request: URLRequest = new URLRequest(new File(_filePath).url);
			
			var loader: Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e: Event):void {
				bitmapData = Bitmap(e.target.content).bitmapData;
				loader.unload();
			});
			loader.load(request);;
		}
		
		public function get originalPath(): String {
			return _filePath;
		}
		
		
		public function readExternal(input:IDataInput):void { 
			name = input.readObject();
			_filePath = input.readObject();
			loadBitmapData();
			
		} 
		
		public function writeExternal(output:IDataOutput):void { 
			output.writeObject(name);
			output.writeObject(_filePath);
		} 
	
	}
}