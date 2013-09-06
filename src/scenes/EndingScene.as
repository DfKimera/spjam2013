package scenes {

	import characters.Curupira;
	import characters.Sherlock;

	import engine.Dialog;

	import engine.Item;
	import engine.Prop;
	import engine.Scene;

	public class EndingScene extends Scene {

		[Embed(source="../../assets/scene_ending.png")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock;
		public var curupira:Curupira;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();
			curupira = new Curupira();

			Prop.placeOnScene(this, curupira, 540, 225);

			Dialog.show(this, sherlock, "Veja, Epson! Um capiroto!");
			Dialog.show(this, curupira, "Meu nome é Curupira!");
			Dialog.show(this, sherlock, "Você tem os pés pra trás!");
			var lastDialog:Dialog = Dialog.show(this, curupira, "Você que tem o corpo ao contrário!");
			lastDialog.onCloseCallback = function():void {
				Game.showEpilogue();
			};

		}

		override public function onPropInteract(prop:Prop):void {

		}

		override public function onItemUse(prop:Prop,item:Item):void {

		}

		override public function onItemPick(item:Item):void {

		}

		override public function onItemCombine(item1:Item,item2:Item):void {

		}

		override public function onBackgroundClick(x:int,y:int):void {

		}
	}
}
