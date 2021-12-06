package com.ccfc.cbs.service.system;

import com.ccfc.cbs.BaseApplicationStartTest;
import com.ccfc.cbs.bean.vo.node.ZTreeNode;
import com.ccfc.cbs.utils.JsonUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created  on 2018/4/5 0005.
 *
 * @author enilu
 */
public class DeptServiceTest extends BaseApplicationStartTest {


    @Autowired
    private DeptService deptService;

    @Test
    public void tree() {
        List<ZTreeNode> list = deptService.tree();
        for (ZTreeNode treeNode : list) {
            System.out.println(JsonUtil.toJson(treeNode));
        }
    }

}
