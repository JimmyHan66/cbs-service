<template>
    <div class="app-container">
        <div class="block">
            <el-row :gutter="20">
                <el-col :span="4">
                    <el-date-picker
                        v-model="listQuery.riskDate"
                        type="date"
                        size="mini"
                        value-format="yyyy-MM-dd"
                        placeholder="选择日期">
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
                               v-permission="['/publicity/riskcalendar/add']">{{ $t('button.add') }}
                    </el-button>
                    <el-button type="primary" size="mini" icon="el-icon-edit" @click.native="edit"
                               v-permission="['/publicity/riskcalendar/update']">{{ $t('button.edit') }}
                    </el-button>
                    <el-button type="danger" size="mini" icon="el-icon-delete" @click.native="remove"
                               v-permission="['/publicity/riskcalendar/delete']">{{ $t('button.delete') }}
                    </el-button>
                </el-col>
            </el-row>
        </div>


        <el-table :data="list" v-loading="listLoading"
                  element-loading-text="Loading"
                  stripe
                  border
                  highlight-current-row
                  @current-change="handleCurrentChange">
            <el-table-column prop="date" label="风险提示日期" sortable width="140px">
                <template slot-scope="scope">
                    {{scope.row.riskDateFormat}}
                </template>
            </el-table-column>
            <!--            <el-table-column label="月份">-->
            <!--                <template slot-scope="scope">-->
            <!--                    {{scope.row.month}}-->
            <!--                </template>-->
            <!--            </el-table-column>-->
            <el-table-column label="是否表示休假" width="120px">
                <template slot-scope="scope">
                    {{scope.row.isClosedName}}
                </template>
            </el-table-column>
            <el-table-column label="是否表示今日无夜盘" width="150px">
                <template slot-scope="scope">
                    {{scope.row.isNoNightName}}
                </template>
            </el-table-column>
            <!--            <el-table-column label="是否有风控提示内容">-->
            <!--                <template slot-scope="scope">-->
            <!--                    {{scope.row.isContent}}-->
            <!--                </template>-->
            <!--            </el-table-column>-->
            <el-table-column label="风险提示内容">
                <template slot-scope="scope">
                    {{scope.row.riskContent}}
                </template>
            </el-table-column>
            <el-table-column label="操作" width="150px">
                <template slot-scope="scope">
                    <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)"
                               v-permission="['/publicity/riskcalendar/update']">{{ $t('button.edit') }}
                    </el-button>
                    <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)"
                               v-permission="['/publicity/riskcalendar/delete']">{{ $t('button.delete') }}
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
                        <el-form-item label="风险提示日期" prop="riskDate">
                            <el-date-picker
                                v-model="form.riskDate"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="选择日期"
                                @change="riskDateChange">
                            </el-date-picker>
                        </el-form-item>
                    </el-col>
                    <el-col :span="7">
                        <el-form-item label="所属月份" prop="month">
                            <el-input v-model="form.month" :disabled="true" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="是否表示休假" prop="isClosed">
                            <el-select v-model="form.isClosed" placeholder="是则显示休假标志">
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
                        <el-form-item label="是否表示今日无夜盘" prop="isNoNight">
                            <el-select v-model="form.isNoNight" placeholder="是则显示无夜盘标志">
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
                    <!--                        <el-form-item label="是否有风控提示内容"  >-->
                    <!--                            <el-input v-model="form.isContent" minlength=1></el-input>-->
                    <!--                        </el-form-item>-->
                    <!--                    </el-col>-->
                    <el-col :span="24">
                        <el-form-item label="风险提示内容" prop="riskContent">
                            <el-input v-model="form.riskContent" type="textarea"></el-input>
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

<script src="./riskCalendar.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
</style>

