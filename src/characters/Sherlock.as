package characters {

	import engine.Character;
	import engine.Item;

	public class Sherlock extends Character {

		[Embed("../../assets/character_sherlock.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_sherlock.png")]
		public var PORTRAIT_DEFAULT:Class;

		public function Sherlock() {
			super();
			loadGraphic(SPRITE);
		}

		public override function setCharacterInfo():void {
			this.characterName = "Xerox Holmes";
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
