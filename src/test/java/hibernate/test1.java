package hibernate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


public class test1 extends BaseTest{

@Test
public void test() {//�޲�public  �޷���ֵ
	DateFormat format1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	DateFormat format2=new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(format1.format(new Date()));
}
}
