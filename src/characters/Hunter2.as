package characters {

	import engine.Character;

	import org.flixel.FlxG;

	public class Hunter2 extends Character {

		[Embed("../../assets/character_hunter2.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_hunter2.png")]
		public var PORTRAIT_DEFAULT:Class;


		[Embed("../../assets/voice/hunter2_hole.mp3")]
		public var SOUND_HOLE:Class;
		[Embed("../../assets/voice/hunter2_dialog.mp3")]
		public var SOUND_DIALOG:Class;

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
