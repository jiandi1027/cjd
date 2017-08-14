package com.rowell.sifa.sys.utils;
import java.beans.PropertyEditorSupport;

import com.rowell.common.utils.StringUtils;

/**   
 * description: 
 * 
 * @author marcle    
 * @version 1.0  
 * @created 2013-8-19 上午10:13:05 
 */

public class IntegerEditor extends PropertyEditorSupport {


	@Override
	public void setAsText(String text) throws IllegalArgumentException {
       if(org.springframework.util.StringUtils.hasText(text)&&StringUtils.isNumber(text)){
    	   this.setValue(new Integer(text));
       }else{
    	   
    	   this.setValue(null);
       }
	}

	@Override
	public String getAsText() {
		// TODO Auto-generated method stub
		return super.getAsText();
	}

	
}
