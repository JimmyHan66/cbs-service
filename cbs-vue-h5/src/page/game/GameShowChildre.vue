<template>
<div class="box">
    <div class="titleC">
          <p>第四届赢在中原期货实盘交易大赛</p>
    </div>
    <el-table
    :data="tableData"
    border
    :stripe=true
    :fit=true
    :show-header=false
    >
    <el-table-column
      prop="msg"
      label="信息"
      align ="center"
     >
    </el-table-column>
    <el-table-column
      prop="data"
      label="数据"
      align ="center"
     >
    </el-table-column>

    </el-table>
    <div id="chart_example"/>
    <div id="chart_Cumulative"/>
    <group>
        <x-textarea autosize name="detail" v-model="explainFont" :show-counter="false" :readonly="true"></x-textarea>
    </group>
</div>
</template>

<script src="./GameShowChildre.js" />
<style type="text/css" src="../../style/GameShowChildre.css"/>

