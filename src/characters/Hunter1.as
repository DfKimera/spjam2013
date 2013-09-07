package characters {

	import engine.Character;

	public class Hunter1 extends Character {

		[Embed("../../assets/character_hunter1.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_hunter1.png")]
		public var PORTRAIT_DEFAULT:Class;
		[Embed("../../assets/portrait_hunter1_hanging.png")]
		public var PORTRAIT_HANGING:Class;

		[Embed("../../assets/voice/hunter1_cry.mp3")]
		public var SOUND_CRY:Class;
		[Embed("../../assets/voice/hunter1_dialog.mp3")]
		public var SOUND_DIALOG:Class;
		[Embed("../../assets/voice/hunter1_thanks.mp3")]
		public var SOUND_THANKS:Class;

		public function Hunter1() {
			super();
			loadGraphic(SPRITE, true, false, 161, 516);
			addAnimation("hanging", [0]);
			addAnimation("sitting", [1]);
			play("hanging");
		}

		public override function setCharacterInfo():void {
			this.characterName = "Caçador";
			this.setPortraits({
				'default': [PORTRAIT_DEFAULT, false],
				'hanging': [PORTRAIT_HANGING, false]
			});
		}


	}
}
