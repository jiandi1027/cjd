package com.rowell.sifa.web.terminal.DxLocation.locRes;

public class LocResProxy implements com.rowell.sifa.web.terminal.DxLocation.locRes.LocRes {
  private String _endpoint = null;
  private com.rowell.sifa.web.terminal.DxLocation.locRes.LocRes locRes = null;
  
  public LocResProxy() {
    _initLocResProxy();
  }
  
  public LocResProxy(String endpoint) {
    _endpoint = endpoint;
    _initLocResProxy();
  }
  
  private void _initLocResProxy() {
    try {
      locRes = (new com.rowell.sifa.web.terminal.DxLocation.locRes.LocResServiceLocator()).getLocResSoap11();
      if (locRes != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)locRes)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)locRes)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (locRes != null)
      ((javax.xml.rpc.Stub)locRes)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.rowell.sifa.web.terminal.DxLocation.locRes.LocRes getLocRes() {
    if (locRes == null)
      _initLocResProxy();
    return locRes;
  }
  
  public java.lang.String locationResponse(com.rowell.sifa.web.terminal.DxLocation.locRes.LocationResponseRequest locationResponseRequest) throws java.rmi.RemoteException{
    if (locRes == null)
      _initLocResProxy();
    return locRes.locationResponse(locationResponseRequest);
  }
  
  
}