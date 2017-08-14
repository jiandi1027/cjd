/**
 * Body_object.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

import java.lang.reflect.Array;
import java.util.Arrays;

import javax.xml.namespace.QName;

import org.apache.axis.description.ElementDesc;
import org.apache.axis.description.TypeDesc;
import org.apache.axis.encoding.Deserializer;
import org.apache.axis.encoding.Serializer;
import org.apache.axis.encoding.ser.BeanDeserializer;
import org.apache.axis.encoding.ser.BeanSerializer;

public class Body_object implements java.io.Serializable {
	private Body_attr[] body_attr;

	public Body_object() {
	}

	public Body_object(Body_attr[] body_attr) {
		this.body_attr = body_attr;
	}

	/**
	 * Gets the body_attr value for this Body_object.
	 * 
	 * @return body_attr
	 */
	public Body_attr[] getBody_attr() {
		return body_attr;
	}

	/**
	 * Sets the body_attr value for this Body_object.
	 * 
	 * @param body_attr
	 */
	public void setBody_attr(Body_attr[] body_attr) {
		this.body_attr = body_attr;
	}

	private Object __equalsCalc = null;

	public synchronized boolean equals(Object obj) {
		if (!(obj instanceof Body_object))
			return false;
		Body_object other = (Body_object) obj;
		if (obj == null)
			return false;
		if (this == obj)
			return true;
		if (__equalsCalc != null) {
			return (__equalsCalc == obj);
		}
		__equalsCalc = obj;
		boolean _equals;
		_equals = true && ((this.body_attr == null && other.getBody_attr() == null)
				|| (this.body_attr != null && Arrays.equals(this.body_attr, other.getBody_attr())));
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
		if (getBody_attr() != null) {
			for (int i = 0; i < Array.getLength(getBody_attr()); i++) {
				Object obj = Array.get(getBody_attr(), i);
				if (obj != null && !obj.getClass().isArray()) {
					_hashCode += obj.hashCode();
				}
			}
		}
		__hashCodeCalc = false;
		return _hashCode;
	}

	// Type metadata
	private static TypeDesc typeDesc = new TypeDesc(
			Body_object.class, true);

	static {
		typeDesc.setXmlType(new QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface","body_object"));
		ElementDesc elemField = new ElementDesc();
		elemField.setFieldName("body_attr");
		elemField.setXmlName(new QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "body_attr"));
		elemField.setXmlType(new QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "body_attr"));
		elemField.setNillable(false);
		//elemField.setItemQName(new QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "body_attr"));
		typeDesc.addFieldDesc(elemField);
	}

	/**
	 * Return type metadata object
	 */
	public static TypeDesc getTypeDesc() {
		return typeDesc;
	}

	/**
	 * Get Custom Serializer
	 */
	public static Serializer getSerializer(String mechType,Class _javaType, QName _xmlType) {
		return new BeanSerializer(_javaType, _xmlType, typeDesc);
	}

	/**
	 * Get Custom Deserializer
	 */
	public static Deserializer getDeserializer(String mechType, Class _javaType, QName _xmlType) {
		return new BeanDeserializer(_javaType, _xmlType, typeDesc);
	}

}
