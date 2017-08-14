
/**
 * LocationService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.6.2  Built on : Apr 17, 2012 (05:33:49 IST)
 */

package com.rowell.sifa.web.terminal.DxLocation.location;

/*
 *  LocationService java interface
 */

public interface LocationService {

	/**
	 * Auto generated method signature
	 * 
	 * @param getLastestLocationRequest0
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetLastestLocationResponse getLastestLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLastestLocationRequest getLastestLocationRequest0)
			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getLastestLocationRequest0
	 * 
	 */
	public void startgetLastestLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLastestLocationRequest getLastestLocationRequest0,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getAutoLocByScheduleRequest2
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocByScheduleResponse getAutoLocBySchedule(

			com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocByScheduleRequest getAutoLocByScheduleRequest2)
			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getAutoLocByScheduleRequest2
	 * 
	 */
	public void startgetAutoLocBySchedule(

			com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocByScheduleRequest getAutoLocByScheduleRequest2,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getEnterpriseStatRequest4
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetEnterpriseStatResponse getEnterpriseStat(

			com.rowell.sifa.web.terminal.DxLocation.location.GetEnterpriseStatRequest getEnterpriseStatRequest4) throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getEnterpriseStatRequest4
	 * 
	 */
	public void startgetEnterpriseStat(

			com.rowell.sifa.web.terminal.DxLocation.location.GetEnterpriseStatRequest getEnterpriseStatRequest4,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getLocListByPageRequest6
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetLocListByPageResponse getLocListByPage(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLocListByPageRequest getLocListByPageRequest6) throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getLocListByPageRequest6
	 * 
	 */
	public void startgetLocListByPage(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLocListByPageRequest getLocListByPageRequest6,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getEntLocStatRequest8
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetEntLocStatResponse getEntLocStat(

			com.rowell.sifa.web.terminal.DxLocation.location.GetEntLocStatRequest getEntLocStatRequest8) throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getEntLocStatRequest8
	 * 
	 */
	public void startgetEntLocStat(

			com.rowell.sifa.web.terminal.DxLocation.location.GetEntLocStatRequest getEntLocStatRequest8,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getLocationHistoryRequest10
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetLocationHistoryResponse getLocationHistory(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLocationHistoryRequest getLocationHistoryRequest10)
			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getLocationHistoryRequest10
	 * 
	 */
	public void startgetLocationHistory(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLocationHistoryRequest getLocationHistoryRequest10,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getBusiStatRequest12
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetBusiStatResponse getBusiStat(

			com.rowell.sifa.web.terminal.DxLocation.location.GetBusiStatRequest getBusiStatRequest12) throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getBusiStatRequest12
	 * 
	 */
	public void startgetBusiStat(

			com.rowell.sifa.web.terminal.DxLocation.location.GetBusiStatRequest getBusiStatRequest12,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getLocationRequest14
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetLocationResponse getLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLocationRequest getLocationRequest14) throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getLocationRequest14
	 * 
	 */
	public void startgetLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.GetLocationRequest getLocationRequest14,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param queryAutoLocRequest16
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.QueryAutoLocResponse queryAutoLoc(

			com.rowell.sifa.web.terminal.DxLocation.location.QueryAutoLocRequest queryAutoLocRequest16) throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param queryAutoLocRequest16
	 * 
	 */
	public void startqueryAutoLoc(

			com.rowell.sifa.web.terminal.DxLocation.location.QueryAutoLocRequest queryAutoLocRequest16,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param cancelAutoLocationRequest18
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.CancelAutoLocationResponse cancelAutoLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.CancelAutoLocationRequest cancelAutoLocationRequest18)
			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param cancelAutoLocationRequest18
	 * 
	 */
	public void startcancelAutoLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.CancelAutoLocationRequest cancelAutoLocationRequest18,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature
	 * 
	 * @param getAutoLocationRequest20
	 * 
	 */

	public com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocationResponse getAutoLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocationRequest getAutoLocationRequest20) throws java.rmi.RemoteException;

	/**
	 * Auto generated method signature for Asynchronous Invocations
	 * 
	 * @param getAutoLocationRequest20
	 * 
	 */
	public void startgetAutoLocation(

			com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocationRequest getAutoLocationRequest20,

			final com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceCallbackHandler callback)

			throws java.rmi.RemoteException;

	//
}
