/**
 * Body_attr.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

public class Body_attr  implements java.io.Serializable {
    private Attr[] attr;

    private Body_attrType type;  // attribute

    public Body_attr() {
    }

    public Body_attr(
           Attr[] attr,
           Body_attrType type) {
           this.attr = attr;
           this.type = type;
    }


    /**
     * Gets the attr value for this Body_attr.
     * 
     * @return attr
     */
    public Attr[] getAttr() {
        return attr;
    }


    /**
     * Sets the attr value for this Body_attr.
     * 
     * @param attr
     */
    public void setAttr(Attr[] attr) {
        this.attr = attr;
    }


    /**
     * Gets the type value for this Body_attr.
     * 
     * @return type
     */
    public Body_attrType getType() {
        return type;
    }


    /**
     * Sets the type value for this Body_attr.
     * 
     * @param type
     */
    public void setType(Body_attrType type) {
        this.type = type;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Body_attr)) return false;
        Body_attr other = (Body_attr) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.attr==null && other.getAttr()==null) || 
             (this.attr!=null &&
              java.util.Arrays.equals(this.attr, other.getAttr()))) &&
            ((this.type==null && other.getType()==null) || 
             (this.type!=null &&
              this.type.equals(other.getType())));
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
        if (getAttr() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getAttr());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getAttr(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getType() != null) {
            _hashCode += getType().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Body_attr.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "body_attr"));
        org.apache.axis.description.AttributeDesc attrField = new org.apache.axis.description.AttributeDesc();
        attrField.setFieldName("type");
        attrField.setXmlName(new javax.xml.namespace.QName("", "type"));
        attrField.setXmlType(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", ">body_attr>type"));
        typeDesc.addFieldDesc(attrField);
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("attr");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "attr"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "attr"));
        elemField.setNillable(false);
        //elemField.setItemQName(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "attr"));
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
