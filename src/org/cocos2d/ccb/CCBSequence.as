/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d.ccb
{
public class CCBSequence
{
    private var _duration:Number;
    private var _name:String;
    private var _sequenceId:int;
    private var _chainedSequenceId:int;
    private var _callbackChannel:CCBSequenceProperty;
    private var _soundChannel:CCBSequenceProperty;

    public function CCBSequence()
    {
        _duration = 0.0;
        _name = "";
        _sequenceId = 0;
        _chainedSequenceId = 0;
        _callbackChannel = null;
        _soundChannel = null;
    }

    public function get duration():Number
    {
        return _duration;
    }

    public function set duration(value:Number):void
    {
        _duration = value;
    }

    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        _name = value;
    }

    public function get sequenceId():int
    {
        return _sequenceId;
    }

    public function set sequenceId(value:int):void
    {
        _sequenceId = value;
    }

    public function get chainedSequenceId():int
    {
        return _chainedSequenceId;
    }

    public function set chainedSequenceId(value:int):void
    {
        _chainedSequenceId = value;
    }

    public function get callbackChannel():CCBSequenceProperty
    {
        return _callbackChannel;
    }

    public function set callbackChannel(value:CCBSequenceProperty):void
    {
        _callbackChannel = value;
    }

    public function get soundChannel():CCBSequenceProperty
    {
        return _soundChannel;
    }

    public function set soundChannel(value:CCBSequenceProperty):void
    {
        _soundChannel = value;
    }
}
}
