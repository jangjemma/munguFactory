package com.oracle.munguFactory.ljw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.munguFactory.dto.AccountsDTO;
import com.oracle.munguFactory.dto.PageDTO;
import com.oracle.munguFactory.dto.SubulDTO;
import com.oracle.munguFactory.ljw.service.ljwService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ljwController {
	private final ljwService service;
	
	@GetMapping("/inventoryManagement")
	public String inventoryManagementMain(Model model) {
		model.addAttribute("factoryList",service.getFactoryList());
		return "inventoryManagement/main";
	}
	@PostMapping("/inventoryManagementListAjaxChk")
	public String inventoryManagementListAjaxChk(@RequestParam(defaultValue = "1") int pageNum,PageDTO searchOptions, Model model) {
		log.info("inventoryManagementListAjaxChk() start...");
		searchOptions.setPageDTO(service.getSubulListSize(searchOptions), pageNum);
		List<SubulDTO> subulList = service.getSubulList(searchOptions);
		model.addAttribute("paging",searchOptions);
		model.addAttribute("subulList", subulList);
		return "inventoryManagement/inventoryManagementList";
	}
	@GetMapping("/Shipment")
	public String shipmentMain(Model model) {
		model.addAttribute("factoryList",service.getFactoryList());
		return "shipment/main";
	}
	@PostMapping("/shipmentAjaxChk")
	public String shipmentAjaxChk(@RequestParam(defaultValue = "1") int pageNum,PageDTO searchOptions, Model model) {
		log.info("shipmentAjaxChk() start...");
		searchOptions.setPageDTO(service.getSubulListSize(searchOptions), pageNum);
		List<SubulDTO> subulList = service.getSubulList(searchOptions);
		model.addAttribute("paging",searchOptions);
		model.addAttribute("subulList", subulList);
		return "shipment/shipmentList";
	}
	@GetMapping("/ajaxInsertShipment")
	public String ajaxInsertShipment(Model model) {
		List<AccountsDTO> accountList = service.getAccountList(); 
		return "shipment/shipmentList";
	}
}
