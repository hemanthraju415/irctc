package com.pennant.irctc.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/getstations" }, loadOnStartup = 1)
public class AllStationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
		response.addHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		JSONObject obj = new JSONObject();
		JSONArray codearr = new JSONArray();
		JSONArray namearr = new JSONArray();
		StationListModel stations = new StationDAL().getStations();
		stations.forEach((station) -> {
			codearr.put(station.getStation_code().trim());
			namearr.put(station.getStation_name().trim());
		});
		obj.put("st_id", codearr);
		obj.put("st_name", namearr);
		out.println(obj);
		out.close();
	}

}
