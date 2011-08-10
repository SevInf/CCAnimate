package com.goodnamesaretaken.CCAnimate
{
	import mx.collections.ArrayList;
	
	[Bindable]
	public class Animation
	{
		public var name: String;
		public var frameInterval: Number;
		private var _frames:ArrayList = new ArrayList();
		
		public function Animation()
		{
		}
		
		public function get frames(): ArrayList {
			return _frames;
		}
		
		
	}
}