package com.rowell.common.pojo;/**
 * Created by lizhaoz on 2015/11/30.
 */

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.common.utils.JaxbDateAdapter;

/**
 * @Name:
 * @Author: lizhao（作者）
 * @Version: V1.00 （版本号）
 * @Create Date: 2015-11-26（创建日期）
 * @Description:TOKEN的资源实体类
 */
@XmlRootElement
public class Token implements Serializable {
    @XmlElement(name = "auth_token")
    private String authToken;
    @XmlElement(name = "expires")
    @XmlJavaTypeAdapter(JaxbDateAdapter.class)
    
    private Date expires;
    public Token(){


    }

    public String getAuthToken() {
        return authToken;
    }

    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getExpires() {
        return expires;
    }

    public void setExpires(Date expires) {
        this.expires = expires;
    }
}
