package com.ccfc.cbs.util;

import com.ccfc.cbs.api.utils.DataBaseDocUtil;
import org.junit.Test;

/**
 * @author shibl
 * @date 2020/8/4 10:17
 */
public class DataBaseDocUtilTest {
    @Test
    public void genDoc() {
        DataBaseDocUtil dbUtil = new DataBaseDocUtil();
        dbUtil.documentGeneration();
    }
}
