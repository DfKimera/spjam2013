package characters {

	import engine.Character;
	import engine.Item;

	import org.flixel.FlxG;

	public class Curupira extends Character {

		[Embed("../../assets/character_curupira.png")]
		public var SPRITE:Class;

		[Embed("../../assets/portrait_curupira.png")]
		public var PORTRAIT_DEFAULT:Class;

		[Embed("../../assets/voice/curupira_me.mp3")]
		public var SOUND_ME:Class;
		[Embed("../../assets/voice/curupira_you.mp3")]
		public var SOUND_YOU:Class;

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

	}
}
