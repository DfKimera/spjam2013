package {

import flash.display.Sprite;
import flash.text.TextField;

public class Bootstrap extends Sprite {
    public function Bootstrap() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
    }
}
}
