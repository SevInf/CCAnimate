package com.goodnamesaretaken.CCAnimate
{
	import mx.collections.ArrayList;
	
	[Bindable]
	public class Animation
	{
		public var name: String;
		public var frameInterval: Number;
		public var frames:ArrayList = new ArrayList();
		
		public function Animation()
		{
		}
		
	}
}