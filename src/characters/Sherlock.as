package characters {

	import engine.Character;
	import engine.Item;

	import org.flixel.FlxG;

	public class Sherlock extends Character {

		[Embed("../../assets/character_sherlock.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_sherlock.png")]
		public var PORTRAIT_DEFAULT:Class;

		[Embed("../../assets/voice/sherlock_dialog.mp3")]
		public var SOUND_DIALOG:Class;
		[Embed("../../assets/voice/sherlock_surprise.mp3")]
		public var SOUND_SURPRISE:Class;
		[Embed("../../assets/voice/sherlock_taunt.mp3")]
		public var SOUND_TAUNT:Class;
		[Embed("../../assets/voice/sherlock_wonder.mp3")]
		public var SOUND_WONDER:Class;

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

	}
}
