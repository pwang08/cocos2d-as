/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d
{
import org.cocos2d.util.Cocos2dAssetManager;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class CCSpriteFrame
{
    private var _assets:Cocos2dAssetManager;
    private var _spriteSheet:String;
    private var _spriteFile:String;
    private var _texture:Texture;
    private static var _s_spriteBatchEnabled:Boolean = true;

    public function CCSpriteFrame(a_assets:Cocos2dAssetManager, a_spriteSheet:String, a_spriteFile:String)
    {
        _assets = a_assets;
        _spriteSheet = a_spriteSheet;
        _spriteFile = a_spriteFile;
        _texture = null;
        if (_spriteSheet.length == 0)
        {
            if (_s_spriteBatchEnabled)
            {
                var spriteFilename:String = _spriteFile;
                var pos:int = spriteFilename.lastIndexOf("/") + 1;
                if (pos > 0)
                {
                    spriteFilename = spriteFilename.substring(pos);
                }
                _texture = _assets.getTexture(spriteFilename);
                if (_texture != null)
                {
                    return;
                }
            }
            _texture = _assets.getTexture(_spriteFile);
            if (_texture == null)
            {
                if (_assets.isInQueue(_spriteFile) == false)
                {
                    _assets.enqueueWithName(_spriteFile, _spriteFile);
                }
            }
        }
        else
        {
            var spriteFrames:TextureAtlas = _assets.getTextureAtlas(_spriteSheet);
            if (spriteFrames == null)
            {
                if (_assets.isInQueue(_spriteSheet) == false)
                {
                    _assets.enqueueWithName(_spriteSheet, _spriteSheet);
                }
            }
        }
    }

    public function getTexture():Texture
    {
        if (_texture != null)
        {
            return _texture;
        }
        if (_spriteSheet.length == 0)
        {
            if (_texture == null)
            {
                _texture = _assets.getTexture(_spriteFile);
                return _texture;
            }
            return _texture;
        }
        else
        {
            var spriteFrames:TextureAtlas = _assets.getTextureAtlas(_spriteSheet);
            if (spriteFrames != null)
            {
                _texture = spriteFrames.getTexture(_spriteFile);
                return _texture;
            }
        }
        return null;
    }
}
}
