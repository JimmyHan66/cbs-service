<template>
    <div class="app-container">
        <div class="block">
            <el-row  :gutter="20">
                <el-col :span="4">
                    <el-input v-model="listQuery.id" size="mini" placeholder="请输入id"></el-input>
                </el-col>
                <el-col :span="6">
                    <el-button type="success" size="mini" icon="el-icon-search" @click.native="search">{{ $t('button.search') }}</el-button>
                    <el-button type="primary" size="mini" icon="el-icon-refresh" @click.native="reset">{{ $t('button.reset') }}</el-button>
                </el-col>
            </el-row>
            <br>
            <el-row>
                <el-col :span="24">
                    <el-button type="success" size="mini"  icon="el-icon-plus" @click.native="add" v-permission="['/game/fundchg/add']">{{ $t('button.add') }}</el-button>
                    <el-button type="primary" size="mini"  icon="el-icon-edit" @click.native="edit" v-permission="['/game/fundchg/update']">{{ $t('button.edit') }}</el-button>
                    <el-button type="danger" size="mini"  icon="el-icon-delete" @click.native="remove" v-permission="['/game/fundchg/delete']">{{ $t('button.delete') }}</el-button>
                </el-col>
            </el-row>
        </div>


        <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
                  @current-change="handleCurrentChange">
            <el-table-column label="日期">
                <template slot-scope="scope">
                    {{scope.row.date}}
                </template>
            </el-table-column>
            <el-table-column label="资金账号">
                <template slot-scope="scope">
                    {{scope.row.fundAccount}}
                </template>
            </el-table-column>
            <el-table-column label="客户结算账户标识">
                <template slot-scope="scope">
                    {{scope.row.settleAccountFlag}}
                </template>
            </el-table-column>
            <el-table-column label="客户结算账户">
                <template slot-scope="scope">
                    {{scope.row.settleAccount}}
                </template>
            </el-table-column>
            <el-table-column label="公司保证金专用账户标识">
                <template slot-scope="scope">
                    {{scope.row.companyMarginAccountFlag}}
                </template>
            </el-table-column>
            <el-table-column label="公司保证金专用账户">
                <template slot-scope="scope">
                    {{scope.row.companyMarginAccount}}
                </template>
            </el-table-column>
            <el-table-column label="备注">
                <template slot-scope="scope">
                    {{scope.row.remark}}
                </template>
            </el-table-column>
            <el-table-column label="是否为交易会员">
                <template slot-scope="scope">
                    {{scope.row.isTradingMember}}
                </template>
            </el-table-column>
            <el-table-column label="币种">
                <template slot-scope="scope">
                    {{scope.row.currency}}
                </template>
            </el-table-column>
            <el-table-column label="出入金类型">
                <template slot-scope="scope">
                    {{scope.row.inoutType}}
                </template>
            </el-table-column>
            <el-table-column label="出入金发生日期">
                <template slot-scope="scope">
                    {{scope.row.inoutDate}}
                </template>
            </el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)" v-permission="['/game/fundchg/update']">{{ $t('button.edit') }}</el-button>
                    <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)" v-permission="['/game/fundchg/delete']">{{ $t('button.delete') }}</el-button>
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
            <el-form ref="form" :model="form" :rules="rules" label-width="120px">
                <el-row>
                    <el-col :span="12">
                        <el-form-item label="日期"  >
                            <el-input v-model="form.date" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="资金账号"  >
                            <el-input v-model="form.fundAccount" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="客户结算账户标识"  >
                            <el-input v-model="form.settleAccountFlag" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="客户结算账户"  >
                            <el-input v-model="form.settleAccount" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="公司保证金专用账户标识"  >
                            <el-input v-model="form.companyMarginAccountFlag" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="公司保证金专用账户"  >
                            <el-input v-model="form.companyMarginAccount" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="备注"  >
                            <el-input v-model="form.remark" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否为交易会员"  >
                            <el-input v-model="form.isTradingMember" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="币种"  >
                            <el-input v-model="form.currency" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="出入金类型"  >
                            <el-input v-model="form.inoutType" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="出入金发生日期"  >
                            <el-input v-model="form.inoutDate" minlength=1></el-input>
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

<script src="./fundchg.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
</style>

