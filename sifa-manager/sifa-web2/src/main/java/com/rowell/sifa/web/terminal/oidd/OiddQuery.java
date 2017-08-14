/**
 * OiddQuery.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.rowell.sifa.web.terminal.oidd;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface OiddQuery extends Remote {
    public QueryResponse query(QueryRequest parameter) throws RemoteException;
}
