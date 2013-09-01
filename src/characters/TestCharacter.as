package characters {

	import engine.Character;
	import engine.Item;

	public class TestCharacter extends Character {

		[Embed("../../assets/prop_testcharacter.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_testcharacter.jpg")]
		public var PORTRAIT_DEFAULT:Class;

		public function TestCharacter() {
			super();
			loadGraphic(SPRITE);
		}

		public override function setCharacterInfo():void {
			this.characterName = "Test Character";
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
