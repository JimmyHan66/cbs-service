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
                    <el-button type="success" size="mini"  icon="el-icon-plus" @click.native="add" v-permission="['/game/trddata/add']">{{ $t('button.add') }}</el-button>
                    <el-button type="primary" size="mini"  icon="el-icon-edit" @click.native="edit" v-permission="['/game/trddata/update']">{{ $t('button.edit') }}</el-button>
                    <el-button type="danger" size="mini"  icon="el-icon-delete" @click.native="remove" v-permission="['/game/trddata/delete']">{{ $t('button.delete') }}</el-button>
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
            <el-table-column label="成交流水号">
                <template slot-scope="scope">
                    {{scope.row.dealNo}}
                </template>
            </el-table-column>
            <el-table-column label="品种合约">
                <template slot-scope="scope">
                    {{scope.row.contract}}
                </template>
            </el-table-column>
            <el-table-column label="买卖标志">
                <template slot-scope="scope">
                    {{scope.row.tradeFlag}}
                </template>
            </el-table-column>
            <el-table-column label="成交时间">
                <template slot-scope="scope">
                    {{scope.row.dealTime}}
                </template>
            </el-table-column>
            <el-table-column label="投机套保标志">
                <template slot-scope="scope">
                    {{scope.row.speculateFlag}}
                </template>
            </el-table-column>
            <el-table-column label="交易编码">
                <template slot-scope="scope">
                    {{scope.row.tradeCode}}
                </template>
            </el-table-column>
            <el-table-column label="交易所统一标识">
                <template slot-scope="scope">
                    {{scope.row.marketFlag}}
                </template>
            </el-table-column>
            <el-table-column label="是否为交易会员">
                <template slot-scope="scope">
                    {{scope.row.isTradingMember}}
                </template>
            </el-table-column>
            <el-table-column label="报单号">
                <template slot-scope="scope">
                    {{scope.row.reportCode}}
                </template>
            </el-table-column>
            <el-table-column label="席位号">
                <template slot-scope="scope">
                    {{scope.row.seatCode}}
                </template>
            </el-table-column>
            <el-table-column label="币种">
                <template slot-scope="scope">
                    {{scope.row.currency}}
                </template>
            </el-table-column>
            <el-table-column label="成交日期">
                <template slot-scope="scope">
                    {{scope.row.dealDate}}
                </template>
            </el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)" v-permission="['/game/trddata/update']">{{ $t('button.edit') }}</el-button>
                    <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)" v-permission="['/game/trddata/delete']">{{ $t('button.delete') }}</el-button>
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
                        <el-form-item label="成交流水号"  >
                            <el-input v-model="form.dealNo" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="品种合约"  >
                            <el-input v-model="form.contract" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="买卖标志"  >
                            <el-input v-model="form.tradeFlag" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="成交时间"  >
                            <el-input v-model="form.dealTime" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="投机套保标志"  >
                            <el-input v-model="form.speculateFlag" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="交易编码"  >
                            <el-input v-model="form.tradeCode" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="交易所统一标识"  >
                            <el-input v-model="form.marketFlag" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否为交易会员"  >
                            <el-input v-model="form.isTradingMember" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="报单号"  >
                            <el-input v-model="form.reportCode" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="席位号"  >
                            <el-input v-model="form.seatCode" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="币种"  >
                            <el-input v-model="form.currency" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="成交日期"  >
                            <el-input v-model="form.dealDate" minlength=1></el-input>
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

<script src="./trddata.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
</style>

