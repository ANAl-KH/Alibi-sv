<template>
	<view class="g-person">
		<person-card :datalist="datalist" @tapCard='handerlerClickCard'></person-card>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				datalist: new Object(),
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
			handerlerClickCard(item){
				console.log(item)
				uni.navigateTo({
				    url: `../person_detail/person_detail?txid=${item.txid}`
				});
			},
		},
	}
</script>

<style scoped lang="scss">
	.g-person{
		min-height: 100vh;
	}
</style>

