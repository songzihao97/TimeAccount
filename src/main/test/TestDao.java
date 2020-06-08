import com.szh.domain.Msg;
import com.szh.domain.User;
import com.szh.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TestDao {

    static UserService userService;

    @Before
    public void init(){
        ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        userService=ctx.getBean(UserService.class);
    }

    @Test
    public void testFindAll()  {
        List<User> users = userService.findAllUser();
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void testLogin()  {
        User user = userService.loginService("zangsan", "123");
        System.out.println(user);
    }

    @Test
    public void testSave()  {
        User user=new User();
        user.setUsername("wang");
        user.setPassword("123");
        user.setSex("男");
        userService.registerService(user);
        System.out.println(user);
    }

    @Test
    public void testDel(){
        userService.delete(100);
    }

    @Test
    public void findById(){
        User userById = userService.findUserById(1);
        System.out.println(userById);
    }

    @Test
    public void update(){
        User user=userService.findUserById(3);
        user.setPassword("12345");
        userService.updateUser(user);
    }

    @Test
    public void check() {
        boolean flag = true;
        String username = "zhangsan";
        List<User> users = userService.findAllUser();
        for (User user : users) {
            if (username.equals(user.getUsername())) {
                flag = false;
            }
        }
        System.out.println(flag);
    }
}
