/**
 * LocResServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.DxLocation.locRes;

public class LocResServiceLocator extends org.apache.axis.client.Service implements com.rowell.sifa.web.terminal.DxLocation.locRes.LocResService {

    public LocResServiceLocator() {
    }


    public LocResServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public LocResServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for LocResSoap11
    private java.lang.String LocResSoap11_address = "http://192.168.88.12:8080/sifa-web2/LocationService/getLocationInfo";//192.168.88.12:8080//60.181.14.53

    public java.lang.String getLocResSoap11Address() {
        return LocResSoap11_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String LocResSoap11WSDDServiceName = "LocResSoap11";

    public java.lang.String getLocResSoap11WSDDServiceName() {
        return LocResSoap11WSDDServiceName;
    }

    public void setLocResSoap11WSDDServiceName(java.lang.String name) {
        LocResSoap11WSDDServiceName = name;
    }

    public com.rowell.sifa.web.terminal.DxLocation.locRes.LocRes getLocResSoap11() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(LocResSoap11_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getLocResSoap11(endpoint);
    }

    public com.rowell.sifa.web.terminal.DxLocation.locRes.LocRes getLocResSoap11(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.rowell.sifa.web.terminal.DxLocation.locRes.LocResSoap11Stub _stub = new com.rowell.sifa.web.terminal.DxLocation.locRes.LocResSoap11Stub(portAddress, this);
            _stub.setPortName(getLocResSoap11WSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setLocResSoap11EndpointAddress(java.lang.String address) {
        LocResSoap11_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.rowell.sifa.web.terminal.DxLocation.locRes.LocRes.class.isAssignableFrom(serviceEndpointInterface)) {
                com.rowell.sifa.web.terminal.DxLocation.locRes.LocResSoap11Stub _stub = new com.rowell.sifa.web.terminal.DxLocation.locRes.LocResSoap11Stub(new java.net.URL(LocResSoap11_address), this);
                _stub.setPortName(getLocResSoap11WSDDServiceName());
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
        if ("LocResSoap11".equals(inputPortName)) {
            return getLocResSoap11();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://trace.bnet.cn/locRes", "LocResService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://trace.bnet.cn/locRes", "LocResSoap11"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("LocResSoap11".equals(portName)) {
            setLocResSoap11EndpointAddress(address);
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
