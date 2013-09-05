package characters {

	import engine.Character;

	public class Hunter3 extends Character {

		[Embed("../../assets/character_hunter3.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_hunter3.png")]
		public var PORTRAIT_DEFAULT:Class;


		public function Hunter3() {
			super();
			loadGraphic(SPRITE, true, false, 151, 179);
			addAnimation("jailed", [0]);
			addAnimation("released", [1]);
			play("jailed")
		}

		public override function setCharacterInfo():void {
			this.characterName = "Caçador";
			this.setPortraits({
				'default': [PORTRAIT_DEFAULT, false]
			});
		}

	}
}
