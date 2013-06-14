package {

import com.betweenpageandscreen.template.BookTemplate;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import com.betweenpageandscreen.binding.config.BookConfig;

[SWF(frameRate="31")]
public class BPSTemplate extends Sprite {

  public function BPSTemplate() {
    addEventListener(Event.ADDED_TO_STAGE, init);
  }

  public function init(event:Event=null):void {

    removeEventListener(Event.ADDED_TO_STAGE, init);

    stage.scaleMode = StageScaleMode.NO_SCALE;
    stage.align = StageAlign.TOP_LEFT;

    stage.quality = BookConfig.QUALITY;
    stage.frameRate = BookConfig.FPS;

    addChild( new BookTemplate());

  }
}
}