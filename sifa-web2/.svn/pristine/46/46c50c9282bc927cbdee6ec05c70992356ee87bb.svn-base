/**
 * QueryRequestObject.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

import java.io.Serializable;

import org.apache.axis.description.TypeDesc;

public class QueryRequestObject  implements Serializable {
    
	private Header[] head_object;
    private Body_object body_object;

    public QueryRequestObject() {
    }

    public QueryRequestObject(Header[] head_object, Body_object body_object) {
    	this.head_object = head_object ;
    	this.body_object = body_object ;
    }


    /**
     * Gets the head_object value for this QueryRequestObject.
     * 
     * @return head_object
     */
    public Header[] getHead_object() {
        return head_object;
    }


    /**
     * Sets the head_object value for this QueryRequestObject.
     * 
     * @param head_object
     */
    public void setHead_object(Header[] head_object) {
        this.head_object = head_object;
    }


    /**
     * Gets the body_object value for this QueryRequestObject.
     * 
     * @return body_object
     */
    public Body_object getBody_object() {
        return body_object;
    }


    /**
     * Sets the body_object value for this QueryRequestObject.
     * 
     * @param body_object
     */
    public void setBody_object(Body_object body_object) {
        this.body_object = body_object;
    }

    private Object __equalsCalc = null;
    public synchronized boolean equals(Object obj) {
    	
        if (!(obj instanceof QueryRequestObject)) return false;
        QueryRequestObject other = (QueryRequestObject) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.head_object==null && other.getHead_object()==null) || 
             (this.head_object!=null &&
              java.util.Arrays.equals(this.head_object, other.getHead_object()))) &&
            ((this.body_object==null && other.getBody_object()==null) || 
             (this.body_object!=null &&
              this.body_object.equals(other.getBody_object())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getHead_object() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getHead_object());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getHead_object(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getBody_object() != null) {
            _hashCode += getBody_object().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static TypeDesc typeDesc = new TypeDesc(QueryRequestObject.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", ">queryRequest>object"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("head_object");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "head_object"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.cintel.com.cn/schema/oidd/common/v1_0", "header"));
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("", "head"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("body_object");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "body_object"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "body_object"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
