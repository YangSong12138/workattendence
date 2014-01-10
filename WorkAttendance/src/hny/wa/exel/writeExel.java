package hny.wa.exel;

import hny.wa.model.Attendance_countDetail;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class writeExel {
	public static  void writeExelXiang(ArrayList<Attendance_countDetail> list,String filename){
		String[] s=headValues.detail;
		// 创建一个工作簿
		HSSFWorkbook book = new HSSFWorkbook();
		// 通过工作簿创建一个工作单
		HSSFSheet sheet = book.createSheet("BBC");
		// 创建工作单中的一个行(作为标题)
		HSSFRow row = sheet.createRow(0);
		
		for(int i = 0 ; i < s.length ; i ++){
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(s[i]);
		}
		// 创建内容行
		for(int i = 0 ; i <list.size() ; i ++){
			row = sheet.createRow(i + 1);
			
			HSSFCell cell0 = row.createCell(0);
			cell0.setCellValue(i+1);
			
			HSSFCell cell1 = row.createCell(1);
			cell1.setCellValue(list.get(i).getUserid());
			
			HSSFCell cell2 = row.createCell(2);
			cell2.setCellValue(list.get(i).getUsername());
			//
			cell2 = row.createCell(3);
			cell2.setCellValue(list.get(i).getDepartmentname());
			
			cell2 = row.createCell(4);
			cell2.setCellValue(list.get(i).getCometime().substring(0, 10));
			
			int state_int=list.get(i).getState();
			int comestate_int=list.get(i).getComestate();
			int gostate_int=list.get(i).getGostate();
			String state="";
			if(state_int==0){
				if((comestate_int=='1')&&(gostate_int=='1')){
					state="迟到且早退";
				}
				else if(gostate_int==1){
					state="早退";
				}
				else if(comestate_int==1){
					state="迟到";
				}
				else {
					state="正常";
				}
			}
			else if(state_int==1){
				state="缺勤";
			}
			else if(state_int==2){
				state="请假";
			}
			else if(state_int==3){
				state="出差";
			}
			else if(state_int==4){
				state="补签";
			}
			
			cell2 = row.createCell(5);
			cell2.setCellValue(state);
			
		}
		try {
			
			FileOutputStream fout=new FileOutputStream(filename);
			book.write(fout);
			System.out.println("exel写入完成...请查验！");
			fout.flush();
			fout.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
