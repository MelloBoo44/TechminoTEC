return {
	fieldH=20,
    mesDisp=function(P)
        setFont(60)
        GC.mStr(P.stat.row,63,280)
        mText(TEXTOBJ.line,63,350)
        PLY.draw.drawMarkLine(P,20,.3,1,1,TIME()%.42<.21 and .95 or .6)
    end,
	task=function(P)
		P.modeData.LineTotal=0
		P.modeData.Zone=0
	end,
	hook_drop=function(P)
		local c=#P.clearedRow
		if #P.clearedRow>0 then
		P.modeData.LineTotal=P.modeData.LineTotal+#P.clearedRow
		end
		if P.modeData.Zone==1 then
		P:garbageRise(21,c,1023)
		P.stat.row=P.stat.row-c
		end
		P:freshMoveBlock('push')
	end,
	
	fkey1=function(P)
		if P.modeData.LineTotal>=7 then
			P.modeData.LineTotal=0
			P.modeData.Zone=1
		end
	end,
	
    hook_die=function(P)
		P.modeData.Zone=0
        P:freshMoveBlock('push')
		TABLE.cut(P.clearedRow)
		P:clearFilledLines(1,P.garbageBeneath)
    end,
}