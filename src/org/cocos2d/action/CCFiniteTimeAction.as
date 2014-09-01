/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import flash.utils.getQualifiedClassName;

import starling.errors.AbstractClassError;

public class CCFiniteTimeAction extends CCAction
{
    protected var _duration:Number;

    public function CCFiniteTimeAction()
    {
        if (getQualifiedClassName(this) == "org.cocos2d.action::CCFiniteTimeAction")
        {
            throw new AbstractClassError();
        }
        _duration = 0;
    }

    public function get duration():Number
    {
        return _duration;
    }
}
}
