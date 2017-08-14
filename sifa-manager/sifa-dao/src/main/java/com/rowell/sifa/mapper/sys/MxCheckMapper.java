/*
* MxCheckMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-05-08 created
*/
package com.rowell.sifa.mapper.sys;

import com.rowell.sifa.pojo.sys.MxCheck;

public interface MxCheckMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.MxCheck> {

	void updateIsUse(MxCheck mxCheck);
}