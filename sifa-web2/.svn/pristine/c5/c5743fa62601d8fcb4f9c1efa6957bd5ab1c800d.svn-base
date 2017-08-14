/**
 * LocationResponseRequest.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.DxLocation.locRes;

public class LocationResponseRequest  implements java.io.Serializable {
    private java.lang.String locationRequestID;

    private java.lang.String locResults;

    public LocationResponseRequest() {
    }

    public LocationResponseRequest(
           java.lang.String locationRequestID,
           java.lang.String locResults) {
           this.locationRequestID = locationRequestID;
           this.locResults = locResults;
    }


    /**
     * Gets the locationRequestID value for this LocationResponseRequest.
     * 
     * @return locationRequestID
     */
    public java.lang.String getLocationRequestID() {
        return locationRequestID;
    }


    /**
     * Sets the locationRequestID value for this LocationResponseRequest.
     * 
     * @param locationRequestID
     */
    public void setLocationRequestID(java.lang.String locationRequestID) {
        this.locationRequestID = locationRequestID;
    }


    /**
     * Gets the locResults value for this LocationResponseRequest.
     * 
     * @return locResults
     */
    public java.lang.String getLocResults() {
        return locResults;
    }


    /**
     * Sets the locResults value for this LocationResponseRequest.
     * 
     * @param locResults
     */
    public void setLocResults(java.lang.String locResults) {
        this.locResults = locResults;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof LocationResponseRequest)) return false;
        LocationResponseRequest other = (LocationResponseRequest) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.locationRequestID==null && other.getLocationRequestID()==null) || 
             (this.locationRequestID!=null &&
              this.locationRequestID.equals(other.getLocationRequestID()))) &&
            ((this.locResults==null && other.getLocResults()==null) || 
             (this.locResults!=null &&
              this.locResults.equals(other.getLocResults())));
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
        if (getLocationRequestID() != null) {
            _hashCode += getLocationRequestID().hashCode();
        }
        if (getLocResults() != null) {
            _hashCode += getLocResults().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(LocationResponseRequest.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://trace.bnet.cn/locRes", ">locationResponseRequest"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("locationRequestID");
        elemField.setXmlName(new javax.xml.namespace.QName("http://trace.bnet.cn/locRes", "locationRequestID"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("locResults");
        elemField.setXmlName(new javax.xml.namespace.QName("http://trace.bnet.cn/locRes", "locResults"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
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
