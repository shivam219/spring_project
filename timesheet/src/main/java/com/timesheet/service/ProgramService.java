package com.timesheet.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.dto.MenuDto;
import com.timesheet.repository.ProgramRepository;

@Service
public class ProgramService {

	@Autowired
	ProgramRepository pr;

	public List<String[]> findAllMenus(int ugrpCode) {

		List<String[]> menus = pr.findAllAllMenuByGroupCode(ugrpCode);
//
//		for (Iterator iterator = menus.iterator(); iterator.hasNext();) {
//			String[] menu = (String[]) iterator.next();
//			for (int i = 0; i < menu.length; i++) {
//				System.out.print(menu[i] + "  ");
//			}
//			System.out.println();
//		}



		/*
		 * null 30 Timesheet Application # 
		 * null 35 Leave Application # 
		 * null 45 Reports #
		 * 30 3001 Create Timesheet day-sheet 
		 * 35 3501 Apply Leave apply-leave 
		 * 35 3503 Cancel Leave cancle-leave 
		 * 45 50 Timesheet Application Reports # 
		 * 45 55 Leave Application Reports # 
		 * 50 5003 Check Approval Status report-month-check 
		 * 55 5501 Monthly Approve Leave Report leave-report
		 */
		
		//print all menu and sub menu in proper manner
//		for (Iterator iterator = menus.iterator(); iterator.hasNext();) {
//			String[] menu = (String[]) iterator.next();
//
//			if (menu[0] == null) {
//				System.out.println(menu[2]);
//
//				Iterator it = menus.iterator();
//				it.next();
//				for (; it.hasNext();) {
//
//					String[] submenu = (String[]) it.next();
//
//					if (menu[1].equals(submenu[0])) {
//						System.out.println("    " + submenu[2]);
//
//						Iterator itt = menus.iterator(); 
//						itt.next();
//						for (; itt.hasNext();) {
//
//							String[] subinmenu = (String[]) itt.next();
//
//							if (submenu[1].equals(subinmenu[0])) {
//								System.out.println("        " + subinmenu[2]);
//							}
//						}
//					}
//				}
//
//			}
//		}

		return menus;
	}

}
