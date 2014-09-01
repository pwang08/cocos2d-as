/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCSequence extends CCActionInterval
{
    private var _innerActions:Vector.<CCFiniteTimeAction>;   //length=2
    private var _splitRatio:Number;
    private var _lastActionIndex:int;

    public static function create(a_action1:CCFiniteTimeAction, ... a_restActions):CCSequence
    {
        if (a_restActions.length > 0)
        {
            var result:CCFiniteTimeAction = a_action1;
            for (var i:int = 0; i < a_restActions.length; ++ i)
            {
                result = createWithTwoActions(result, a_restActions[i]);
            }
            return result as CCSequence;
        }
        else
        {
            return createWithTwoActions(a_action1, CCDummyFiniteTimeAction.create());
        }
    }

    public static function createWithTwoActions(a_action1:CCFiniteTimeAction, a_action2:CCFiniteTimeAction):CCSequence
    {
        var result:CCSequence = new CCSequence();
        result.initSequenceWithTwoActions(a_action1, a_action2);
        return result;
    }

    public function CCSequence()
    {
        _innerActions = new Vector.<CCFiniteTimeAction>();
    }

    public function initSequenceWithTwoActions(a_action1:CCFiniteTimeAction, a_action2:CCFiniteTimeAction):void
    {
        var totalDuration:Number = a_action1.duration + a_action2.duration;
        super.initActionInterval(totalDuration);
        _innerActions[0] = a_action1;
        _innerActions[1] = a_action2;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _splitRatio = _innerActions[0].duration / _duration;
        _lastActionIndex = -1;
    }

    public override function update(durationRatio:Number):void
    {
        var actionIndex:int = 0;
        var localDurationRatio:Number = 0.0;
        if (durationRatio < _splitRatio)
        {
            actionIndex = 0;
            if (_splitRatio != 0)
            {
                localDurationRatio = durationRatio / _splitRatio;
            }
            else
            {
                localDurationRatio = 1;
            }
        }
        else
        {
            actionIndex = 1;
            if (_splitRatio == 1)
            {
                localDurationRatio = 1;
            }
            else
            {
                localDurationRatio = (durationRatio - _splitRatio) / (1 - _splitRatio);
            }
        }

        if (actionIndex == 1)
        {
            if (_lastActionIndex == -1)
            {
                // action[0] was skipped, execute it.
                _innerActions[0].startWithTarget(target);
                _innerActions[0].update(1.0);
            }
            else if (_lastActionIndex == 0)
            {
                _innerActions[0].update(1.0);
            }
        }

        // Last action found and it is done.
        if (actionIndex == _lastActionIndex && _innerActions[actionIndex].isDone)
        {
            return;
        }

        if (actionIndex != _lastActionIndex)
        {
            _innerActions[actionIndex].startWithTarget(target);
        }
        _innerActions[actionIndex].update(localDurationRatio);
        _lastActionIndex = actionIndex;
    }
}
}
