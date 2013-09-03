package characters {

	import engine.Character;

	public class Hunter2 extends Character {

		[Embed("../../assets/character_hunter2.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_hunter2.png")]
		public var PORTRAIT_DEFAULT:Class;


		public function Hunter2() {
			super();
			loadGraphic(SPRITE);
		}

		public override function setCharacterInfo():void {
			this.characterName = "Caçador";
			this.setPortraits({
				'default': [PORTRAIT_DEFAULT, false]
			});
		}

	}
}
