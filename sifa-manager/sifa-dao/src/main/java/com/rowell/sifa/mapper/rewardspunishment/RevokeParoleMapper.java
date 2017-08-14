/*
* RevokeParoleMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.mapper.rewardspunishment;

import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;

/***
 * 
    * @ClassName: RevokeParoleMapper  
    * @Description:  提请撤销假释mapper
    * @author xiaoguang  
    * @date 2017年3月16日  
    *
 */
public interface RevokeParoleMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.rewardspunishment.RevokeParole> {
	public int getCount(RevokeParole revokeParole);
}