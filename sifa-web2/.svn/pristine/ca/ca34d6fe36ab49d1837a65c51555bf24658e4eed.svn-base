package com.rowell.sifa.web.servlet;

import javax.jws.WebService;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

@WebService
@Path("/locationService")
public class LocationService extends SpringBeanAutowiringSupport {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(LocationService.class);

	@POST
	@Produces(MediaType.TEXT_PLAIN)
	public String getLocationInfo(String xmlString) {
		System.out.println("locationService:");
		System.out.println(xmlString);
		String tempStr = "";
		return tempStr;
	}
}
