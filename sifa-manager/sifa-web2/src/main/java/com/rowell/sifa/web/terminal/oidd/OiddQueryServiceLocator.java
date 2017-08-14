/**
 * OiddQueryServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.rpc.ServiceException;

import org.apache.axis.AxisFault;

public class OiddQueryServiceLocator extends org.apache.axis.client.Service implements OiddQueryService {

    public OiddQueryServiceLocator() {
    }


    public OiddQueryServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public OiddQueryServiceLocator(String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for oiddQuerySend
    //private String oiddQuerySend_address = "http://115.239.135.21/cap/services/oiddQuerySend";
    private String oiddQuerySend_address = "http://115.239.134.67:3268/oiddInterfaceService" ;
    //private String oiddQuerySend_address = "http://192.168.31.193:8080" ;

    public String getoiddQuerySendAddress() {
        return oiddQuerySend_address;
    }

    // The WSDD service name defaults to the port name.
    private String oiddQuerySendWSDDServiceName = "oiddQuerySend";

    public String getoiddQuerySendWSDDServiceName() {
        return oiddQuerySendWSDDServiceName;
    }

    public void setoiddQuerySendWSDDServiceName(String name) {
        oiddQuerySendWSDDServiceName = name;
    }

    public OiddQuery getoiddQuerySend() throws ServiceException {
       URL endpoint;
        try {
        	//*******oiddQuerySend_address---接口请求地址
            endpoint = new URL(oiddQuerySend_address);
        }
        catch (MalformedURLException e) {
            throw new ServiceException(e);
        }
        return getoiddQuerySend(endpoint);
    }

    public OiddQuery getoiddQuerySend(URL portAddress) throws ServiceException {
        try {
			OiddQueryBindingStub _stub = new OiddQueryBindingStub(portAddress, this);
			_stub.setPortName(getoiddQuerySendWSDDServiceName());
			return _stub;
        }
        catch (AxisFault e) {
            return null;
        }
    }

    public void setoiddQuerySendEndpointAddress(String address) {
        oiddQuerySend_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (OiddQuery.class.isAssignableFrom(serviceEndpointInterface)) {
                OiddQueryBindingStub _stub = new OiddQueryBindingStub(new java.net.URL(oiddQuerySend_address), this);
                _stub.setPortName(getoiddQuerySendWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("oiddQuerySend".equals(inputPortName)) {
            return getoiddQuerySend();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "oiddQueryService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://www.cintel.com.cn/wsdl/oidd/query/v1_0/interface", "oiddQuerySend"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("oiddQuerySend".equals(portName)) {
            setoiddQuerySendEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
