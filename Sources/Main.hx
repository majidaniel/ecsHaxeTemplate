package;

import systems.GameSystem;
import systems.RenderSystem;
import singletonComponents.SingletonComponentsManager;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {
	static function update():Void {}

	static function render(frames:Array<Framebuffer>):Void {}

	public static function main() {
		System.start({title: "Project", width: 1024, height: 768}, function(_) {
			// Init our singleton components

			Assets.loadEverything(function() {
				var renderSystem = new RenderSystem();
				renderSystem.activate();
				System.notifyOnFrames(function(fbs:Array<Framebuffer>) {
					renderSystem.render(fbs[0]);
				});

				var gameSystem = new GameSystem();
				gameSystem.activate();
				Scheduler.addTimeTask(gameSystem.update, 0, 1 / 60);
			}, function(item) {
				//trace(item);
				return true;
			}, function(soundItem) {
				//trace(soundItem);
				return true;
			}, function(err) {
				trace("Error loading asset:");
				trace(err);
			});
		});
	}
}
