<template>
    <div class="app-container">
        <div class="block">
            <el-row :gutter="20">
                <el-col :span="4">
                    <el-date-picker
                        v-model="calDate"
                        type="date"
                        size="mini"
                        value-format="yyyy-MM-dd"
                        placeholder="选择日期"
                        v-permission="['/game/importinfo/cal']">
                    </el-date-picker>
                </el-col>
                <el-col :span="6">
                    <el-button type="primary"
                               size="mini"
                               @click.native="calData"
                               v-loading.fullscreen.lock="fullscreenLoading"
                               v-permission="['/game/importinfo/cal']">
                        计算结算数据
                    </el-button>
                </el-col>
            </el-row>
            <br>
            <el-row>
                <el-col :span="24">
<!--                    <el-button type="success" size="mini" icon="el-icon-plus" @click.native="add"-->
<!--                               v-permission="['/game/importinfo/add']">{{ $t('button.add') }}-->
<!--                    </el-button>-->
                    <el-upload
                        :action="uploadUrl"
                        :headers="uploadHeaders"
                        :before-upload="handleBeforeUpload"
                        :on-success="handleUploadSuccess"
                    >
                        <el-button type="success" size="mini" icon="el-icon-upload"
                                   v-permission="['/game/importinfo/import']">{{ $t('button.import') }}
                        </el-button>
                    </el-upload>

                    <!--                    <el-button type="primary" size="mini" icon="el-icon-edit" @click.native="edit"-->
                    <!--                               v-permission="['/game/importinfo/update']">{{ $t('button.edit') }}-->
                    <!--                    </el-button>-->
                    <!--                    <el-button type="danger" size="mini" icon="el-icon-delete" @click.native="remove"-->
                    <!--                               v-permission="['/game/importinfo/delete']">{{ $t('button.delete') }}-->
                    <!--                    </el-button>-->
                </el-col>
            </el-row>
        </div>


        <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" stripe border
                  highlight-current-row
                  @current-change="handleCurrentChange">
            <el-table-column label="ID" width="80px">
                <template slot-scope="scope">
                    {{scope.row.id}}
                </template>
            </el-table-column>
            <el-table-column label="上传时间" width="180px">
                <template slot-scope="scope">
                    {{scope.row.createTime}}
                </template>
            </el-table-column>
            <el-table-column label="文件名">
                <template slot-scope="scope">
                    {{scope.row.fileName}}
                </template>
            </el-table-column>
            <el-table-column label="文件名">
                <template slot-scope="scope">
                    {{scope.row.realFileName}}
                </template>
            </el-table-column>
            <el-table-column label="文件状态" width="180px">
                <template slot-scope="scope">
                    {{scope.row.fileStatus}}
                </template>
            </el-table-column>
            <el-table-column label="操作" width="80px">
                <template slot-scope="scope">
                    <!--                    <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)"-->
                    <!--                               v-permission="['/game/importinfo/update']">{{ $t('button.edit') }}-->
                    <!--                    </el-button>-->
                    <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)"
                               v-permission="['/game/importinfo/delete']">{{ $t('button.delete') }}
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
                        <el-form-item label="文件名">
                            <el-input v-model="form.fileName" minlength=1></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="文件状态">
                            <el-input v-model="form.fileStatus" minlength=1></el-input>
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

<script src="./importInfo.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
    @import "src/styles/common.scss";
</style>

