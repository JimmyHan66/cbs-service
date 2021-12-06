<template>
    <div class="app-container">
        <div class="block">
            <el-row :gutter="20">
                <el-col :span="4">
                    <el-input v-model="listQuery.contestantName" size="mini" placeholder="请输入真实姓名"></el-input>
                </el-col>
                <el-col :span="4">
                    <el-input v-model="listQuery.fundAccount" size="mini" placeholder="请输入资金账号"></el-input>
                </el-col>
                <el-col :span="4">
                    <el-input v-model="listQuery.contestantPhoneNo" size="mini" placeholder="请输入电话号码"></el-input>
                </el-col>
                <el-col :span="4">
                    <el-select v-model="listQuery.isValid" size="mini" placeholder="是否有效">
                        <el-option
                            v-for="item in whetherList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                        </el-option>
                    </el-select>
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
                               v-permission="['/game/contestant/add']">{{ $t('button.add') }}
                    </el-button>
                    <el-button type="primary" size="mini" icon="el-icon-edit" @click.native="edit"
                               v-permission="['/game/contestant/update']">{{ $t('button.edit') }}
                    </el-button>
                    <el-button type="danger" size="mini" icon="el-icon-delete" @click.native="remove"
                               v-permission="['/game/contestant/delete']">{{ $t('button.delete') }}
                    </el-button>
                    <el-button type="info" size="mini" icon="el-icon-document" @click.native="exportXls"
                               v-permission="['/game/contestant/export']">{{ $t('button.export') }}
                    </el-button>
                </el-col>
            </el-row>
        </div>


        <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" stripe border
                  highlight-current-row
                  @current-change="handleCurrentChange">
            <el-table-column label="报名时间" width="95px">
                <template slot-scope="scope">
                    {{scope.row.createTime}}
                </template>
            </el-table-column>
            <el-table-column label="真实姓名" width="80px">
                <template slot-scope="scope">
                    {{scope.row.contestantName}}
                </template>
            </el-table-column>
            <el-table-column label="资金账号" width="95px">
                <template slot-scope="scope">
                    {{scope.row.fundAccount}}
                </template>
            </el-table-column>
            <el-table-column label="昵称" width="110px">
                <template slot-scope="scope">
                    {{scope.row.contestantNickname}}
                </template>
            </el-table-column>
            <el-table-column label="电话号码" width="110px">
                <template slot-scope="scope">
                    {{scope.row.contestantPhoneNo}}
                </template>
            </el-table-column>
            <el-table-column label="地址" width="110px">
                <template slot-scope="scope">
                    {{scope.row.contestantAddress}}
                </template>
            </el-table-column>
            <el-table-column label="指导老师" width="80px">
                <template slot-scope="scope">
                    {{scope.row.teacher}}
                </template>
            </el-table-column>
            <el-table-column label="是否量化" width="80px">
                <template slot-scope="scope">
                    {{scope.row.isQuantifyName}}
                </template>
            </el-table-column>
            <el-table-column label="是否对冲套利" width="110px">
                <template slot-scope="scope">
                    {{scope.row.isHedgeArbitrageName}}
                </template>
            </el-table-column>
            <el-table-column label="是否机构" width="80px">
                <template slot-scope="scope">
                    {{scope.row.isAgencyName}}
                </template>
            </el-table-column>
            <el-table-column label="机构产品备案号" width="135px">
                <template slot-scope="scope">
                    {{scope.row.agencyNo}}
                </template>
            </el-table-column>
            <el-table-column label="是否有效" width="80px">
                <template slot-scope="scope">
                    {{scope.row.isValidName}}
                </template>
            </el-table-column>
<!--            <el-table-column label="来源渠道" width="80px">-->
<!--                <template slot-scope="scope">-->
<!--                    {{scope.row.channel}}-->
<!--                </template>-->
<!--            </el-table-column>-->
            <el-table-column label="备注">
                <template slot-scope="scope">
                    {{scope.row.remark}}
                </template>
            </el-table-column>
            <el-table-column label="操作" width="80px">
                <template slot-scope="scope">
                    <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)"
                               v-permission="['/game/contestant/update']">{{ $t('button.edit') }}
                    </el-button>
                    <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)"
                               v-permission="['/game/contestant/delete']">{{ $t('button.delete') }}
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
            <el-form ref="form" :model="form" :rules="rules" label-width="120px">
                <el-row>
                    <el-col :span="12">
                        <el-form-item label="真实姓名">
                            <el-input v-model="form.contestantName" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="资金账号">
                            <el-input v-model="form.fundAccount" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="昵称">
                            <el-input v-model="form.contestantNickname" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="电话号码">
                            <el-input v-model="form.contestantPhoneNo" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="地址">
                            <el-input v-model="form.contestantAddress" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="指导老师">
                            <el-input v-model="form.teacher" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否量化">
                            <el-select v-model="form.isQuantify" placeholder="是否量化">
                                <el-option
                                    v-for="item in whetherList"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否对冲套利">
                            <el-select v-model="form.isHedgeArbitrage" placeholder="是否对冲套利">
                                <el-option
                                    v-for="item in whetherList"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否机构">
                            <el-select v-model="form.isAgency" placeholder="是否机构">
                                <el-option
                                    v-for="item in whetherList"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="机构产品备案号">
                            <el-input v-model="form.agencyNo" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否有效">
                            <el-select v-model="form.isValid" placeholder="是否有效">
                                <el-option
                                    v-for="item in whetherList"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <!--                    <el-col :span="12">-->
                    <!--                        <el-form-item label="来源渠道"  >-->
                    <!--                            <el-input v-model="form.channel" minlength=1></el-input>-->
                    <!--                        </el-form-item>-->
                    <!--                    </el-col>-->
                    <el-col :span="24">
                        <el-form-item label="备注">
                            <el-input v-model="form.remark" type="textarea"></el-input>
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

<script src="./contestant.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
</style>

