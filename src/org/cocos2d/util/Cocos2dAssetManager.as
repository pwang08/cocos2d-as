/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d.util
{
import starling.utils.AssetManager;

public class Cocos2dAssetManager extends AssetManager
{
    public function Cocos2dAssetManager()
    {
    }

    public function isInQueue(a_assetName:String):Boolean
    {
        var numElement:uint = queue.length;
        for (var i:uint = 0; i < numElement; ++ i)
        {
            if (queue[i].name == a_assetName)
            {
                return true;
            }
        }
        return false;
    }
}
}
