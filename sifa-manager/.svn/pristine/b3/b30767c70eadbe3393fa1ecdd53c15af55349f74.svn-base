/**
 * Header.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

import java.io.Serializable;

import javax.xml.namespace.QName;

import org.apache.axis.description.AttributeDesc;
import org.apache.axis.description.ElementDesc;
import org.apache.axis.description.TypeDesc;
import org.apache.axis.encoding.Deserializer;
import org.apache.axis.encoding.Serializer;
import org.apache.axis.encoding.SimpleType;
import org.apache.axis.encoding.ser.SimpleDeserializer;
import org.apache.axis.encoding.ser.SimpleSerializer;

public class Header implements Serializable, SimpleType {
	private String _value;

	private HeaderHead_name head_name; // attribute

	public Header() {
	}

	// Simple Types must have a String constructor
	public Header(String _value) {
		this._value = _value;
	}

	// Simple Types must have a toString for serializing the value
	public String toString() {
		return _value;
	}

	/**
	 * Gets the _value value for this Header.
	 * 
	 * @return _value
	 */
	public String get_value() {
		return _value;
	}

	/**
	 * Sets the _value value for this Header.
	 * 
	 * @param _value
	 */
	public void set_value(String _value) {
		this._value = _value;
	}

	/**
	 * Gets the head_name value for this Header.
	 * 
	 * @return head_name
	 */
	public HeaderHead_name getHead_name() {
		return head_name;
	}

	/**
	 * Sets the head_name value for this Header.
	 * 
	 * @param head_name
	 */
	public void setHead_name(HeaderHead_name head_name) {
		this.head_name = head_name;
	}

	private Object __equalsCalc = null;

	public synchronized boolean equals(Object obj) {
		if (!(obj instanceof Header))
			return false;
		Header other = (Header) obj;
		if (obj == null)
			return false;
		if (this == obj)
			return true;
		if (__equalsCalc != null) {
			return (__equalsCalc == obj);
		}
		__equalsCalc = obj;
		boolean _equals;
		_equals = true
				&& ((this._value == null && other.get_value() == null)
						|| (this._value != null && this._value.equals(other.get_value())))
				&& ((this.head_name == null && other.getHead_name() == null)
						|| (this.head_name != null && this.head_name.equals(other.getHead_name())));
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
		if (get_value() != null) {
			_hashCode += get_value().hashCode();
		}
		if (getHead_name() != null) {
			_hashCode += getHead_name().hashCode();
		}
		__hashCodeCalc = false;
		return _hashCode;
	}

	// Type metadata
	private static TypeDesc typeDesc = new TypeDesc(Header.class, true);

	static {
		typeDesc.setXmlType(
				new QName("http://www.cintel.com.cn/schema/oidd/common/v1_0", "header"));
		AttributeDesc attrField = new AttributeDesc();
		attrField.setFieldName("head_name");
		attrField.setXmlName(new QName("", "head_name"));
		attrField.setXmlType(
				new QName("http://www.cintel.com.cn/schema/oidd/common/v1_0", ">header>head_name"));
		typeDesc.addFieldDesc(attrField);
		ElementDesc elemField = new ElementDesc();
		elemField.setFieldName("_value");
		elemField.setXmlName(new QName("", "_value"));
		elemField.setXmlType(new QName("http://www.w3.org/2001/XMLSchema", "string"));
		elemField.setNillable(false);
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
	public static Serializer getSerializer(String mechType, Class _javaType, QName _xmlType) {
		return new SimpleSerializer(_javaType, _xmlType, typeDesc);
	}

	/**
	 * Get Custom Deserializer
	 */
	public static Deserializer getDeserializer(String mechType, Class _javaType, QName _xmlType) {
		return new SimpleDeserializer(_javaType, _xmlType, typeDesc);
	}

}
