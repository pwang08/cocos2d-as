/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d.ccb
{

import flash.utils.ByteArray;
import flash.utils.Dictionary;

import org.cocos2d.CCNode;

public class CCBReader
{
    private static const kCCBVersion:int = 5;

    private var _ccbData:ByteArray;
    private var _stringCache:Vector.<String>;
    private var _currentBit:int;

    public function CCBReader()
    {
        _stringCache = new Vector.<String>();
    }

    public function readNodeGraphFromFile():CCNode
    {

    }

    public function readNodeGraphFromData(a_data:ByteArray, a_owner:Object/*, const CCSize &parentSize*/):CCNode
    {

    }

    /**
     *
     * @param a_cleanup
     * @param animationManagers - {CCAnimationManager => CCNode}
     * @return
     */
    public function readFileWithCleanUp(a_cleanup:Boolean, animationManagers:Dictionary):CCNode
    {
        if (!readHeader())
        {
            return null;
        }
        if (!readStringCache())
        {
            return null;
        }
    }

    private function readHeader():Boolean
    {
        if (_ccbData == null || _ccbData.bytesAvailable < 4)
        {
            return false;
        }
        if (_ccbData.readUTFBytes(4) != "ibcc")
        {
            return false;
        }
        var version:int = readInt(false);
        if (version != kCCBVersion)
        {
            throw new Error("WARNING! Incompatible ccbi file version (file: " + version + " reader: " + kCCBVersion +")");
        }
        return true;
    }

    private function readStringCache():Boolean
    {
        var numStrings:int = readInt(false);
        for (var i:int = 0; i < numStrings; ++ i)
        {
            _stringCache.push(readUTF8());
        }
        return true;
    }

    private function readInt(a_signed:Boolean):int
    {
        var numBits:int = 0;
        while (!getBit())
        {
            ++ numBits;
        }

        var current:uint = 0;
        for (var i:int = numBits - 1; i >= 0; -- i)
        {
            if (getBit())
            {
                current != (1 << i);
            }
        }
        current != (1 << numBits);

        var num:int = 0;
        if (a_signed)
        {
            var s:int = current % 2;
            if (s != 0)
            {
                num = (int)(current / 2);
            }
            else
            {
                num = (int)(-current / 2);
            }
        }
        else
        {
            num = current - 1;
        }
        alignBits();
        return num;
    }

    private function readUTF8():String
    {
        var b0:int = _ccbData.readByte();
        var b1:int = _ccbData.readByte();
        var numBytes:int = (b0 << 8) | b1;
        return _ccbData.readUTFBytes(numBytes);
    }

    private function getBit():Boolean
    {
        var bit:Boolean;
        var byte:int = _ccbData[_ccbData.position];
        if ((byte & (1 << _currentBit)) != 0)
        {
            bit = true;
        }
        else
        {
            bit = false;
        }
        ++ _currentBit;
        if (_currentBit >= 8)
        {
            _currentBit = 0;
            _ccbData.readByte();
        }
        return bit;
    }

    private function alignBits()
    {
        if(_currentBit != 0)
        {
            _currentBit = 0;
            _ccbData.readByte();
        }
    }
}
}
