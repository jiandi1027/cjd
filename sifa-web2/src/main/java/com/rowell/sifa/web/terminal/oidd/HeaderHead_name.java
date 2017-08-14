/**
 * HeaderHead_name.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

import java.io.ObjectStreamException;
import java.io.Serializable;
import java.util.HashMap;

import javax.xml.namespace.QName;

import org.apache.axis.description.TypeDesc;
import org.apache.axis.encoding.Deserializer;
import org.apache.axis.encoding.Serializer;
import org.apache.axis.encoding.ser.EnumDeserializer;
import org.apache.axis.encoding.ser.EnumSerializer;

public class HeaderHead_name implements Serializable {
	private String _value_;
	private static HashMap _table_ = new HashMap();

	// Constructor
	protected HeaderHead_name(String value) {
		_value_ = value;
		_table_.put(_value_, this);
	}

	public static final String _OA = "OA";
	public static final String _ProductId = "ProductId";
	public static final String _SPId = "SPId";
	public static final String _TimeStamp = "TimeStamp";
	public static final String _LinkId = "LinkId";
	public static final HeaderHead_name OA = new HeaderHead_name(_OA);
	public static final HeaderHead_name ProductId = new HeaderHead_name(_ProductId);
	public static final HeaderHead_name SPId = new HeaderHead_name(_SPId);
	public static final HeaderHead_name TimeStamp = new HeaderHead_name(_TimeStamp);
	public static final HeaderHead_name LinkId = new HeaderHead_name(_LinkId);

	public String getValue() {
		return _value_;
	}

	public static HeaderHead_name fromValue(String value) throws IllegalArgumentException {
		HeaderHead_name enumeration = (HeaderHead_name) _table_.get(value);
		if (enumeration == null)
			throw new IllegalArgumentException();
		return enumeration;
	}

	public static HeaderHead_name fromString(String value) throws IllegalArgumentException {
		return fromValue(value);
	}

	public boolean equals(Object obj) {
		return (obj == this);
	}

	public int hashCode() {
		return toString().hashCode();
	}

	public String toString() {
		return _value_;
	}

	public Object readResolve() throws ObjectStreamException {
		return fromValue(_value_);
	}

	public static Serializer getSerializer(String mechType, Class _javaType, QName _xmlType) {
		return new EnumSerializer(_javaType, _xmlType);
	}

	public static Deserializer getDeserializer(String mechType, Class _javaType, QName _xmlType) {
		return new EnumDeserializer(_javaType, _xmlType);
	}

	// Type metadata
	private static TypeDesc typeDesc = new TypeDesc(HeaderHead_name.class);

	static {
		typeDesc.setXmlType(
				new QName("http://www.cintel.com.cn/schema/oidd/common/v1_0", ">header>head_name"));
	}

	/**
	 * Return type metadata object
	 */
	public static TypeDesc getTypeDesc() {
		return typeDesc;
	}

}
