--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
--region *.lua
module("MCard",package.seeall)
MASK_COLOR =  0xF0    --花色掩码
MASK_VALUE =  0x0F    --数值掩码

--卡片类  负责一张牌的显示
--pos说明  从自己为0 右边为1 逆时针转动
local Card =class("Card",function(img,width,height,cbCardData,backing,sides,index)
      local res ="kunsan/";
      if img =="sethua" then
        local color =0;
        local value =0;
        if cbCardData ~=0 and cbCardData~=nil then
            color=_bitRight(_bitBand(cbCardData,MASK_COLOR),4);
            value=_bitRight(cbCardData,MASK_VALUE);
        end

        if value >9 then
            value =value-9;
        elseif value==0 then
            value =9
            color =3
        end

        --花色转换
        if color ==3 then
            color=0
        elseif color ==4 then
                color=1
        end

        if kunsan.getDlgInstance().m_baidaCardData ==cbCardData then 
            value = 9
            color = 4
        end
        return cc.Sprite:create((res..backimg..".png"),cc.rect((value-1)*width,color.height,width,height))
        
    end
    if height~=nil then
        if backimg ==false then
            if sides==1 or sides==3 then
                return cc.Sprite:create(res..img..".png",cc.rect(index*width,0,width,height))
            elseif sides ==0 then
                if index ==nil then
                    return cc.Sprite:create(res..img..".png")
                end      
                return cc.Sprite:create(res..img..".png",cc.rect(index*width, 0, width, height)) 
            end
            return cc.Sprite:create(res..img..".png")
        end
        
        local color = 0;
        local value = 0;

        if cbCardData~=0 and cbCardData ~=nil then
            color =_bitRight(_bitBand(cbCardData,MASK_COLOR),4);
            value =_bitRight(_bitBand(cbCardData,MASK_VALUE));
        end

        if value > 9 then
            value=value-9
        elseif value ==0 then
            value=9
            value=3
        end

        if kunsan.getDlgInstance.m_baidaCardData ==cbCardData then
            value =9
            value =4
        end

        --花色转换
        if color <=2 then
            if color ==2 then
                color=0
            else
                color =color+1
            end
        end
        return cc.Sprite:create((res..img..".png"), cc.rect((value-1)*width, color*height, width, height));
    else
        if width ~=nil then 
            return cc.Sprite:create(res..img..".png",width)
        else
            return cc.Sprite:create(res..img..".png")
        end
    end
end)
    


        
            
            


