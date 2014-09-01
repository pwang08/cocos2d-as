/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCRepeatForever extends CCActionInterval
{
    private var _innerAction:CCActionInterval;

    public static function create(a_innerAction:CCActionInterval):CCRepeatForever
    {
        var result:CCRepeatForever = new CCRepeatForever();
        result.initRepeatForever(a_innerAction);
        return result;
    }

    public function CCRepeatForever()
    {
    }

    public function initRepeatForever(a_innerAction:CCActionInterval)
    {
        _innerAction = a_innerAction;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _innerAction.startWithTarget(a_target);
    }

    public override function advanceTime(time:Number):void
    {
        _innerAction.advanceTime(time);
        if (_innerAction.isDone)
        {
            var diffTime:Number = _innerAction.elapsedTime - _innerAction.duration;
            _innerAction.startWithTarget(target);
            _innerAction.advanceTime(0.0);
            _innerAction.advanceTime(diffTime);
        }
    }

    public override function get isDone():Boolean
    {
        return false;
    }
}
}
