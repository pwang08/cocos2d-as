/**
 * Created by alanmars on 14-8-27.
 */
package org.cocos2d
{

public class CCDirector extends CCNode
{
    private static var _instance:CCDirector = null;
    private static var _hasInited:Boolean = false;

    public static function get instance():CCDirector
    {
        if (!_hasInited)
        {
            _instance.init();
            _hasInited = true;
        }
        return _instance;
    }

    public function CCDirector()
    {
        if (_instance != null)
        {
            throw new Error("Singleton, use CCDirector.instance instead!");
        }
        _instance = this;
    }

    public function runWithScene(scene:CCScene):void
    {
        addChildV1(scene);
    }
}
}
