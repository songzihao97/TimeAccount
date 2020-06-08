import com.szh.domain.LeaAccount;
import com.szh.domain.LearnType;
import com.szh.domain.WorkAccount;
import com.szh.service.LeaService;
import com.szh.service.WorkService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TestWork {

    static WorkService workService;

    @Before
    public void init(){
        ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        workService=ctx.getBean(WorkService.class);
    }

    @Test
   public void testFindAll(){
       List<WorkAccount> allWorkAccountById = workService.findAllWorkAccountById(3);
       for (WorkAccount workAccount : allWorkAccountById) {
           System.out.println(workAccount);
       }
   }

   //测试字符串拆分
    @Test
    public void testString(){
        String a="120:30:00";
        int first1=a.indexOf(':');
        System.out.println(first1);
        System.out.println(a.substring(0,first1));
        int H=Integer.parseInt(a.substring(0,first1));
        int m=Integer.parseInt(a.substring(first1+1,first1+3));
        System.out.println(H);
        System.out.println(m);
    }
}
