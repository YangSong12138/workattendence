package hny.wa.utils;

import hny.wa.model.Attendance;
import hny.wa.model.Attendance_countDetail;

import java.util.Comparator;


public class Mycomparator implements Comparator{

    public int compare(Object o1,Object o2) {
    	Attendance_countDetail p1=(Attendance_countDetail)o1;
    	Attendance_countDetail p2=(Attendance_countDetail)o2;  
           return p1.getCometime().compareTo(p2.getCometime());
    }

}