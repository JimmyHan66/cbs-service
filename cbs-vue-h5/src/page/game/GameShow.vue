<template>
  <div class="box">
      <div class="title">
          <p>第四届赢在中原期货实盘交易大赛</p>
          <!-- <img src="../../../static/images/stock1.jpg" alt="LOGO"> -->

        <div class="searchDiv">
                <div class="search">
                    <!-- <div class="nameSearch searchCon">
                        <div>参赛昵称</div>
                        <el-input placeholder="请输入完整昵称" v-model="nameSearch" clearable> </el-input>
                    </div>
                    <div class="accontSearch searchCon">
                        <div>资金账户</div>
                        <el-input placeholder="请输入资金账户" v-model="accontSearch" clearable> </el-input>
                    </div> -->
                    <div class="row">
                        <span>
                            <input class="swing" v-model="nameSearch" id="artist" type="text" placeholder="请输入完整昵称" /><label for="artist">昵称</label>
                        </span>
                        <span>
                            <input class="swing" v-model="accontSearch" id="song" type="text" placeholder="请输入资金账户" /><label for="song">账户</label>
                        </span>
                    </div>
                </div>
                <div class="searchBtn">
                    <span class="iconfont icon-chaxun" @click="searchHandel()"></span>
                </div>
        </div>
      </div>
      <div class="searchShadow"></div>
      <div class="group">
        <tab :line-width=2 custom-bar-width="2rem" >
            <tab-item  v-for="(item, index) in group" :key="index" :selected="groupTypeData === index+1" @on-item-click="tabClick(item)" >{{item}}</tab-item>
        </tab>
      </div>
      <div class="msgShow">
          <div class="msgShowDiv"></div>
          <ul>
                <li class="msgShowTitle">
                  <div>排名</div>
                  <div>信息</div>
                  <div>得分</div>
              </li>
              <li v-for="(item,index) in dataGroup" :key="index">
                   <router-link
                  :to="{
                  name:'GameShowChildre',
                  params:{uId:item.fundAccount},
                  path:'/GameShowChildre'
                  }">
                    <div class="iconLi firstLi" v-show="item.rankDay===1?true:false">
                            <span class="iconfont icon-first"></span>
                        </div>
                    <div class="iconLi secondLi" v-show="item.rankDay===2?true:false">
                            <span class="iconfont icon-second"></span>
                    </div>
                    <div class="iconLi thirdLi" v-show="item.rankDay===3?true:false">
                            <span class="iconfont icon-third"></span>
                    </div>
                   <div class="rankLi" v-show="item.rankDay>3?true:false">
                    {{item.rankDay}}
                  </div>
                  <div class="nameLi">
                       <div>{{item.contestantNickname}}</div>
                      <p>{{item.fundAccountName}}</p>
                  </div>
                  <div class="scoreLi">{{item.maxPrincipalRateGrade}}</div>
                   </router-link>
              </li>
          </ul>
      </div>
      <div class="pagination">
        <div class="block">
            <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page.sync="currentPage3"
            :page-size="1"
            layout="prev, pager, next"
            :total="pageTotal"
            :pager-count="5">
            </el-pagination>
        </div>
      </div>
      <div>
            <img src="static/images/wxcode_ccfc.png">
      </div>
    </div>
</template>

<script src="./GameShow.js">
</script>
<style type="text/css" src="../../../static\font\font_moarishht59\iconfont.css"/>

<style type="text/css" src="../../style/public.css"/>
<style type="text/css" src="../../../static\font\font_rank\iconfont.css"/>
<style type="text/css" src="../../style\GameShow.css"/>
<style type="text/css" src="../../style\GameShowInput.css"/>




