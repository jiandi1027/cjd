
/**
 * LocationServiceCallbackHandler.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.6.2  Built on : Apr 17, 2012 (05:33:49 IST)
 */

package com.rowell.sifa.web.terminal.DxLocation.location;

/**
 * LocationServiceCallbackHandler Callback class, Users can extend this class
 * and implement their own receiveResult and receiveError methods.
 */
public abstract class LocationServiceCallbackHandler {

	protected Object clientData;

	/**
	 * User can pass in any object that needs to be accessed once the
	 * NonBlocking Web service call is finished and appropriate method of this
	 * CallBack is called.
	 * 
	 * @param clientData
	 *            Object mechanism by which the user can pass in user data that
	 *            will be avilable at the time this callback is called.
	 */
	public LocationServiceCallbackHandler(Object clientData) {
		this.clientData = clientData;
	}

	/**
	 * Please use this constructor if you don't want to set any clientData
	 */
	public LocationServiceCallbackHandler() {
		this.clientData = null;
	}

	/**
	 * Get the client data
	 */

	public Object getClientData() {
		return clientData;
	}

	/**
	 * auto generated Axis2 call back method for getLastestLocation method
	 * override this method for handling normal response from getLastestLocation
	 * operation
	 */
	public void receiveResultgetLastestLocation(
			com.rowell.sifa.web.terminal.DxLocation.location.GetLastestLocationResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getLastestLocation operation
	 */
	public void receiveErrorgetLastestLocation(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getAutoLocBySchedule method
	 * override this method for handling normal response from
	 * getAutoLocBySchedule operation
	 */
	public void receiveResultgetAutoLocBySchedule(
			com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocByScheduleResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getAutoLocBySchedule operation
	 */
	public void receiveErrorgetAutoLocBySchedule(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getEnterpriseStat method
	 * override this method for handling normal response from getEnterpriseStat
	 * operation
	 */
	public void receiveResultgetEnterpriseStat(
			com.rowell.sifa.web.terminal.DxLocation.location.GetEnterpriseStatResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getEnterpriseStat operation
	 */
	public void receiveErrorgetEnterpriseStat(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getLocListByPage method
	 * override this method for handling normal response from getLocListByPage
	 * operation
	 */
	public void receiveResultgetLocListByPage(
			com.rowell.sifa.web.terminal.DxLocation.location.GetLocListByPageResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getLocListByPage operation
	 */
	public void receiveErrorgetLocListByPage(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getEntLocStat method override
	 * this method for handling normal response from getEntLocStat operation
	 */
	public void receiveResultgetEntLocStat(
			com.rowell.sifa.web.terminal.DxLocation.location.GetEntLocStatResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getEntLocStat operation
	 */
	public void receiveErrorgetEntLocStat(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getLocationHistory method
	 * override this method for handling normal response from getLocationHistory
	 * operation
	 */
	public void receiveResultgetLocationHistory(
			com.rowell.sifa.web.terminal.DxLocation.location.GetLocationHistoryResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getLocationHistory operation
	 */
	public void receiveErrorgetLocationHistory(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getBusiStat method override
	 * this method for handling normal response from getBusiStat operation
	 */
	public void receiveResultgetBusiStat(com.rowell.sifa.web.terminal.DxLocation.location.GetBusiStatResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getBusiStat operation
	 */
	public void receiveErrorgetBusiStat(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getLocation method override
	 * this method for handling normal response from getLocation operation
	 */
	public void receiveResultgetLocation(com.rowell.sifa.web.terminal.DxLocation.location.GetLocationResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getLocation operation
	 */
	public void receiveErrorgetLocation(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for queryAutoLoc method override
	 * this method for handling normal response from queryAutoLoc operation
	 */
	public void receiveResultqueryAutoLoc(
			com.rowell.sifa.web.terminal.DxLocation.location.QueryAutoLocResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from queryAutoLoc operation
	 */
	public void receiveErrorqueryAutoLoc(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for cancelAutoLocation method
	 * override this method for handling normal response from cancelAutoLocation
	 * operation
	 */
	public void receiveResultcancelAutoLocation(
			com.rowell.sifa.web.terminal.DxLocation.location.CancelAutoLocationResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from cancelAutoLocation operation
	 */
	public void receiveErrorcancelAutoLocation(java.lang.Exception e) {
	}

	/**
	 * auto generated Axis2 call back method for getAutoLocation method override
	 * this method for handling normal response from getAutoLocation operation
	 */
	public void receiveResultgetAutoLocation(
			com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocationResponse result) {
	}

	/**
	 * auto generated Axis2 Error handler override this method for handling
	 * error response from getAutoLocation operation
	 */
	public void receiveErrorgetAutoLocation(java.lang.Exception e) {
	}

}
