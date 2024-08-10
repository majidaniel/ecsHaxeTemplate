package utils;

import kha.Assets;
import components.Sprite;

class AssetHelper {
	// Get Sprite object keeping original aspect ratio
	static public function getSprite(spritePath:String, widthPixels:Float):Sprite {
		var imgAsset = Assets.images.get(spritePath);
		var assetWidth = imgAsset.width;
		var scale = widthPixels / assetWidth;
		var sprite:Sprite = {assetPath: spritePath, scaleX: scale, scaleY: scale};

		return sprite;
	}

	// Get Sprite object overriding original aspect ratio
	static public function getSpriteWithCustomAspectRatio(spritePath:String, widthPixels:Float, heightPixels:Float):Sprite {
		var imgAsset = Assets.images.get(spritePath);
		var assetWidth = imgAsset.width;
		var assetHeight = imgAsset.height;
		var sprite:Sprite = {assetPath: spritePath, scaleX: widthPixels / assetWidth, scaleY: heightPixels / assetHeight};

		return sprite;
	}
}
