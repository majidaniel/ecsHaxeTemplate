package systems;

import macros.Assert;
import kha.Framebuffer;
import echoes.System;
import echoes.View;
import echoes.Entity;
import kha.Assets;
import components.Position;
import components.Sprite;
import singletonComponents.SingletonComponentsManager;
import singletonComponents.Camera;
import haxe.ui.core.Screen;

class RenderSystem extends echoes.System {
	// Create views based on Components
	// TODO: try getView, may not need to activate echoes?
	private var spriteView:View<Position, Sprite> = getLinkedView(Position, Sprite);
	private var screen:Screen;
	private var camera:Camera;

	public function new() {
		// Iniitialize haxe ui screen
		screen = Screen.instance;
		this.camera = SingletonComponentsManager.instance.get(SingleComponentType.Camera);
	}

	public function render(fb:Framebuffer) {
		// g2 drawing interface, g1 & g4 also available
		final g2 = fb.g2;

		// Clear frame
		g2.begin(true, Color.fromBytes(255, 255, 255));

		// sort sprites
		var entArr:Array<Entity> = this.renderOrderSort(spriteView.entities.copy());

		// Push camera translation
		g2.pushTranslation(camera.x, camera.y);

		// Handle Sprites
		for (entity in entArr) {
			var position:Position = entity.get(Position);
			var sprite:Sprite = entity.get(Sprite);
			var img = Assets.images.get(sprite.assetPath);
			Assert.assert(img != null && img.width != null && img.height != null && sprite.assetPath != '');
			g2.pushScale(sprite.scaleX, sprite.scaleY);
			g2.pushTranslation(position.x, position.y);
			// Sprite origins are center of mass touching the ground
			g2.drawImage(img, -1 * img.width / 2, -1 * img.height);
			g2.popTransformation();
			g2.popTransformation();
		}

		// Pop camera translation
		g2.popTransformation();

		// Handle UI
		screen.renderTo(g2);

		// Finish the drawing operations
		g2.end();
	}

	// Sorting function for layering sprites
	private function renderOrderSort(entArr:Array<Entity>) {
		entArr.sort(function(a, b) {
			if (a.get(Position).y < b.get(Position).y)
				return -1;
			if (a.get(Position).y == b.get(Position).y)
				return 0;
			return 1;
		});

		return entArr;
	}

	// When UI entity is generated, add to Haxe UI
	/*@:add private function onUiComponentAdded(uiComponent:UiComponent):Void {
		this.uiList.add(uiComponent);
		this.screen.addComponent(uiComponent.component);
	}*/
}
