package hny.wa.service;

import hny.wa.model.Workday;
import java.util.List;



public interface WorkdayService {
	//sy
	public void updateWorkday(String workday);
	public List<Workday> getWorkday();	
	public boolean isWorkday(String day);
}
