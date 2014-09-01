/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCSpawn extends CCActionInterval
{
    private var _innerActionOne:CCFiniteTimeAction;
    private var _innerActionTwo:CCFiniteTimeAction;

    public static function create(a_innerAction1:CCFiniteTimeAction, ... a_restInnerActions):CCSpawn
    {
        if (a_restInnerActions.length > 0)
        {
            var result:CCFiniteTimeAction = a_innerAction1;
            for (var i:int = 0; i < a_restInnerActions.length; ++ i)
            {
                result = createWithTwoActions(result, a_restInnerActions[i]);
            }
            return result as CCSpawn;
        }
        else
        {
            return createWithTwoActions(a_innerAction1, CCDummyFiniteTimeAction.create());
        }
    }

    public static function createWithTwoActions(a_innerAction1:CCFiniteTimeAction, a_innerAction2:CCFiniteTimeAction):CCSpawn
    {
        var result:CCSpawn = new CCSpawn();
        result.initSpawnWithTwoActions(a_innerAction1, a_innerAction2);
        return result;
    }

    public function CCSpawn()
    {
    }

    public function initSpawnWithTwoActions(a_innerAction1:CCFiniteTimeAction, a_innerAction2:CCFiniteTimeAction):void
    {
        var durationOne:Number = a_innerAction1.duration;
        var durationTwo:Number = a_innerAction2.duration;
        super.initActionInterval(Math.max(durationOne, durationTwo));
        _innerActionOne = a_innerAction1;
        _innerActionTwo = a_innerAction2;
        if (durationOne > durationTwo)
        {
            _innerActionTwo = CCSequence.createWithTwoActions(_innerActionTwo, CCDelayTime.create(durationOne - durationTwo));
        }
        else
        {
            _innerActionOne = CCSequence.createWithTwoActions(_innerActionOne, CCDelayTime.create(durationTwo - durationOne));
        }
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _innerActionOne.startWithTarget(a_target);
        _innerActionTwo.startWithTarget(a_target);
    }

    public override function update(a_durationRatio:Number):void
    {
        _innerActionOne.update(a_durationRatio);
        _innerActionTwo.update(a_durationRatio);
    }
}
}
