package bean;

import Use.ClassRoom;
import Use.Teacher;
import java.util.ArrayList;

public class Bean {
    public ArrayList t,c,a;

    public ArrayList<Courses> getA() {
        return a;
    }

    public void setA(ArrayList<Courses> a) {
        this.a = a;
    }

    public ArrayList<ClassRoom> getC() {
        return c;
    }

    public void setC(ArrayList<ClassRoom> c) {
        this.c = c;
    }

    public ArrayList<Teacher> getT() {
        return t;
    }

    public void setT(ArrayList<Teacher> t) {
        this.t = t;
    }
    
}
