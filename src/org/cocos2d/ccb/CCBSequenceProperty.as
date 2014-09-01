/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d.ccb
{
public class CCBSequenceProperty
{
    private var _name:String;
    private var _type:int;
    private var _keyframes:Vector.<CCBKeyframe>;

    public function CCBSequenceProperty()
    {
        _name = "";
        _type = 0;
        _keyframes = new Vector.<CCBKeyframe>();
    }


    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        _name = value;
    }

    public function get type():int
    {
        return _type;
    }

    public function set type(value:int):void
    {
        _type = value;
    }

    public function get keyframes():Vector.<CCBKeyframe>
    {
        return _keyframes;
    }
}
}
