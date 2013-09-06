package scenes {

	import characters.Hunter3;
	import characters.Sherlock;

	import engine.Dialog;

	import engine.Inventory;

	import engine.Item;
	import engine.Portal;
	import engine.Prop;
	import engine.Scene;

	import items.Hook;
	import items.Key2;
	import items.RopeHook;

	import props.Glint;

	import props.Rack;
	import props.RackUsed;

	public class ForestTree extends Scene {

		[Embed(source="../../assets/scene_tree.png")]
		public var BACKGROUND:Class;

		public var sherlock:Sherlock = new Sherlock();
		public var hunter:Hunter3 = new Hunter3();

		public static var visited:Boolean = false;
		public static var rackUsed:Boolean = false;
		public static var keyObtained:Boolean = false;
		public static var cleared:Boolean = false;

		public override function prepare():void {
			setBackground(BACKGROUND);
			setFadeInDelay(1);
		}

		public override function create():void {

			super.create();

			sherlock = new Sherlock();

			if(!rackUsed) {
				Prop.placeOnScene(this, new Rack(), 630, 240);
			} else {
				Prop.placeOnScene(this, new RackUsed(), 630, 240);
			}

			if(!keyObtained) {
				Prop.placeOnScene(this, new Glint(), 350, 40);
			}

			Prop.placeOnScene(this, hunter, 50, 240);

			if(cleared) {
				hunter.play("released");
			}

			Portal.placeOnScene(this, "Vilarejo", 0, 540, 800, 60, VillageScene);

			visited = true;

		}

		override public function onPropInteract(prop:Prop):void {
			if(prop is Rack && !rackUsed) {
				Inventory.addToInventory(new Hook());
				Prop.placeOnScene(this, new RackUsed(), 630, 240);
				prop.remove();
				rackUsed = true;
				Dialog.show(this, sherlock, "Epson, pare de pegar coisas que não são suas! Por acaso é um ladrão?");
				return;
			}

			if(prop is Glint) {
				Dialog.show(this, sherlock, "Olhos de lince, Epson! Mas, como vamos pegá-la?");
				return;
			}

			if(prop is Hunter3 && !cleared) {
				Dialog.show(this, hunter, "Me tirem daqui!!");
				return;
			}

			if(prop is Hunter3 && cleared) {
				var dialog:Dialog = Dialog.show(this, hunter, "Aquele maldito, com os pés virados pra trás! Ele que me trancou aqui!");
				Sketch.show(this, "feet", dialog);
				Dialog.show(this, sherlock, "Pés virados!? Epson, estavamos andando ao contrário desde o começo!");
			}
		}

		override public function onItemUse(prop:Prop,item:Item):void {
			if(item is RopeHook && prop is Glint && !keyObtained) {
				prop.remove();
				item.consume();
				Inventory.addToInventory(new Key2());
				keyObtained = true;
				Dialog.show(this, sherlock, "Excelente mira, Epson!");
				return;
			}

			if(item is Hook && prop is Glint) {
				Dialog.show(this, sherlock, "O gancho não alcança... precisamos dar um jeito de conseguir alcançar e puxar de volta...");
				return;
			}

			if(item is Key2 && prop is Hunter3) {
				cleared = true;
				hunter.play("released");
				item.consume();
				Dialog.show(this, hunter, "Ahh! Obrigado!");
				return;
			}

			Dialog.show(this, sherlock, "Não vejo como isso poderia ajudá-lo, Epson...");
		}
	}
}
