package com.ccfc.cbs.api.controller.front.officialsite;

import com.ccfc.cbs.api.controller.BaseController;
import com.ccfc.cbs.bean.entity.cms.Article;
import com.ccfc.cbs.bean.enumeration.cms.BannerTypeEnum;
import com.ccfc.cbs.bean.enumeration.cms.ChannelEnum;
import com.ccfc.cbs.bean.vo.front.Rets;
import com.ccfc.cbs.bean.vo.offcialsite.BannerVo;
import com.ccfc.cbs.bean.vo.offcialsite.Solution;
import com.ccfc.cbs.service.cms.ArticleService;
import com.ccfc.cbs.service.cms.BannerService;
import com.ccfc.cbs.utils.Maps;
import com.ccfc.cbs.utils.factory.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/offcialsite/solution")
public class SolutionController extends BaseController {
    @Autowired
    private BannerService bannerService;
    @Autowired
    private ArticleService articleService;

    @RequestMapping(method = RequestMethod.GET)
    public Object index() {
        Map<String, Object> dataMap = Maps.newHashMap();

        BannerVo banner = bannerService.queryBanner(BannerTypeEnum.SOLUTION.getValue());
        dataMap.put("banner", banner);

        List<Solution> solutions = new ArrayList<>();
        Page<Article> articlePage = articleService.query(1, 10, ChannelEnum.SOLUTION.getId());
        for (Article article : articlePage.getRecords()) {
            solutions.add(new Solution(article.getId(), article.getTitle(), article.getImg()));
        }
        dataMap.put("solutionList", solutions);

        Map map = Maps.newHashMap("data", dataMap);
        return Rets.success(map);

    }
}
