/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

import starling.utils.Color;

public class CCTintTo extends CCActionInterval
{
    private var _dstRed:int;
    private var _dstGreen:int;
    private var _dstBlue:int;

    private var _startRed:int;
    private var _startGreen:int;
    private var _startBlue:int;

    public function CCTintTo()
    {
    }

    public function initTintTo(a_duration:Number, a_dstRed:uint, a_dstGreen:uint, a_dstBlue:uint):void
    {
        super.initActionInterval(a_duration);
        _dstRed = a_dstRed;
        _dstGreen = a_dstGreen;
        _dstBlue = a_dstBlue;
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
        var curRed:int = _startRed + (_dstRed - _startRed) * a_durationRatio;
        var curGreen:int = _startGreen + (_dstGreen - _startGreen) * a_durationRatio;
        var curBlue:int = _startBlue + (_dstBlue - _startBlue) * a_durationRatio;
        target.color = Color.rgb(curRed, curGreen, curBlue);
    }
}
}
