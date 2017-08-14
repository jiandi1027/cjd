/**
 * AttrAttr_name.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

public class AttrAttr_name implements java.io.Serializable {
    private java.lang.String _value_;
    private static java.util.HashMap _table_ = new java.util.HashMap();

    // Constructor
    protected AttrAttr_name(java.lang.String value) {
        _value_ = value;
        _table_.put(_value_,this);
    }

    public static final java.lang.String _QueryUserMDN = "QueryUserMDN";
    public static final java.lang.String _BeQueriedUserIMSI = "BeQueriedUserIMSI";
    public static final java.lang.String _BeQueriedUserMDN = "BeQueriedUserMDN";
    public static final java.lang.String _ResultCode = "ResultCode";
    public static final java.lang.String _PseudoMDN = "PseudoMDN";
    public static final java.lang.String _Branch = "Branch";
    public static final java.lang.String _BSCPC = "BSCPC";
    public static final java.lang.String _MSCPC = "MSCPC";
    public static final java.lang.String _MDN = "MDN";
    public static final java.lang.String _IMSI = "IMSI";
    public static final java.lang.String _CallingNumber = "CallingNumber";
    public static final java.lang.String _CalledNumber = "CalledNumber";
    public static final java.lang.String _AreaID = "AreaID";
    public static final java.lang.String _CellID = "CellID";
    public static final java.lang.String _Longitute = "Longitute";
    public static final java.lang.String _Latitude = "Latitude";
    public static final java.lang.String _MscID = "MscID";
    public static final java.lang.String _EventTime = "EventTime";
    public static final java.lang.String _BusyStatus = "BusyStatus";
    public static final java.lang.String _ActiveStatus = "ActiveStatus";
    public static final java.lang.String _ForwardStatus = "ForwardStatus";
    public static final java.lang.String _ForwardNumber = "ForwardNumber";
    public static final java.lang.String _AccountStatus = "AccountStatus";
    public static final java.lang.String _ChargePackageType = "ChargePackageType";
    public static final java.lang.String _MonthFee = "MonthFee";
    public static final java.lang.String _CurrDataOctets = "CurrDataOctets";
    public static final java.lang.String _UserName = "UserName";
    public static final java.lang.String _Gender = "Gender";
    public static final java.lang.String _Age = "Age";
    public static final java.lang.String _Addr = "Addr";
    public static final java.lang.String _AreaCode = "AreaCode";
    public static final java.lang.String _TerminalType = "TerminalType";
    public static final java.lang.String _Vender = "Vender";
    public static final java.lang.String _Version = "Version";
    public static final java.lang.String _MEID = "MEID";
    public static final java.lang.String _ResidentCellID = "ResidentCellID";
    public static final AttrAttr_name QueryUserMDN = new AttrAttr_name(_QueryUserMDN);
    public static final AttrAttr_name BeQueriedUserIMSI = new AttrAttr_name(_BeQueriedUserIMSI);
    public static final AttrAttr_name BeQueriedUserMDN = new AttrAttr_name(_BeQueriedUserMDN);
    public static final AttrAttr_name ResultCode = new AttrAttr_name(_ResultCode);
    public static final AttrAttr_name PseudoMDN = new AttrAttr_name(_PseudoMDN);
    public static final AttrAttr_name Branch = new AttrAttr_name(_Branch);
    public static final AttrAttr_name BSCPC = new AttrAttr_name(_BSCPC);
    public static final AttrAttr_name MSCPC = new AttrAttr_name(_MSCPC);
    public static final AttrAttr_name MDN = new AttrAttr_name(_MDN);
    public static final AttrAttr_name IMSI = new AttrAttr_name(_IMSI);
    public static final AttrAttr_name CallingNumber = new AttrAttr_name(_CallingNumber);
    public static final AttrAttr_name CalledNumber = new AttrAttr_name(_CalledNumber);
    public static final AttrAttr_name AreaID = new AttrAttr_name(_AreaID);
    public static final AttrAttr_name CellID = new AttrAttr_name(_CellID);
    public static final AttrAttr_name Longitute = new AttrAttr_name(_Longitute);
    public static final AttrAttr_name Latitude = new AttrAttr_name(_Latitude);
    public static final AttrAttr_name MscID = new AttrAttr_name(_MscID);
    public static final AttrAttr_name EventTime = new AttrAttr_name(_EventTime);
    public static final AttrAttr_name BusyStatus = new AttrAttr_name(_BusyStatus);
    public static final AttrAttr_name ActiveStatus = new AttrAttr_name(_ActiveStatus);
    public static final AttrAttr_name ForwardStatus = new AttrAttr_name(_ForwardStatus);
    public static final AttrAttr_name ForwardNumber = new AttrAttr_name(_ForwardNumber);
    public static final AttrAttr_name AccountStatus = new AttrAttr_name(_AccountStatus);
    public static final AttrAttr_name ChargePackageType = new AttrAttr_name(_ChargePackageType);
    public static final AttrAttr_name MonthFee = new AttrAttr_name(_MonthFee);
    public static final AttrAttr_name CurrDataOctets = new AttrAttr_name(_CurrDataOctets);
    public static final AttrAttr_name UserName = new AttrAttr_name(_UserName);
    public static final AttrAttr_name Gender = new AttrAttr_name(_Gender);
    public static final AttrAttr_name Age = new AttrAttr_name(_Age);
    public static final AttrAttr_name Addr = new AttrAttr_name(_Addr);
    public static final AttrAttr_name AreaCode = new AttrAttr_name(_AreaCode);
    public static final AttrAttr_name TerminalType = new AttrAttr_name(_TerminalType);
    public static final AttrAttr_name Vender = new AttrAttr_name(_Vender);
    public static final AttrAttr_name Version = new AttrAttr_name(_Version);
    public static final AttrAttr_name MEID = new AttrAttr_name(_MEID);
    public static final AttrAttr_name ResidentCellID = new AttrAttr_name(_ResidentCellID);
    public java.lang.String getValue() { return _value_;}
    public static AttrAttr_name fromValue(java.lang.String value)
          throws java.lang.IllegalArgumentException {
        AttrAttr_name enumeration = (AttrAttr_name)
            _table_.get(value);
        if (enumeration==null) throw new java.lang.IllegalArgumentException();
        return enumeration;
    }
    public static AttrAttr_name fromString(java.lang.String value)
          throws java.lang.IllegalArgumentException {
        return fromValue(value);
    }
    public boolean equals(java.lang.Object obj) {return (obj == this);}
    public int hashCode() { return toString().hashCode();}
    public java.lang.String toString() { return _value_;}
    public java.lang.Object readResolve() throws java.io.ObjectStreamException { return fromValue(_value_);}
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new org.apache.axis.encoding.ser.EnumSerializer(
            _javaType, _xmlType);
    }
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new org.apache.axis.encoding.ser.EnumDeserializer(
            _javaType, _xmlType);
    }
    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(AttrAttr_name.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", ">attr>attr_name"));
    }
    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

}
