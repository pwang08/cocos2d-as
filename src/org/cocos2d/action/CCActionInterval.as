/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import flash.utils.getQualifiedClassName;

import org.cocos2d.CCNode;

import starling.errors.AbstractClassError;

public class CCActionInterval extends CCFiniteTimeAction
{
    public static const EPSILON:Number = 0.0001;

    protected var _elapsedTime:Number;
    protected var _firstTick:Boolean;

    public function CCActionInterval()
    {
        if (getQualifiedClassName(this) == "org.cocos2d.action::CCActionInterval")
        {
            throw new AbstractClassError();
        }
    }

    public function initActionInterval(a_duration:Number):void
    {
        _duration = a_duration;
        if (_duration == 0)
        {
            _duration = EPSILON;
        }
        _elapsedTime = 0;
        _firstTick = true;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _elapsedTime = 0;
        _firstTick = true;
    }

    public override function advanceTime(time:Number):void
    {
        if (_firstTick)
        {
            _firstTick = false;
            _elapsedTime = 0;
        }
        else
        {
            _elapsedTime += time;
        }

        var durationRatio:Number = Math.max(0, Math.min(1, _elapsedTime/Math.max(_duration, EPSILON)));
        update(durationRatio);
    }

    public function get elapsedTime():Number
    {
        return _elapsedTime;
    }

    public override function get isDone():Boolean
    {
        return _elapsedTime >= _duration;
    }
}
}
