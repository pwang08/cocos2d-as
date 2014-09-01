/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d.ccb
{
public class CCBKeyframe
{
    private var _value:Object;
    private var _time:Number;
    private var _easingType:int;
    private var _easingOpt:Number;

    public function CCBKeyframe()
    {
        _value = null;
        _time = 0.0;
        _easingType = 0;
        _easingOpt = 0.0;
    }

    public function get value():Object
    {
        return _value;
    }

    public function set value(a_value:Object):void
    {
        _value = a_value;
    }

    public function get time():*
    {
        return _time;
    }

    public function set time(value):void
    {
        _time = value;
    }

    public function get easingType():*
    {
        return _easingType;
    }

    public function set easingType(value):void
    {
        _easingType = value;
    }

    public function get easingOpt():*
    {
        return _easingOpt;
    }

    public function set easingOpt(value):void
    {
        _easingOpt = value;
    }
}
}
