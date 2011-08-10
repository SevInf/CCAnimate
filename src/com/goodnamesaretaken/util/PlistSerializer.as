package com.goodnamesaretaken.util
{
	
	internal class PlistSerializer
	{
		
		internal static function serializeRootObject(rootObject:*): XML {
			var plist: XML = <plist version="1.0" />;
			serializeObject(rootObject, plist);
			return plist;
		}
		
		private static function serializeObject(object:*, rootXML: XML):void {
			if (object is Array) {
				serializeArray(object as Array, rootXML);
			} else if (object is String) {
				serializeString(String(object), rootXML);		
			} else if (object is Boolean) { 
				serializeBoolean(Boolean(object), rootXML);
			} else if (object is Number) {
				serializeNumber(Number(object), rootXML)
			} else {
				serializeComplexObject(object, rootXML);
			}
		}
		
		private static function serializeArray(array: Array,  rootXML: XML):void {
			var arrayXML:XML = <array />;
			for each (var object:* in array) {
				serializeObject(object, arrayXML);
			}
			rootXML.appendChild(arrayXML);
		}
		
		private static function serializeString(string: String, rootXML: XML):void {
			var stringXML:XML = <string></string>;
			stringXML.appendChild(string);
			rootXML.appendChild(stringXML);
		}
		
		private static function serializeBoolean(bool: Boolean, rootXML: XML):void {
			if (bool) {
				rootXML.appendChild(<true />);
			} else {
				rootXML.appendChild(<false />);
			}
		}
		
		private static function serializeNumber(number: Number, rootXML: XML):void {
			var numberXML: XML;
			if (number is int || number is uint) {
				numberXML = <integer />;
			} else {
				numberXML = <real />
			}
			numberXML.appendChild(number);
			rootXML.appendChild(numberXML);	
		}
		
		private static function serializeComplexObject(object:*, rootXML: XML):void {
			var objectXML: XML = <dict />;
			for (var key:String in object) {
				var keyNode: XML = <key />;
				keyNode.appendChild(key);
				objectXML.appendChild(keyNode);
				serializeObject(object[key], objectXML);		
			}
			rootXML.appendChild(objectXML);
		}
		
	}
}