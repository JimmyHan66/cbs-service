<template>
    <div class="app-container" id="dataDeal">
        <div class="block">
            <el-row :gutter="20">
                <el-col :span="4">
                    <el-select v-model="listQuery.contractCode" placeholder="选择品种"
                               @change="changeContract">
                        <el-option
                            v-for="item in contractList"
                            :key="item.contractCode"
                            :label="item.contractName"
                            :value="item.contractCode">
                        </el-option>
                    </el-select>
                </el-col>
                <el-col :span="4">
                    <el-select v-model="tableNameEn" placeholder="选择报表"
                               @change="changeTable" ref="tab leSel">
                        <el-option
                            v-for="item in tableList"
                            :key="item.tableNameEn"
                            :label="item.tableNameCh"
                            :value="item.tableNameEn">
                        </el-option>
                    </el-select>
                </el-col>
            </el-row>
        </div>

        <el-tabs v-model="activeName" @tab-click="handleClick">
            <el-tab-pane label="数据表维护" name="dataEdit">
                <!--操作栏-->
                <el-row>
                    <el-col :span="24">
                        <el-button type="success" size="mini" icon="el-icon-plus" @click.native="add"
                                   v-permission="['/research/dataDeal/add']">{{ $t('button.add') }}
                        </el-button>
                        <el-button type="primary" size="mini" icon="el-icon-edit" @click.native="edit"
                                   v-permission="['/research/dataDeal/update']">{{ $t('button.edit') }}
                        </el-button>
                        <el-button type="danger" size="mini" icon="el-icon-delete" @click.native="remove"
                                   v-permission="['/research/dataDeal/delete']">{{ $t('button.delete') }}
                        </el-button>
                    </el-col>
                </el-row>
                <br>
                <!--表格-->
                <el-table :data="list" row-key="superiorId"
                          v-loading="listLoading" element-loading-text="Loading" stripe border highlight-current-row>
                    <el-table-column v-for="(item,index) in fieldList" :key="index" :label="item.tableFieldName"
                                     :prop="item.tableField"></el-table-column>
                    <el-table-column label="操作">
                        <template slot-scope="scope">
                            <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)"
                                       v-permission="['/research/dataDeal/update']">{{ $t('button.edit') }}
                            </el-button>
                            <el-button type="text" size="mini" icon="el-icon-delete"
                                       @click.native="removeItem(scope.row)"
                                       v-permission="['/research/dataDeal/delete']">{{ $t('button.delete') }}
                            </el-button>
                        </template>
                    </el-table-column>
                </el-table>
                <!--分页-->
                <el-pagination
                    background
                    layout="total, sizes, prev, pager, next, jumper"
                    :page-sizes="[10, 20, 50, 100,500]"
                    :page-size="listQuery.limit"
                    :total="total"
                    @size-change="changeSize"
                    @current-change="fetchPage"
                    @prev-click="fetchPrev"
                    @next-click="fetchNext">
                </el-pagination>
            </el-tab-pane>
            <el-tab-pane label="图表化展示" name="dataChart">
                <el-row>
                    <el-col :span="24">
                        <div class="section">
                            <v-chart :options="option" v-show="chartShow" ref="lineChart"
                                     style="width:100%;height: 600px"/>
                        </div>
                    </el-col>
                </el-row>
            </el-tab-pane>
        </el-tabs>

        <!--增改弹框-->
        <el-dialog
            :title="formTitle"
            :visible.sync="formVisible"
            width="70%">
            <el-form ref="form" :model="form" :rules="rules" label-width="120px">
                <el-row>
                    <el-col :span="12" v-for="(item, index) in fieldList" :key="index">
                        <el-form-item :label="item.tableFieldName">
                            <el-input v-model="form[item.tableField]" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-form-item>
                    <el-button type="primary" @click="save">{{ $t('button.submit') }}</el-button>
                    <el-button @click.native="formVisible = false">{{ $t('button.cancel') }}</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>
    </div>
</template>

<script src="./dataDeal.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
    .echarts {
        width: 100%;
        height: 100%;
    }
    .section {
        padding: 20px;
        background-color: white;
        border: 1px solid #ebeef5;
        box-shadow: 0 2px 12px 0 rgba(0, 0, 0, .1);
    }
</style>

