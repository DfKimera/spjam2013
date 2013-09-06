package characters {

	import engine.Character;
	import engine.Item;

	public class Curupira extends Character {

		[Embed("../../assets/character_curupira.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_curupira.png")]
		public var PORTRAIT_DEFAULT:Class;

		public function Curupira() {
			super();
			loadGraphic(SPRITE);
		}

		public override function setCharacterInfo():void {
			this.characterName = "Curupira";
			this.setPortraits({
				'default': [PORTRAIT_DEFAULT, false]
			});
		}

		public override function onInteract():void {

		}

		public override function onItemUse(item:Item):void {

		}

	}
}
