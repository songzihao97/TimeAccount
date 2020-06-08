import com.github.pagehelper.PageInfo;
import com.szh.domain.User;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用spring单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:springMVC.xml"})
public class MvcTest {
   /* //传入springMVC的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc获取结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }*/

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        /*MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/user/userList")
                .param("pn", "1")).andReturn();
*/
        //取出pageInfo
             /*//PageInfo包含了非常全面的分页属性
            assertEquals(1, page.getPageNum());
            assertEquals(10, page.getPageSize());
            assertEquals(1, page.getStartRow());
            assertEquals(10, page.getEndRow());
            assertEquals(183, page.getTotal());
            assertEquals(19, page.getPages());
            assertEquals(1, page.getFirstPage());
            assertEquals(8, page.getLastPage());
            assertEquals(true, page.isFirstPage());
            assertEquals(false, page.isLastPage());
            assertEquals(false, page.isHasPreviousPage());
            assertEquals(true, page.isHasNextPage());*/
      /*  MockHttpServletRequest request = result.getRequest();
        PageInfo pi= (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码："+pi.getPageNum());
        System.out.println("总页码"+pi.getPages());
        System.out.println("总记录数"+pi.getTotal());
        System.out.println("连续显示的页码");
        int[] nums=pi.getNavigatepageNums();
        for (int i : nums) {
            System.out.println(" "+i);
        }
        //获取user数据
        List<User> list = pi.getList();
        for (User user : list) {
            System.out.println("userId:"+user.getUserId()+"-->"+"username:"+user.getUsername()+"birthday:"+user.getBirthday());
        }*/
    }
}
