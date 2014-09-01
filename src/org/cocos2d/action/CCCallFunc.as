/**
 * Created by alanmars on 14-9-1.
 */
package org.cocos2d.action
{
public class CCCallFunc extends CCActionInstant
{
    private var _innerFunc:Function;
    private var _thisObj:Object;
    private var _args:Array;

    public static function create(a_func:Function, a_thisObj:Object, ... a_args):CCCallFunc
    {
        var result:CCCallFunc = new CCCallFunc();
        result.initCallFunc(a_func, a_thisObj, a_args);
        return result;
    }

    public function CCCallFunc()
    {
    }

    public function initCallFunc(a_func:Function, a_thisObj:Object, a_args:Array):void
    {
        _innerFunc = a_func;
        _thisObj = a_thisObj;
        _args = a_args;
    }

    public override function update(a_durationRatio:Number):void
    {
        _innerFunc.apply(_thisObj, _args);
    }
}
}
