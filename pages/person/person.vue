<template>
	<view class="g-person">
		<person-card :datalist="datalist" @tapCard='handerlerClickCard' @LongTapCard='handelerLongTapCard'></person-card>
		<u-modal v-model="show" :content="content" :show-cancel-button="true" @confirm="deleteData"></u-modal>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				datalist: new Object(),
				show: false,
				content: '是否删除该记录',
				deleteItem: new Object()
			}
		},
		/**
		 * 方法说明 下拉刷新
		 * @param 
		 * Date 2020-7-19 12:23:11
		 */
		onPullDownRefresh() {
			this.datalist = uni.getStorageSync('LocationDataList');
			uni.stopPullDownRefresh();
			setTimeout(function() {
				uni.stopPullDownRefresh();
			}, 10000);
		},
		onShow() {
			this.datalist = uni.getStorageSync('LocationDataList');
		},
		methods: {
			/**
			 * 方法说明 点击card跳转到详情页面
			 * @param 
			 * Date 2020-7-21 00:23:25
			 */
			handerlerClickCard(item) {
				console.log(item)
				uni.navigateTo({
					url: `../person_detail/person_detail?txid=${item.txid}`
				});
			},
			/**
			 * 方法说明 长按card方法
			 * @param 
			 * Date 2020-7-25 13:58:42
			 */
			handelerLongTapCard(item) {
				this.show = true
				this.deleteItem = item
			},
			/**
			 * 方法说明 删除记录
			 * @param 
			 * Date 2020-7-25 14:26:28
			 */
			deleteData() {
				this.datalist = this.datalist.filter(item => item.times != this.deleteItem.times)
				uni.setStorageSync('LocationDataList', this.datalist)
			}
		},
	}
</script>

<style scoped lang="scss">
	.g-person {
		min-height: 100vh;
	}
</style>
