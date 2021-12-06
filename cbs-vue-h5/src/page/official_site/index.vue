<template>
  <div>
    <swiper @on-index-change="bannerChange">
        <swiper-item v-for="(item,i) in banner" :key="i">
                <img class="sImg" :src="item.img" :alt="item.title" @click="handelClick(item)">
        </swiper-item>
    </swiper>
     <menuGroup></menuGroup>
     <voice></voice>
     <headLines></headLines>
    <!-- <productList title="产品展示" :list="productList" ></productList>
    <productList title="解决方案" :list="solutionList" ></productList>
    <group-title>{{title}}</group-title>
    <template >
    <group-title>最新资讯</group-title>
    <panel :list="newsList"></panel>
    </template> -->
    <!-- <footMenu ></footMenu> -->
  </div>
</template>
<script src="./index.js"></script>
<style>
    .sImg{height: 180px;}
</style>
