import com.szh.domain.LeaAccount;
import com.szh.domain.LearnType;
import com.szh.domain.User;
import com.szh.service.LeaService;
import com.szh.service.UserService;
import org.apache.ibatis.annotations.Update;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.xml.transform.Source;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TestLea {

    static LeaService leaService;

    @Before
    public void init(){
        ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        leaService=ctx.getBean(LeaService.class);
    }

    @Test
    public void testFindAll()  {
        List<LearnType> allLearnType = leaService.findAllLearnType();
        for (LearnType learnType : allLearnType) {
            System.out.println(learnType);
        }
    }

    @Test
    public void testFindAllLeaAccount()  {
        List<LeaAccount> allLeaAccount = leaService.findAllLeaAccount();
        for (LeaAccount leaAccount : allLeaAccount) {
            System.out.println(leaAccount);
            String elapsedTime = leaAccount.getElapsedTime();
            Date startTime = leaAccount.getStartTime();
            System.out.println(elapsedTime);
            System.out.println(startTime);
        }
    }

    @Test
    public void testFindAllLeaAccountById()  {
        List<LeaAccount> allLeaAccount = leaService.findAllLeaAccountById(3);
        for (LeaAccount leaAccount : allLeaAccount) {
            System.out.println(leaAccount);
            String elapsedTime = leaAccount.getElapsedTime();
            Date startTime = leaAccount.getStartTime();
            System.out.println(elapsedTime);
            System.out.println(startTime);
        }
    }

    @Test
    public void testAdd(){
        LeaAccount leaAccount=new LeaAccount();
        leaAccount.setUid(1);
        leaAccount.setSchedule("123");
        leaAccount.setDate(new Date());
        leaAccount.setTypeId(1);
        leaAccount.setStartTime(new Date());
        leaAccount.setEndTime(new Date());
        leaService.addLea(leaAccount);
    }

    @Test
    public void testTime() throws ParseException {
       /* DateFormat df = new SimpleDateFormat("HH:mm");
        String s="03%3A30";
        // 解析字符串
        Date date = df.parse(URLDecoder.decode(s));
        System.out.println(date);*/

        String s1="2016-10-30";
        String s2="2016-10-30T10:30";
        String s4="2016-10-30 10:30";
        String s3="10:30";

        Date date1 = StringToDate(s1);
        System.out.println(date1);
        Date date2 = StringToDate(s2);
        System.out.println(date2);
        Date date3 = StringToDate(s3);
        System.out.println(date3);
        Date date4 = StringToDate(s4);
        System.out.println(date4);

    }

    public static Date StringToDate(String s) throws ParseException {
        if (s.contains("-")&&s.contains(":")&&s.contains("T")){
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            return df.parse(s);
        }else if(s.contains("-")&&s.contains(":")){
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            return df.parse(s);
        } else if (s.contains("-")&&!s.contains(":")){
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            return df.parse(s);
        }else {
            DateFormat df = new SimpleDateFormat("HH:mm");
            return df.parse(s);
        }
    }

    @Test
    public void testFindById(){
        LeaAccount leaByLId = leaService.findLeaByLId(18);
        System.out.println(leaByLId);
    }

    @Test
    public void testDelById(){
        leaService.delLea(18);
    }

    @Test
    public void testUpdateById(){
        LeaAccount leaByLId = leaService.findLeaByLId(18);
        leaByLId.setSchedule("new");
        leaService.updateLea(leaByLId);
    }
}
