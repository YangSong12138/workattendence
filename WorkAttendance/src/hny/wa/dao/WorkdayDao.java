package hny.wa.dao;

import hny.wa.model.Workday;

import java.util.List;

public interface WorkdayDao {
	public void updateWorkday(String workday);
	public List<Workday> getWorkday();
}
