/**
 * QueryResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

public class QueryResponse implements java.io.Serializable {
	private QueryResponseObject object;

	public QueryResponse() {
	}

	public QueryResponse(
			QueryResponseObject object) {
		this.object = object;
	}

	/**
	 * Gets the object value for this QueryResponse.
	 * 
	 * @return object
	 */
	public QueryResponseObject getObject() {
		return object;
	}

	/**
	 * Sets the object value for this QueryResponse.
	 * 
	 * @param object
	 */
	public void setObject(
			QueryResponseObject object) {
		this.object = object;
	}

	private java.lang.Object __equalsCalc = null;

	public synchronized boolean equals(java.lang.Object obj) {
		if (!(obj instanceof QueryResponse))
			return false;
		QueryResponse other = (QueryResponse) obj;
		if (obj == null)
			return false;
		if (this == obj)
			return true;
		if (__equalsCalc != null) {
			return (__equalsCalc == obj);
		}
		__equalsCalc = obj;
		boolean _equals;
		_equals = true && ((this.object == null && other.getObject() == null) || (this.object != null && this.object
				.equals(other.getObject())));
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
		if (getObject() != null) {
			_hashCode += getObject().hashCode();
		}
		__hashCodeCalc = false;
		return _hashCode;
	}

	// Type metadata
	private static org.apache.axis.description.TypeDesc typeDesc = new org.apache.axis.description.TypeDesc(
			QueryResponse.class, true);

	static {
		typeDesc.setXmlType(new javax.xml.namespace.QName(
				"http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface",
				"queryResponse"));
		org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
		elemField.setFieldName("object");
		elemField.setXmlName(new javax.xml.namespace.QName(
				"http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface",
				"object"));
		elemField.setXmlType(new javax.xml.namespace.QName(
				"http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface",
				">queryResponse>object"));
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
			java.lang.String mechType, java.lang.Class _javaType,
			javax.xml.namespace.QName _xmlType) {
		return new org.apache.axis.encoding.ser.BeanSerializer(_javaType,
				_xmlType, typeDesc);
	}

	/**
	 * Get Custom Deserializer
	 */
	public static org.apache.axis.encoding.Deserializer getDeserializer(
			java.lang.String mechType, java.lang.Class _javaType,
			javax.xml.namespace.QName _xmlType) {
		return new org.apache.axis.encoding.ser.BeanDeserializer(_javaType,
				_xmlType, typeDesc);
	}

	private String reqXml;

	private String resXml;

	public String getReqXml() {
		return reqXml;
	}

	public void setReqXml(String reqXml) {
		this.reqXml = reqXml;
	}

	public String getResXml() {
		return resXml;
	}

	public void setResXml(String resXml) {
		this.resXml = resXml;
	}
}
