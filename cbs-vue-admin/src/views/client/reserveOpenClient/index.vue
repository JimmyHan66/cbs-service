<template>
    <div class="app-container">
        <div class="block">
            <el-row :gutter="20">
                <el-col :span="2">
                    <el-input v-model="listQuery.clientName" size="mini" placeholder="请输入客户姓名"></el-input>
                </el-col>
                <el-col :span="2">
                    <el-input v-model="listQuery.fundAccount" size="mini" placeholder="请输入资金账号"></el-input>
                </el-col>
                <el-col :span="2">
                    <el-input v-model="listQuery.clientPhoneNo" size="mini" placeholder="请输入客户手机号码"></el-input>
                </el-col>
                <el-col :span="2">
                    <el-select v-model="listQuery.isOpenSuccess" size="mini" placeholder="是否开户成功">
                        <el-option
                            v-for="item in whetherList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </el-col>
                <el-col :span="2">
                    <el-select v-model="listQuery.isHistory" size="mini" placeholder="是否回访">
                        <el-option
                            v-for="item in whetherList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </el-col>
                <el-col :span="2">
                    <el-select v-model="listQuery.channel" size="mini" placeholder="来源渠道">
                        <el-option
                            v-for="item in channelList"
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
                        start-placeholder="预约开始时间"
                        end-placeholder="预约结束时间">
                    </el-date-picker>
                </el-col>
                <el-col :span="4">
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
                               v-permission="['/reserveOpenClient/add']">{{
                        $t('button.add') }}
                    </el-button>
                    <el-button type="primary" size="mini" icon="el-icon-edit" @click.native="edit"
                               v-permission="['/reserveOpenClient/edit']">{{
                        $t('button.edit') }}
                    </el-button>
                    <el-button type="danger" size="mini" icon="el-icon-delete" @click.native="remove"
                               v-permission="['/reserveOpenClient/delete']">{{ $t('button.delete') }}
                    </el-button>
                    <el-button type="info" size="mini" icon="el-icon-document" @click.native="exportToXls"
                               v-permission="['/client/reserveopenclient/export']">{{ $t('button.export') }}
                    </el-button>
                </el-col>
            </el-row>
        </div>


        <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" stripe border highlight-current-row
                  @current-change="handleCurrentChange">
            <!--            <el-table-column label="流水号">-->
            <!--                <template slot-scope="scope">-->
            <!--                    {{scope.row.serialNo}}-->
            <!--                </template>-->
            <!--            </el-table-column>-->
            <el-table-column label="预约时间" width="95px">
                <template slot-scope="scope">
                    {{scope.row.createTime}}
                </template>
            </el-table-column>
            <el-table-column label="客户姓名" width="80px">
                <template slot-scope="scope">
                    {{scope.row.clientName}}
                </template>
            </el-table-column>
            <el-table-column label="性别" width="50px">
                <template slot-scope="scope">
                    {{scope.row.sexName}}
                </template>
            </el-table-column>
            <!--            <el-table-column label="身份证号码">-->
            <!--                <template slot-scope="scope">-->
            <!--                    {{scope.row.idNumber}}-->
            <!--                </template>-->
            <!--            </el-table-column>-->
            <el-table-column label="客户电话号码" width="110px">
                <template slot-scope="scope">
                    {{scope.row.clientPhoneNo}}
                </template>
            </el-table-column>
            <!--            <el-table-column label="客户地址">-->
            <!--                <template slot-scope="scope">-->
            <!--                    {{scope.row.clientAddress}}-->
            <!--                </template>-->
            <!--            </el-table-column>-->
            <el-table-column label="开户类型" width="80px">
                <template slot-scope="scope">
                    {{scope.row.openTypeName}}
                </template>
            </el-table-column>
            <el-table-column label="开户网点" width="110px">
                <template slot-scope="scope">
                    {{scope.row.openBranch}}
                </template>
            </el-table-column>
            <el-table-column label="客户类型" width="80px">
                <template slot-scope="scope">
                    {{scope.row.clientTypeName}}
                </template>
            </el-table-column>
            <!--            <el-table-column label="是否在其它期货公司开户">-->
            <!--                <template slot-scope="scope">-->
            <!--                    {{scope.row.isOpenInOthersName}}-->
            <!--                </template>-->
            <!--            </el-table-column>-->
            <el-table-column label="是否在本公司开户" width="135px">
                <template slot-scope="scope">
                    {{scope.row.isOpenInHereName}}
                </template>
            </el-table-column>
            <el-table-column label="是否开户成功" width="135px">
                <template slot-scope="scope">
                    {{scope.row.isOpenSuccessName}}
                </template>
            </el-table-column>
            <el-table-column label="是否回访" width="80px">
                <template slot-scope="scope">
                    {{scope.row.isHistoryName}}
                </template>
            </el-table-column>
            <el-table-column label="来源渠道" width="95px">
                <template slot-scope="scope">
                    {{scope.row.channel}}
                </template>
            </el-table-column>
            <el-table-column label="开户日期" width="95px">
                <template slot-scope="scope">
                    {{scope.row.openDateFormat}}
                </template>
            </el-table-column>
            <el-table-column label="资金账号" width="95px">
                <template slot-scope="scope">
                    {{scope.row.fundAccount}}
                </template>
            </el-table-column>
            <el-table-column label="推荐人" width="80px">
                <template slot-scope="scope">
                    {{scope.row.referrer}}
                </template>
            </el-table-column>
            <el-table-column label="备注">
                <template slot-scope="scope">
                    {{scope.row.remark}}
                </template>
            </el-table-column>

            <el-table-column label="操作" width="80px">
                <template slot-scope="scope">
                    <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)"
                               v-permission="['/reserveOpenClient/edit']">{{ $t('button.edit') }}
                    </el-button>
                    <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)"
                               v-permission="['/reserveOpenClient/delete']">{{ $t('button.delete') }}
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
                        <el-form-item label="流水号">
                            <el-input v-model="form.serialNo" minlength=1 :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="业务日期">
                            <el-input v-model="form.createTime" minlength=1 :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="客户姓名">
                            <el-input v-model="form.clientName" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="性别">
                            <dict-select dictName="性别"
                                         v-model="form.sex"
                                         @change="changeSex"
                                         placeholder="请选择性别">
                            </dict-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="身份证号码">
                            <el-input v-model="form.idNumber" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="客户电话号码">
                            <el-input v-model="form.clientPhoneNo" minlength=1 :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="客户地址">
                            <el-input v-model="form.clientAddress" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="开户类型">
                            <dict-select dictName="开户类型"
                                         v-model="form.openType"
                                         @change="changeOpenType"
                                         placeholder="请选择开户类型">
                            </dict-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="开户网点">
                            <el-input v-model="form.openBranch" minlength=1 :disabled="true"></el-input>
                        </el-form-item>
                    </el-col>
                    <!--                    <el-col :span="12">-->
                    <!--                        <el-form-item label="部门序号"  >-->
                    <!--                            <el-input v-model="form.deptId" minlength=1></el-input>-->
                    <!--                        </el-form-item>-->
                    <!--                    </el-col>-->
                    <el-col :span="12">
                        <el-form-item label="客户类型">
                            <dict-select dictName="客户类型"
                                         v-model="form.clientType"
                                         @change="changeClientType"
                                         placeholder="请选择客户类型">
                            </dict-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否在其它期货公司开户">
                            <el-select v-model="form.isOpenInOthers" placeholder="是否在其它期货公司开户">
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
                        <el-form-item label="是否在本公司开户">
                            <el-select v-model="form.isOpenInHere" placeholder="是否在本公司开户">
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
                        <el-form-item label="是否开户成功">
                            <el-select v-model="form.isOpenSuccess" placeholder="是否开户成功">
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
                        <el-form-item label="是否回访">
                            <el-select v-model="form.isHistory" placeholder="是否回访">
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
                        <el-form-item label="来源渠道">
                            <el-input v-model="form.channel" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="开户日期">
                            <el-date-picker
                                v-model="form.openDate"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="选择日期">
                            </el-date-picker>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="资金账号">
                            <el-input v-model="form.fundAccount" placeholder="客户开户成功后填写" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="推荐人">
                            <el-input v-model="form.referrer" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
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

<script src="./reserveOpenClient.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
</style>

