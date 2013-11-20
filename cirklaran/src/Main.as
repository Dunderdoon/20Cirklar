package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Dunderdoon
	 */
	public class Main extends Sprite 
	{
		
		
		public var theCircle:Sprite = new Sprite();
		public var Circles:Array = new Array();
		public var Score:int = 0;
		public var ScoreBoard:TextField = new TextField();
		public var test:int = 1;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			ScoreBoard.text = Score.toString();
			ScoreBoard.x = 600;
			ScoreBoard.border = true;
			addChild(ScoreBoard);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, gameReset);
			
		}
		
		
		
		
		
		
		public function corruptCircle(m:MouseEvent):void //korrupta cirkelns funktion.
		{
			Score = -1;
			
			

		}
		
	
		
		public function addScoreAndRemove(e:MouseEvent):void //funktionen som gör att när man trycker på en "frisk" cirkel så åker den iväg och så får man poäng"
		{
			e.target.x = 50000;
			Score ++;
			if (e.target.x == 50000) 
			{
				ScoreBoard.text = Score.toString();
			}
			
		}
		
		public function gameReset(k:KeyboardEvent):void  //resetar och startar med space.
		{
			if (k.keyCode == 32) 
			{
				
			
			for (var i:int = 0; i < 20; i++) //här är alla cirklar som man får poäng av.
				{
						var s:Sprite = new Sprite();
						s.graphics.beginFill(Math.random() * 0xffffff);
						s.graphics.drawCircle(100, 100, 50);
						s.graphics.endFill();
						s.x = Math.random() * 500;
						s.y = Math.random() * 500;
						addChild(s);
						Circles.push(s);
						s.addEventListener(MouseEvent.CLICK, addScoreAndRemove);
						
				
						if (i == 10) //korrupta cirkeln kmr här.
						{
							s.graphics.beginFill(Math.random() * 0xFFFFFF);
							s.graphics.drawCircle(100, 100, 50);
							s.graphics.endFill();
							s.x = Math.random() * 500;
							s.y = Math.random() * 500;
							addChild(s);
							Circles.push(s);
							s.addEventListener(MouseEvent.CLICK, corruptCircle);
							
							
						}
				
				
				
				}
				
			}

		}
		
		
		
		
		
		
	}
	
}