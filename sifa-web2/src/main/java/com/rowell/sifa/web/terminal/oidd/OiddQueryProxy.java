package com.rowell.sifa.web.terminal.oidd;

public class OiddQueryProxy implements OiddQuery {
  private String _endpoint = null;
  private OiddQuery oiddQuery = null;
  
  public OiddQueryProxy() {
    _initOiddQueryProxy();
  }
  
  public OiddQueryProxy(String endpoint) {
    _endpoint = endpoint;
    _initOiddQueryProxy();
  }
  
  private void _initOiddQueryProxy() {
    try {
      oiddQuery = (new OiddQueryServiceLocator()).getoiddQuerySend();
      if (oiddQuery != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)oiddQuery)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)oiddQuery)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (oiddQuery != null)
      ((javax.xml.rpc.Stub)oiddQuery)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public OiddQuery getOiddQuery() {
    if (oiddQuery == null)
      _initOiddQueryProxy();
    return oiddQuery;
  }
  
  public QueryResponse query(QueryRequest parameter) throws java.rmi.RemoteException{
    if (oiddQuery == null)
      _initOiddQueryProxy();
    return oiddQuery.query(parameter);
  }
  
  
}