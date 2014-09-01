/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCRepeat extends CCActionInterval
{
    private var _innerAction:CCFiniteTimeAction;
    private var _times:uint;
    private var _elapsedTotalTimes:uint;
    private var _nextInnerRatio:Number;

    public static function create(a_action:CCFiniteTimeAction, a_times:uint):CCRepeat
    {
        var result:CCRepeat = new CCRepeat();
        result.initRepeat(a_action, a_times);
        return result;
    }

    public function CCRepeat()
    {
    }

    public function initRepeat(a_action:CCFiniteTimeAction, a_times:uint)
    {
        var totalDuration = a_action.duration * a_times;
        super.initActionInterval(totalDuration);
        _innerAction = a_action;
        _times = a_times;
        _elapsedTotalTimes = 0;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        _elapsedTotalTimes = 0;
        _nextInnerRatio = _innerAction.duration/duration;
        super.startWithTarget(a_target);
        _innerAction.startWithTarget(a_target);
    }

    public override function update(durationRatio:Number):void
    {
        if (durationRatio >= _nextInnerRatio)
        {
            while (durationRatio > _nextInnerRatio && _elapsedTotalTimes < _times)
            {
                _innerAction.update(1.0);
                ++ _elapsedTotalTimes;

                _innerAction.startWithTarget(target);
                _nextInnerRatio += _innerAction.duration / duration;
            }

            if (durationRatio >= 1.0 && _elapsedTotalTimes < _times)
            {
                ++ _elapsedTotalTimes;
            }

            if (_elapsedTotalTimes == _times)
            {
                _innerAction.update(1.0);
            }
        }
        else
        {
            _innerAction.update((durationRatio * _times) % 1.0);
        }
    }

    public override function get isDone():Boolean
    {
        return _elapsedTotalTimes == _times;
    }
}
}
