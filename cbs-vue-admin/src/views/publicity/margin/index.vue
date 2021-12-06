<template>
    <div class="app-container">
        <div class="block">
            <el-row :gutter="20">
                <el-col :span="2">
                    <el-input v-model="listQuery.contractCode" size="mini" placeholder="请输入合约代码"></el-input>
                </el-col>
                <el-col :span="2">
                    <el-input v-model="listQuery.contractName" size="mini" placeholder="请输入合约名称"></el-input>
                </el-col>
                <el-col :span="2">
                    <el-select v-model="listQuery.marketNo" size="mini" placeholder="请选择交易所">
                        <el-option
                            v-for="item in marketList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </el-col>
                <el-col :span="6">
                    <el-date-picker
                        v-model="timeRange"
                        size="mini"
                        type="datetimerange"
                        range-separator="至"
                        start-placeholder="修改开始时间"
                        end-placeholder="修改结束时间">
                    </el-date-picker>
                </el-col>
                <el-col :span="6">
                    <el-button type="success" size="mini" icon="el-icon-search" @click.native="search">{{
                        $t('button.search') }}
                    </el-button>
                    <el-button type="primary" size="mini" icon="el-icon-refresh" @click.native="reset">{{
                        $t('button.reset') }}
                    </el-button>
                </el-col>
            </el-row>
            <br>
            <el-row>
                <el-col :span="24">
                    <el-button type="success" size="mini" icon="el-icon-plus" @click.native="add"
                               v-permission="['/publicity/margin/add']">{{ $t('button.add') }}
                    </el-button>
                    <el-button type="primary" size="mini" icon="el-icon-edit" @click.native="edit"
                               v-permission="['/publicity/margin/update']">{{ $t('button.edit') }}
                    </el-button>
                    <el-button type="danger" size="mini" icon="el-icon-delete" @click.native="remove"
                               v-permission="['/publicity/margin/delete']">{{ $t('button.delete') }}
                    </el-button>
                    <el-button type="info" size="mini" icon="el-icon-document" @click.native="exportXls"
                               v-permission="['/publicity/margin/export']">{{ $t('button.export') }}
                    </el-button>
                     <el-button type="warning" size="mini" icon="el-icon-circle-plus-outline" @click.native="batchAdd"
                               v-permission="['/publicity/margin/batch']">{{ $t('button.batch') }}
                    </el-button>
                </el-col>
            </el-row>
        </div>


        <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" stripe border highlight-current-row
                  @current-change="handleCurrentChange">
            <el-table-column label="修改时间" width="100px">
                <template slot-scope="scope">
                    {{scope.row.modifyTime}}
                </template>
            </el-table-column>
            <el-table-column label="合约代码">
                <template slot-scope="scope">
                    {{scope.row.contractCode}}
                </template>
            </el-table-column>
            <el-table-column label="合约名称">
                <template slot-scope="scope">
                    {{scope.row.contractName}}
                </template>
            </el-table-column>
            <el-table-column label="交易所">
                <template slot-scope="scope">
                    {{scope.row.marketName}}
                </template>
            </el-table-column>
            <el-table-column label="合约乘数">
                <template slot-scope="scope">
                    {{scope.row.multiplier}}
                </template>
            </el-table-column>
            <el-table-column label="合约乘数单位">
                <template slot-scope="scope">
                    {{scope.row.multiplierUnit}}
                </template>
            </el-table-column>
<!--            <el-table-column label="最新价">-->
<!--                <template slot-scope="scope">-->
<!--                    {{scope.row.lastPrice}}-->
<!--                </template>-->
<!--            </el-table-column>-->
            <el-table-column label="价格单位">
                <template slot-scope="scope">
                    {{scope.row.priceUnit}}
                </template>
            </el-table-column>
            <el-table-column label="最小变动价位">
                <template slot-scope="scope">
                    {{scope.row.minChangePrice}}
                </template>
            </el-table-column>
            <el-table-column label="交易所保证金比例(%)">
                <template slot-scope="scope">
                    {{scope.row.exchangeMargin}}
                </template>
            </el-table-column>
            <el-table-column label="公司保证金比例(%)">
                <template slot-scope="scope">
                    {{scope.row.companyMargin}}
                </template>
            </el-table-column>
            <el-table-column label="涨跌幅比例(%)">
                <template slot-scope="scope">
                    {{scope.row.quoteChange}}
                </template>
            </el-table-column>
            <el-table-column label="备注">
                <template slot-scope="scope">
                    {{scope.row.remark}}
                </template>
            </el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)"
                               v-permission="['/publicity/margin/update']">{{ $t('button.edit') }}
                    </el-button>
                    <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)"
                               v-permission="['/publicity/margin/delete']">{{ $t('button.delete') }}
                    </el-button>
                </template>
            </el-table-column>
        </el-table>

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

        <el-dialog
            :title="formTitle"
            :visible.sync="formVisible"
            width="70%">
            <el-form ref="form" :model="form" :rules="rules" label-width="180px">
                <el-row>
                    <el-col :span="12">
                        <el-form-item label="合约代码">
                            <el-input v-model="form.contractCode" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="合约名称">
                            <el-input v-model="form.contractName" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="交易所">
                            <dict-select dictName="期货交易所编号"
                                         v-model="form.marketNo"
                                         @change="changeExchange"
                                         placeholder="请选交易所">
                            </dict-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="合约乘数">
                            <el-input v-model="form.multiplier" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="合约乘数单位">
                            <el-input v-model="form.multiplierUnit" placeholder="如:吨/手" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="最新价">
                            <el-input v-model="form.lastPrice" placeholder="预留字段,建议为空" type='number'
                                      :disabled="true" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="价格单位">
                            <el-input v-model="form.priceUnit" placeholder="如:元/吨" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="最小变动价位">
                            <el-input v-model="form.minChangePrice" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="交易所保证金比例(%)">
                            <el-input v-model="form.exchangeMargin" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="公司保证金比例(%)">
                            <el-input v-model="form.companyMargin" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="涨跌幅比例(%)">
                            <el-input v-model="form.quoteChange" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="备注">
                            <el-input v-model="form.remark" minlength=1></el-input>
                        </el-form-item>
                    </el-col>

                </el-row>
                <!-- 特殊合约 -->
                <el-row type="flex" justify="center" :v-show="!isAdd">
                    <el-col :span="22">

                        <div>
                            <div style="float:left; display: inline">
                                <el-button type="primary" size="mini"
                                           @click="addRow">新增
                                </el-button>
                            </div>
                            <div style="float:left; display: inline">
                                <p style="color: red">&nbsp;(提示：特殊合约保证金标准新增或修改时，请点击“保存”，否则不会更新！)</p>
                            </div>

                            <el-table width :data="specialMarginList" element-loading-text="Loading" size="mini" border
                                      highlight-current-row>
                                <el-table-column label="序号" type="index" width="50"></el-table-column>
                                <el-table-column label="特殊合约代码" align="center" width="180">
                                    <template slot-scope="scope">
                                        <el-input v-model="scope.row.specialContractCode" size="small"
                                                  :disabled="!scope.row.disabled"></el-input>
                                    </template>
                                </el-table-column>
                                <el-table-column label="交易所(%)" align="center" width="120">
                                    <template slot-scope="scope">
                                        <el-input v-model="scope.row.exchangeMargin" size="small"
                                                  :disabled="!scope.row.disabled"></el-input>
                                    </template>
                                </el-table-column>
                                <el-table-column label="公司(%)" align="center" width="120">
                                    <template slot-scope="scope">
                                        <el-input v-model="scope.row.companyMargin" size="small"
                                                  :disabled="!scope.row.disabled"></el-input>
                                    </template>
                                </el-table-column>
                                <el-table-column label="涨跌幅(%)" align="center" width="120">
                                    <template slot-scope="scope">
                                        <el-input v-model="scope.row.quoteChange" size="small"
                                                  :disabled="!scope.row.disabled"></el-input>
                                    </template>
                                </el-table-column>
                                <el-table-column label="备注" align="center">
                                    <template slot-scope="scope">
<!--                                        <el-input v-model="scope.row.remark" size="small"-->
<!--                                                  :disabled="!scope.row.disabled"></el-input>-->
                                        <el-select
                                            v-model="scope.row.remark"
                                            :disabled="!scope.row.disabled"
                                            size="small"
                                            width="200"
                                            filterable
                                            allow-create
                                            default-first-option
                                            placeholder="请输入或选择备注">
                                            <el-option
                                                v-for="item in options"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                            </el-option>
                                        </el-select>
                                    </template>
                                </el-table-column>

                                <el-table-column align="center" label="操作" width="250%">
                                    <template slot-scope="scope">
                                        <el-button v-if="scope.row.edit" type="success" size="mini"
                                                   @click="confirmEdit(scope.row)">保存
                                        </el-button>
                                        <el-button v-else type="primary" size="mini"
                                                   @click="startEdit(scope.row)">编辑
                                        </el-button>
                                        <el-button v-if="scope.row.edit" type="warning" size="mini"
                                                   @click="cancelEdit(scope.row)">取消
                                        </el-button>
                                        <el-button type="danger" size="mini" @click="deleteRow(scope.row)">删除
                                        </el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </div>
                    </el-col>
                </el-row>
                <br>
                <el-form-item>
                    <el-button type="primary" @click="save">{{ $t('button.submit') }}</el-button>
                    <el-button @click.native="formVisible = false">{{ $t('button.cancel') }}</el-button>
                </el-form-item>

            </el-form>
        </el-dialog>

        <!-- 批量增删特殊合约弹出框 -->
        <el-dialog
            :title="batchAddTitle"
            :visible.sync= "batchAddVisible"
            width="70%">
            <el-form  :model="batchFormVal" :rules="rules" label-width="180px">
                <el-row>
                     <el-col :span="12" label-width= auto>
                        <el-form-item label="交易所">
                            <el-select v-model="batchForm.marketNo" size="medium" placeholder="请选择交易所" @change="batchChange(batchForm.marketNo)" >
                                <el-option
                                    v-for="item in marketList"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="合约代码">
                           <el-select v-model="batchForm.contractCodeList" placeholder="请选择" multiple>
                                <el-option
                                v-for="item in batchContractCode"
                                :key="item.value"
                                :label="item.value"
                                :value="item.value">
                                <span style="float: left; color: #8492a6; font-size: 13px">{{ item.value }}</span>
                                <span style="float: right">{{ item.label }}</span>
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="合约月份">
                            <el-input v-model="batchForm.contractMonth" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="交易所保证金比例(%)">
                            <el-input v-model="batchForm.exchangeMargin" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="公司保证金比例(%)">
                            <el-input v-model="batchForm.companyMargin" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="涨跌幅比例(%)">
                            <el-input v-model="batchForm.quoteChange" type='number' minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="备注">
                                        <el-select
                                            v-model="batchForm.remark"
                                            size="medium"
                                            width="200"
                                            filterable
                                            allow-create
                                            default-first-option
                                            placeholder="请输入或选择备注">
                                            <el-option
                                                v-for="item in options"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                            </el-option>
                                        </el-select>
                        </el-form-item>
                    </el-col>
                </el-row>
                <br>
                <el-form-item>
                    <el-button type="primary" @click="batchSave">{{ $t('button.batchSubmit') }}</el-button>
                    <el-button type="danger" @click="batchDel">{{ $t('button.batchDel') }}</el-button>
                    <el-button @click.native="batchAddVisible = false">{{ $t('button.cancel') }}</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>
    </div>
</template>

<script src="./margin.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
</style>

