package com.goodnamesaretaken.util
{
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	
	public class PlistUtils
	{
		static public function saveObject(rootObject:*, f: File):void {
			var plist: XML = PlistSerializer.serializeRootObject(rootObject);
			var fileStream: FileStream = new FileStream();
			
			fileStream.open(f, FileMode.WRITE);
			fileStream.writeUTFBytes('<?xml version="1.0" encoding="UTF-8"?>');
			fileStream.writeUTFBytes('<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">');
			fileStream.writeUTFBytes(plist.toXMLString());
			
			fileStream.close();
			
		}
	}
}