package com.betweenpageandscreen.template {

import com.betweenpageandscreen.binding.events.BookEvent;
import com.betweenpageandscreen.binding.bootstrapper.Bootstrapper;
import com.betweenpageandscreen.binding.models.Pages;
import com.betweenpageandscreen.binding.views.Book;
import com.betweenpageandscreen.binding.views.pages.Epistle;
import com.bradwearsglasses.utils.helpers.SpriteHelper;

import flash.display.Sprite;

public class BookTemplate extends Sprite {

  // The book is the video view that looks
  // for markers and displays the 3D objects
  private var book:Book;

  // Bootstrapper inits all data and parameters
  // necessary to run the app.
  private var bootstrapper:Bootstrapper;

  // This is the rare chance to read actual poetry in code.
  // written by Amaranth Borsuk
  private var dear_s:String =
      "Dear S,\nI fast, I fasten to become compact,\n" +
      "but listen, that's only part your \n" +
      "impact—I always wanted to fit a\n" +
      "need. It's my character to pin,\n" +
      "impinge, a twinge of jealousy (that\n" +
      "fang tattoo). Last night on the patio,\n" +
      "poco a poco, a patois between us,\n" +
      "unseemly and peasant (pleasant).\n" +
      "Let's spread out the pentup moment,\n" +
      "pentimento memento. A pact: our\n" +
      "story's spinto—no more esperanto.\n" +
      "—P";

  public function BookTemplate() {

    //Create a new epistle by passing a text string to it.
    var epistle = new Epistle(dear_s);

    // Set up pages. Here we're using the same text
    // for all 17 markers, but you can add custom strings
    // or your own types of pages (dig into bps-binding for how).
    var i:Number = -1;
    while (++i < 17) {
      Pages.PAGES.push(epistle);
    }

    // Create new bootstrapper from the BPS Binder library.
    // The bootstrapper will take care of setting up the interface. 
    bootstrapper = new Bootstrapper(this);

    // Set listeners on bootstrapper. You may want to handle these with UI elements.
    // You could also tie this into a micro-architecture like robotlegs.
    // To keep it simple and un-opinionated, this demo just traces out the events
    // without building an interface.
    bootstrapper.addEventListener(BookEvent.BOOTSTRAP_STATUS, update_status);
    bootstrapper.addEventListener(BookEvent.BOOTSTRAP_ERROR, bootstrap_error);
    bootstrapper.addEventListener(BookEvent.BOOTSTRAP_COMPLETE, start);

    //Start bootstrapper
    bootstrapper.start();

    //Attach it to the stage
    SpriteHelper.add_these(this,bootstrapper.book)
  }

  // Handler that traces out results from bootstrapper.
  // You might want to add your own UI here.
  private function update_status(event:BookEvent):void {
    if (event.data && event.data['msg']) {
      trace("## Bootstrap Status: " + event.data['msg']);
    } else {
      trace("## Bootstrap Status: no message");
    }
  }

  // You'll want to handle these.
  private function bootstrap_error(event:BookEvent):void {
    trace("## Shoot! Bootstrap error:");
    trace(event.data);
  }

  // Bootstrap is complete and the app is listening for markers.
  // You can add new behavior here.
  private function start(event:BookEvent):void {
    trace("## Bootstrap complete. Listening for markers...");
  }

}
}
