<template>
    <div>
<!--        <x-header title="保证金公示"></x-header>-->
        <div>
            <img src="static/images/logo_ccfc.jpg">
        </div>
        <group title="查询条件" label-width="5em">
            <popup-picker title="交易所" v-model="marketNo"
                          :data="exchangeList"
                          :show-name="true"
                          :placeholder="'请选择交易所'"
                          @on-change="exchangeChange"></popup-picker>
            <popup-picker title="品种" v-model="contractCode"
                          :data="varietyList"
                          :show-name="true"
                          :placeholder="'请选择品种'"
                          @on-change="varietyChange"></popup-picker>
        </group>
        <br>
        <divider style="font-size: large;font-weight:bold;">{{ marginTitle }}</divider>

        <group label-width="10em">
            <div v-for="item in marginList" :key= item.contractName>
                <cell
                    :title="item.contractName"
                    :value="item.contractCode"
                    is-link
                    :border-intent="false"
                    :arrow-direction="item.showContent ? 'up' : 'down'"
                    @click.native="item.showContent = !item.showContent"
                    style="font-weight:bold;"></cell>
                <template v-if="item.showContent">
<!--                    <cell-form-preview :border-intent="false" :list="item.list"></cell-form-preview>-->
<!--                    <x-button mini type="primary" style="display:block;margin:0 auto" @click.native="callcal(item)">-->
<!--                        计算保证金-->
<!--                    </x-button>-->
<!--                    <br>-->
                    <div style="padding:15px;">
                        <x-table full-bordered style="background-color:#fff;">
                            <thead>
                            <tr>
                                <th :width="60">合约</th>
                                <th>交易所(%)</th>
                                <th>公司(%)</th>
                                <th>涨跌幅(%)</th>
                                <th>备注</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>{{item.contractCode}}</td>
                                <td>{{item.exchangeMargin}}</td>
                                <td>{{item.companyMargin}}</td>
                                <td>{{item.quoteChange}}</td>
                                <td>{{item.remark}}</td>
                            </tr>
                            <tr v-for="it in item.specialMarginList" :key = it.specialContractCode>
                                <td>{{it.specialContractCode}}</td>
                                <td>{{it.exchangeMargin}}</td>
                                <td>{{it.companyMargin}}</td>
                                <td>{{it.quoteChange}}</td>
                                <td>{{it.remark}}</td>
                            </tr>
                            </tbody>
                        </x-table>
                        <br>
                        <x-button mini type="primary" style="display:block;margin:0 auto" @click.native="callcal(item)">
                            计算保证金
                        </x-button>
                    </div>
                </template>
            </div>
        </group>

        <br>
        <div style="color:#999999">
            <p>温馨提示：</p>
            <p>以上保证金计算仅作为估算参考，不做入市依据。</p>
        </div>
        <br>

        <div>
            <img src="static/images/wxcode_ccfc.png">
        </div>

        <div v-transfer-dom>
            <popup v-model="show">
                <div>
                    <group>
                        <x-input title="合约乘数" type="number" text-align="right" :readonly="true" v-model="multiplier">
                            <span slot="right">&nbsp;{{multiplierUnit}}</span>
                        </x-input>
                        <x-input title="最新价" type="number" text-align="right" v-model="lastPrice" :show-clear="false">
                            <span slot="right">&nbsp;{{priceUnit}}</span>
                        </x-input>
                        <x-input title="保证金率" type="number" text-align="right" v-model="marginRatio" :show-clear="false">
                            <span slot="right">&nbsp;%</span>
                        </x-input>
                        <x-input title="手数" type="number" text-align="right" v-model="amount" :show-clear="false">
                            <span slot="right">&nbsp;手</span>
                        </x-input>
                        <x-input title="所需保证金" type="number" text-align="right" :readonly="true" v-model="needMargin">
                            <span slot="right">&nbsp;元</span>
                        </x-input>

                        <br>
                        <flexbox>
                            <flexbox-item>
                                <x-button type="default" @click.native="show = false">取消</x-button>
                            </flexbox-item>
                            <flexbox-item>
                                <x-button type="primary" @click.native="calMargin">计算</x-button>
                            </flexbox-item>
                        </flexbox>
                        <br>
                    </group>
                </div>
            </popup>
        </div>

    </div>
</template>
<script src="./margin.js">
</script>
