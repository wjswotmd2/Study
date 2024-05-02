package com.portfolio.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

	public IndexController() {
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~생성됨~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	}
	
	@RequestMapping("index.do")
	public String indexPage() {
		return "index";
	}
	
	@RequestMapping("input.do")
	public String inputPage() {
		return "input";
	}
	
	@RequestMapping("output.do")
	public String outputPage(@RequestParam("measureDate") String measureDate,
							@RequestParam("eAmount") int eAmount,
							@RequestParam("discountType1") int discountType1,
							@RequestParam("discountType2") int discountType2,
							HttpServletRequest request) {
		
		int basicRate = 0;
		int electricityRate = 0;
		int totalPrice = 0;
		int environmentPrice = eAmount * 9;
		int fuelCost = eAmount * 5;
		int VAT = 0;
		int powerBased = 0;
		int DC = 0;
		int DC2 = 0;
		
		if(eAmount <= 200) {
			basicRate = 910;
			electricityRate = eAmount * 120;
		}
		else if(eAmount > 200 && eAmount <= 400) {
			basicRate = 1600;
			electricityRate = (int) ((200 * 120) + (eAmount - 200) * 214.6);
		}
		else {
			basicRate = 7300;
			electricityRate = (int) ((int) ((200 * 120) + (200) * 214.6) + (eAmount - 400) * 307.3);
		}
		
		totalPrice = basicRate + electricityRate + environmentPrice;
		
		powerBased = (int) (totalPrice * 0.037);
		
		VAT =  (int) (totalPrice * 10.0/ 100.0);
		
//		요금할인 코드
//		--------------------------------------------------------------------------------------
		int month = Integer.parseInt(measureDate.substring(5, 7));
//		
		if(month == 6 || month == 8) {
		
		if(discountType1 == 1 || discountType1 == 2) {
			DC = 20000;
		}
		else if(discountType1 == 3) {
			DC = 12000;
		}
		else if(discountType1 == 4) {
			DC = 10000;
		}
		}
		else {
			if(discountType1 == 1 || discountType1 == 2) {
				DC = 16000;
			}
			else if(discountType1 == 3) {
				DC = 10000;
			}
			else if(discountType1 == 4) {
				DC = 8000;
			}
		}
		
		if(discountType2 == 1|| discountType2 == 2 || discountType2 == 3) {
			DC += (int) (totalPrice * 0.3 >= 16000 ? 16000 : totalPrice * 0.3);
		}
		else if(discountType2 == 4 || discountType2 == 5){
			DC += totalPrice * 0.3;
		}
		
		System.out.println(DC);
		
		int realTotal = totalPrice + VAT + powerBased - DC;
		
		
		request.setAttribute("measureDate", measureDate);
		request.setAttribute("eAmount", eAmount);
		request.setAttribute("basicRate", basicRate);
		request.setAttribute("electricityRate", electricityRate);
		request.setAttribute("environmentPrice", environmentPrice);
		request.setAttribute("fuelCost", fuelCost);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("VAT", VAT);
		request.setAttribute("powerBased", powerBased);
		request.setAttribute("DC", DC);
		request.setAttribute("realTotal", realTotal);
		
		
		
		
		return "output";
	}
}
