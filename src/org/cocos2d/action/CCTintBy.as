/**
 * Created by alanmars on 14-9-1.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

import starling.utils.Color;

public class CCTintBy extends CCActionInterval
{
    private var _deltaRed;
    private var _deltaGreen;
    private var _deltaBlue;
    private var _startRed;
    private var _startGreen;
    private var _startBlue;

    public static function create(a_duration:Number, a_deltaRed:int, a_deltaGreen:int, a_deltaBlue:int):CCTintBy
    {
        var result:CCTintBy = new CCTintBy();
        result.initTintBy(a_duration, a_deltaRed, a_deltaGreen, a_deltaBlue);
    }

    public function CCTintBy()
    {
    }

    public function initTintBy(a_duration:Number, a_deltaRed:int, a_deltaGreen:int, a_deltaBlue:int):void
    {
        super.initActionInterval(a_duration);
        _deltaRed = a_deltaRed;
        _deltaGreen = a_deltaGreen;
        _deltaBlue = a_deltaBlue;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _startRed = Color.getRed(a_target.color);
        _startGreen = Color.getGreen(a_target.color);
        _startBlue = Color.getBlue(a_target.color);
    }

    public override function update(a_durationRatio:Number):void
    {
        target.color = Color.rgb(_startRed + _deltaRed*a_durationRatio, _startGreen + _deltaGreen*a_durationRatio, _startBlue + _deltaBlue*a_durationRatio);
    }
}
}
